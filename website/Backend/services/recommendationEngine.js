// recommendationEngine.js
// AI Recommendation Engine implementing content-based, collaborative, hybrid recommendations, and cold-start support
// Caches computed recommendations using RedisService

const db = require("../db");
const redis = require("./redisService");

class RecommendationEngine {
  // 1. Content-Based Recommendations (Similar products in category/brand)
  async getRelatedProducts(productId) {
    const cacheKey = `rec:related:${productId}`;
    const cached = redis.get(cacheKey);
    if (cached) return cached;

    // Fetch product's category and brand
    const pInfo = await db.queryOne("SELECT category_id, brand_id FROM products WHERE product_id = ?", [productId]);
    if (!pInfo) return [];

    const categoryId = pInfo.category_id;
    const brandId = pInfo.brand_id;

    // Rank other products in the same category, prioritizing the same brand
    const rows = await db.queryAll(
      `
      SELECT TOP 6 p.product_id, p.product_name AS name, p.avg_rating, pr.price, p.total_reviews,
             (SELECT TOP 1 name FROM brands WHERE brand_id = p.brand_id) AS brand_name,
             (SELECT TOP 1 image_url FROM product_images WHERE product_id = p.product_id ORDER BY is_primary DESC, image_id ASC) AS image_url,
             CASE WHEN p.brand_id = ? THEN 1 ELSE 0 END AS brand_match
      FROM products p
      OUTER APPLY (
        SELECT TOP 1 price FROM product_prices WHERE product_id = p.product_id ORDER BY start_date DESC
      ) pr
      WHERE p.category_id = ? AND p.product_id <> ? AND pr.price IS NOT NULL
      ORDER BY brand_match DESC, p.avg_rating DESC, p.total_reviews DESC
      `,
      [brandId || 0, categoryId, productId]
    );

    redis.set(cacheKey, rows, 60); // cache for 60 seconds
    return rows;
  }

  // 2. Collaborative Filtering (Customers Also Bought)
  async getBoughtTogether(productId) {
    const cacheKey = `rec:bought:${productId}`;
    const cached = redis.get(cacheKey);
    if (cached) return cached;

    // Find other products co-purchased in transactions
    let rows = await db.queryAll(
      `
      SELECT DISTINCT TOP 6 p.product_id, p.product_name AS name, p.avg_rating, pr.price, p.total_reviews,
             (SELECT TOP 1 name FROM brands WHERE brand_id = p.brand_id) AS brand_name,
             (SELECT TOP 1 image_url FROM product_images WHERE product_id = p.product_id ORDER BY is_primary DESC, image_id ASC) AS image_url,
             COUNT(ti2.transaction_id) AS co_occurrence
      FROM transaction_items ti1
      INNER JOIN transaction_items ti2 ON ti1.transaction_id = ti2.transaction_id
      INNER JOIN products p ON ti2.product_id = p.product_id
      OUTER APPLY (
        SELECT TOP 1 price FROM product_prices WHERE product_id = p.product_id ORDER BY start_date DESC
      ) pr
      WHERE ti1.product_id = ? AND ti2.product_id <> ? AND pr.price IS NOT NULL
      GROUP BY p.product_id, p.product_name, p.avg_rating, pr.price, p.total_reviews, p.brand_id
      ORDER BY co_occurrence DESC, p.avg_rating DESC
      `,
      [productId, productId]
    );

    // Fallback to related items if no co-occurrence exists
    if (!rows || rows.length === 0) {
      rows = await this.getRelatedProducts(productId);
    }

    redis.set(cacheKey, rows, 60);
    return rows;
  }

  // 3. Hybrid Recommendations (Recommended For You)
  async getPersonalizedRecommendations(userId) {
    if (!userId) {
      return this.getTrendingProducts(6); // Cold start fallback for guest users
    }

    const cacheKey = `rec:foryou:${userId}`;
    const cached = redis.get(cacheKey);
    if (cached) return cached;

    // 1. Find user's top categories based on interaction history (from real-time Spark analytics table)
    const interests = await db.queryAll(
      "SELECT TOP 2 category_id, interaction_count FROM spark_user_interests WHERE user_id = ? ORDER BY interaction_count DESC",
      [userId]
    );

    let rows = [];
    if (interests && interests.length > 0) {
      const catIds = interests.map(i => Number(i.category_id));
      const placeholders = catIds.map(() => "?").join(",");

      // Fetch top products in their interested categories, excluding products they already purchased
      rows = await db.queryAll(
        `
        SELECT TOP 6 p.product_id, p.product_name AS name, p.avg_rating, pr.price, p.total_reviews,
               (SELECT TOP 1 name FROM brands WHERE brand_id = p.brand_id) AS brand_name,
               (SELECT TOP 1 image_url FROM product_images WHERE product_id = p.product_id ORDER BY is_primary DESC, image_id ASC) AS image_url
        FROM products p
        OUTER APPLY (
          SELECT TOP 1 price FROM product_prices WHERE product_id = p.product_id ORDER BY start_date DESC
        ) pr
        WHERE p.category_id IN (${placeholders}) 
          AND pr.price IS NOT NULL
          AND p.product_id NOT IN (
            SELECT DISTINCT ti.product_id 
            FROM transactions t
            INNER JOIN transaction_items ti ON t.transaction_id = ti.transaction_id
            WHERE t.user_id = ?
          )
        ORDER BY p.avg_rating DESC, p.total_reviews DESC
        `,
        [...catIds, userId]
      );
    }

    // 2. Fallback or pad with general trending products if personalized recommendations are sparse (< 4 items)
    if (!rows || rows.length < 4) {
      const trending = await this.getTrendingProducts(6);
      const existingIds = new Set(rows.map(r => r.product_id));
      for (const item of trending) {
        if (!existingIds.has(item.product_id) && rows.length < 6) {
          rows.push(item);
        }
      }
    }

    redis.set(cacheKey, rows, 30); // cache for 30 seconds
    return rows;
  }

  // 4. Trending Products (based on Spark Streaming real-time window scores)
  async getTrendingProducts(limit = 6) {
    const cacheKey = `rec:trending:${limit}`;
    const cached = redis.get(cacheKey);
    if (cached) return cached;

    // Fetch highest scored products from Spark's database table
    let rows = await db.queryAll(
      `
      SELECT TOP ${Number(limit)} p.product_id, p.product_name AS name, p.avg_rating, pr.price, p.total_reviews,
             (SELECT TOP 1 name FROM brands WHERE brand_id = p.brand_id) AS brand_name,
             (SELECT TOP 1 image_url FROM product_images WHERE product_id = p.product_id ORDER BY is_primary DESC, image_id ASC) AS image_url,
             s.score AS trending_score
      FROM spark_trending_products s
      INNER JOIN products p ON s.product_id = p.product_id
      OUTER APPLY (
        SELECT TOP 1 price FROM product_prices WHERE product_id = p.product_id ORDER BY start_date DESC
      ) pr
      WHERE pr.price IS NOT NULL
      ORDER BY s.score DESC, p.avg_rating DESC
      `
    );

    // Fallback if Spark table is empty (e.g. at system startup or no events have been processed yet)
    if (!rows || rows.length === 0) {
      rows = await db.queryAll(
        `
        SELECT TOP ${Number(limit)} p.product_id, p.product_name AS name, p.avg_rating, pr.price, p.total_reviews,
               (SELECT TOP 1 name FROM brands WHERE brand_id = p.brand_id) AS brand_name,
               (SELECT TOP 1 image_url FROM product_images WHERE product_id = p.product_id ORDER BY is_primary DESC, image_id ASC) AS image_url,
               p.avg_rating * p.total_reviews AS trending_score
        FROM products p
        OUTER APPLY (
          SELECT TOP 1 price FROM product_prices WHERE product_id = p.product_id ORDER BY start_date DESC
        ) pr
        WHERE pr.price IS NOT NULL
        ORDER BY trending_score DESC, p.avg_rating DESC
        `
      );
    }

    redis.set(cacheKey, rows, 15); // cache trending products for 15 seconds
    return rows;
  }
}

module.exports = new RecommendationEngine();
