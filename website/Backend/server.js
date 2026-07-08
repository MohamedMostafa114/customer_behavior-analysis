const http = require("node:http");
const crypto = require("node:crypto");
const { URL } = require("node:url");
const { queryAll, queryOne, execute } = require("./db");

const kafka = require("./services/kafkaService");
const spark = require("./services/sparkStreamingService");
const redis = require("./services/redisService");
const recs = require("./services/recommendationEngine");

let apiLatencies = [];
function logLatency(ms) {
  apiLatencies.push(ms);
  if (apiLatencies.length > 100) apiLatencies.shift();
}
function getAvgApiLatency() {
  if (apiLatencies.length === 0) return 12; // baseline default
  const sum = apiLatencies.reduce((a, b) => a + b, 0);
  return Math.round(sum / apiLatencies.length);
}

const PORT = Number(process.env.PORT || 5000);

function sendJson(res, status, payload) {
  res.writeHead(status, {
    "Content-Type": "application/json",
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Headers": "Content-Type, Authorization",
    "Access-Control-Allow-Methods": "GET, POST, OPTIONS"
  });
  res.end(JSON.stringify(payload));
}

function hashPassword(password) {
  return crypto.createHash("sha256").update(password, "utf8").digest("hex");
}

function getBearerToken(req) {
  const auth = req.headers.authorization || "";
  return auth.replace(/^Bearer\s+/i, "");
}

async function readBody(req) {
  return new Promise((resolve, reject) => {
    let data = "";
    req.on("data", (chunk) => {
      data += chunk;
      if (data.length > 2 * 1024 * 1024) {
        reject(new Error("Payload too large"));
      }
    });
    req.on("end", () => {
      if (!data) {
        resolve({});
        return;
      }
      try {
        resolve(JSON.parse(data));
      } catch {
        reject(new Error("Invalid JSON body"));
      }
    });
    req.on("error", reject);
  });
}

async function userIdFromToken(token) {
  if (!token) return null;
  // Check Redis session cache first
  const cachedUserId = redis.get(`session:${token}`);
  if (cachedUserId) return Number(cachedUserId);

  const session = await queryOne("SELECT user_id FROM user_tokens WHERE token = ?", [token]);
  if (session) {
    const userId = Number(session.user_id);
    redis.set(`session:${token}`, userId, 3600); // cache session for 1 hour
    return userId;
  }
  return null;
}

async function getCartContextForUser(userId) {
  const existing = await queryOne(
    `
    SELECT TOP 1 cs.cart_id, cs.session_id
    FROM cart_sessions cs
    INNER JOIN sessions s ON s.session_id = cs.session_id
    WHERE s.user_id = ?
      AND (cs.is_abandoned = 0 OR cs.is_abandoned IS NULL)
    ORDER BY cs.created_at DESC
    `,
    [userId]
  );

  if (existing) {
    return { cartId: Number(existing.cart_id), sessionId: Number(existing.session_id) };
  }

  const sessionId = await execute(
    "INSERT INTO sessions (user_id, start_time, created_at) VALUES (?, GETDATE(), GETDATE())",
    [userId]
  );
  const cartId = await execute(
    "INSERT INTO cart_sessions (session_id, created_at, is_abandoned) VALUES (?, GETDATE(), 0)",
    [sessionId]
  );
  return { cartId: Number(cartId), sessionId: Number(sessionId) };
}

async function handleRequest(req, res) {
  const url = new URL(req.url, `http://${req.headers.host || "localhost"}`);
  const path = url.pathname;
  const method = req.method || "GET";

  if (method === "OPTIONS") {
    sendJson(res, 200, { success: true });
    return;
  }

  // 1. SIGNUP
  if (method === "POST" && path === "/api/signup") {
    const body = await readBody(req);
    const firstName = String(body.first_name || "").trim();
    const lastName = String(body.last_name || "").trim();
    const email = String(body.email || "").trim().toLowerCase();
    const password = String(body.password || "");
    if (!firstName || !lastName || !email || !password) {
      sendJson(res, 400, { success: false, error: "All fields are required" });
      return;
    }

    const exists = await queryOne("SELECT user_id FROM users WHERE email = ?", [email]);
    if (exists) {
      sendJson(res, 409, { success: false, error: "Email already exists" });
      return;
    }

    const userId = await execute(
      "INSERT INTO users (first_name, last_name, email, password_hash, is_active, created_at) VALUES (?, ?, ?, ?, 1, GETDATE())",
      [firstName, lastName, email, hashPassword(password)]
    );
    const token = crypto.randomBytes(24).toString("hex");
    await execute("INSERT INTO user_tokens (user_id, token, created_at) VALUES (?, ?, GETDATE())", [userId, token]);

    // Kafka event and Redis cache session
    kafka.publish("user-logins", { event_type: "signup", user_id: Number(userId) });
    redis.set(`session:${token}`, Number(userId), 3600);

    sendJson(res, 201, { success: true, token, user_id: Number(userId) });
    return;
  }

  // 2. LOGIN
  if (method === "POST" && path === "/api/login") {
    const body = await readBody(req);
    const email = String(body.email || "").trim().toLowerCase();
    const password = String(body.password || "");
    if (!email || !password) {
      sendJson(res, 400, { success: false, error: "Email and password are required" });
      return;
    }

    const user = await queryOne("SELECT user_id, password_hash FROM users WHERE email = ? AND (is_deleted = 0 OR is_deleted IS NULL)", [email]);
    if (!user || user.password_hash !== hashPassword(password)) {
      sendJson(res, 401, { success: false, error: "Invalid credentials" });
      return;
    }

    const token = crypto.randomBytes(24).toString("hex");
    await execute("INSERT INTO user_tokens (user_id, token, created_at) VALUES (?, ?, GETDATE())", [user.user_id, token]);

    // Kafka event and Redis cache session
    kafka.publish("user-logins", { event_type: "login", user_id: Number(user.user_id) });
    redis.set(`session:${token}`, Number(user.user_id), 3600);

    sendJson(res, 200, { success: true, token, user_id: Number(user.user_id) });
    return;
  }

  // 3. LOGOUT
  if (method === "POST" && path === "/api/logout") {
    const token = getBearerToken(req);
    if (token) {
      const userId = await userIdFromToken(token);
      if (userId) {
        kafka.publish("user-logins", { event_type: "logout", user_id: Number(userId) });
      }
      redis.del(`session:${token}`);
      await execute("DELETE FROM user_tokens WHERE token = ?", [token]);
    }
    sendJson(res, 200, { success: true, message: "Logged out successfully" });
    return;
  }

  // 4. GET ALL PRODUCTS
  if (method === "GET" && path === "/api/products") {
    const searchQuery = url.searchParams.get("search") || "";
    const userId = await userIdFromToken(getBearerToken(req));

    // Log search telemetry to Kafka
    if (searchQuery) {
      kafka.publish("user-events", { event_type: "search", user_id: userId, properties: searchQuery });
    }

    let queryText = `
      SELECT p.product_id, p.product_name, pd.description, p.avg_rating, p.stock_quantity, pr.price, b.name AS brand_name,
             c.name AS category_name, p.total_reviews, p.views_count, p.sold_count, p.created_at, p.updated_at,
             (SELECT TOP 1 image_url FROM product_images WHERE product_id = p.product_id ORDER BY is_primary DESC, image_id ASC) AS image_url
      FROM products p
      LEFT JOIN product_details pd ON p.product_id = pd.product_id
      LEFT JOIN brands b ON p.brand_id = b.brand_id
      LEFT JOIN categories c ON p.category_id = c.category_id
      OUTER APPLY (
        SELECT TOP 1 price
        FROM product_prices
        WHERE product_id = p.product_id
        ORDER BY start_date DESC
      ) pr
      WHERE pr.price IS NOT NULL
    `;
    const params = [];
    if (searchQuery) {
      queryText += " AND (p.product_name LIKE ? OR pd.description LIKE ? OR b.name LIKE ?)";
      const wild = `%${searchQuery}%`;
      params.push(wild, wild, wild);
    }
    queryText += " ORDER BY p.product_name ASC";
    const rows = await queryAll(queryText, params);
    sendJson(res, 200, { success: true, data: rows });
    return;
  }

  // 4a. GET BEST-SELLING PRODUCTS
  if (method === "GET" && (path === "/api/products/best-selling" || path === "/products/best-selling")) {
    try {
      const rows = await queryAll(`
        SELECT p.product_id, p.product_name, pd.description, p.avg_rating, p.stock_quantity, pr.price, b.name AS brand_name,
               c.name AS category_name, p.total_reviews, p.views_count, p.sold_count, p.created_at, p.updated_at,
               (SELECT TOP 1 image_url FROM product_images WHERE product_id = p.product_id ORDER BY is_primary DESC, image_id ASC) AS image_url
        FROM products p
        LEFT JOIN product_details pd ON p.product_id = pd.product_id
        LEFT JOIN brands b ON p.brand_id = b.brand_id
        LEFT JOIN categories c ON p.category_id = c.category_id
        OUTER APPLY (
          SELECT TOP 1 price FROM product_prices WHERE product_id = p.product_id ORDER BY start_date DESC
        ) pr
        WHERE pr.price IS NOT NULL
        ORDER BY p.sold_count DESC, p.product_name ASC
      `);
      sendJson(res, 200, { success: true, data: rows });
    } catch (err) {
      sendJson(res, 500, { success: false, error: err.message });
    }
    return;
  }

  // 4b. GET MOST-VIEWED PRODUCTS
  if (method === "GET" && (path === "/api/products/most-viewed" || path === "/products/most-viewed")) {
    try {
      const rows = await queryAll(`
        SELECT p.product_id, p.product_name, pd.description, p.avg_rating, p.stock_quantity, pr.price, b.name AS brand_name,
               c.name AS category_name, p.total_reviews, p.views_count, p.sold_count, p.created_at, p.updated_at,
               (SELECT TOP 1 image_url FROM product_images WHERE product_id = p.product_id ORDER BY is_primary DESC, image_id ASC) AS image_url
        FROM products p
        LEFT JOIN product_details pd ON p.product_id = pd.product_id
        LEFT JOIN brands b ON p.brand_id = b.brand_id
        LEFT JOIN categories c ON p.category_id = c.category_id
        OUTER APPLY (
          SELECT TOP 1 price FROM product_prices WHERE product_id = p.product_id ORDER BY start_date DESC
        ) pr
        WHERE pr.price IS NOT NULL
        ORDER BY p.views_count DESC, p.product_name ASC
      `);
      sendJson(res, 200, { success: true, data: rows });
    } catch (err) {
      sendJson(res, 500, { success: false, error: err.message });
    }
    return;
  }

  // 4c. GET LATEST PRODUCTS
  if (method === "GET" && (path === "/api/products/latest" || path === "/products/latest")) {
    try {
      const rows = await queryAll(`
        SELECT p.product_id, p.product_name, pd.description, p.avg_rating, p.stock_quantity, pr.price, b.name AS brand_name,
               c.name AS category_name, p.total_reviews, p.views_count, p.sold_count, p.created_at, p.updated_at,
               (SELECT TOP 1 image_url FROM product_images WHERE product_id = p.product_id ORDER BY is_primary DESC, image_id ASC) AS image_url
        FROM products p
        LEFT JOIN product_details pd ON p.product_id = pd.product_id
        LEFT JOIN brands b ON p.brand_id = b.brand_id
        LEFT JOIN categories c ON p.category_id = c.category_id
        OUTER APPLY (
          SELECT TOP 1 price FROM product_prices WHERE product_id = p.product_id ORDER BY start_date DESC
        ) pr
        WHERE pr.price IS NOT NULL
        ORDER BY p.created_at DESC, p.product_name ASC
      `);
      sendJson(res, 200, { success: true, data: rows });
    } catch (err) {
      sendJson(res, 500, { success: false, error: err.message });
    }
    return;
  }

  // 4d. PATCH PRODUCT VIEWS
  const viewsPatchMatch = path.match(/^\/api\/products\/(\d+)\/views$/) || path.match(/^\/products\/(\d+)\/views$/);
  if (method === "PATCH" && viewsPatchMatch) {
    const productId = Number(viewsPatchMatch[1]);
    try {
      await execute("UPDATE products SET views_count = views_count + 1, updated_at = GETDATE() WHERE product_id = ?", [productId]);
      redis.del(`product:details:${productId}`);
      
      // Publish event
      const userId = await userIdFromToken(getBearerToken(req));
      kafka.publish("user-events", { event_type: "view_product", user_id: userId, product_id: productId });
      
      sendJson(res, 200, { success: true, message: "Views incremented successfully" });
    } catch (err) {
      sendJson(res, 500, { success: false, error: err.message });
    }
    return;
  }

  // 4e. PATCH PRODUCT STOCK
  const stockPatchMatch = path.match(/^\/api\/products\/(\d+)\/stock$/) || path.match(/^\/products\/(\d+)\/stock$/);
  if (method === "PATCH" && stockPatchMatch) {
    const productId = Number(stockPatchMatch[1]);
    const body = await readBody(req);
    const stockQuantity = body.stock_quantity !== undefined ? Number(body.stock_quantity) : null;
    
    if (stockQuantity === null || isNaN(stockQuantity) || stockQuantity < 0) {
      sendJson(res, 400, { success: false, error: "Invalid stock quantity (must be non-negative integer)" });
      return;
    }
    
    try {
      await execute("UPDATE products SET stock_quantity = ?, updated_at = GETDATE() WHERE product_id = ?", [stockQuantity, productId]);
      redis.del(`product:details:${productId}`);
      kafka.publish("user-events", { event_type: "stock_change", product_id: productId, properties: { new_stock: stockQuantity } });
      
      sendJson(res, 200, { success: true, message: "Stock updated successfully", stock_quantity: stockQuantity });
    } catch (err) {
      sendJson(res, 500, { success: false, error: err.message });
    }
    return;
  }

  // 4f. GET DASHBOARD STATS
  if (method === "GET" && (path === "/api/dashboard/stats" || path === "/dashboard/stats")) {
    try {
      const stats = await queryOne(`
        SELECT 
          (SELECT COUNT(*) FROM products) AS total_products,
          (SELECT COUNT(*) FROM transactions) AS total_orders,
          (SELECT ISNULL(SUM(quantity), 0) FROM transaction_items) AS total_sales,
          (SELECT ISNULL(SUM(total_amount), 0) FROM transactions) AS total_revenue,
          (SELECT COUNT(DISTINCT user_id) FROM transactions) AS total_customers,
          (SELECT ISNULL(SUM(views_count), 0) FROM products) AS total_views,
          (SELECT COUNT(*) FROM products WHERE stock_quantity <= 5 AND stock_quantity > 0) AS low_stock_products,
          (SELECT COUNT(*) FROM products WHERE stock_quantity = 0) AS out_of_stock_products
      `);
      
      sendJson(res, 200, {
        success: true,
        data: {
          total_products: Number(stats.total_products || 0),
          total_orders: Number(stats.total_orders || 0),
          total_sales: Number(stats.total_sales || 0),
          total_revenue: Number(stats.total_revenue || 0),
          total_customers: Number(stats.total_customers || 0),
          total_views: Number(stats.total_views || 0),
          low_stock_products: Number(stats.low_stock_products || 0),
          out_of_stock_products: Number(stats.out_of_stock_products || 0)
        }
      });
    } catch (err) {
      sendJson(res, 500, { success: false, error: err.message });
    }
    return;
  }

  // 5. GET SINGLE PRODUCT DETAILS
  const productMatch = path.match(/^\/api\/products\/(\d+)$/) || path.match(/^\/products\/(\d+)$/);
  if (method === "GET" && productMatch) {
    const productId = Number(productMatch[1]);
    const userId = await userIdFromToken(getBearerToken(req));

    // Log product view telemetry to Kafka
    kafka.publish("user-events", { event_type: "view_product", user_id: userId, product_id: productId });

    // Redis Cache lookup
    const cacheKey = `product:details:${productId}`;
    const cachedProduct = redis.get(cacheKey);
    if (cachedProduct) {
      sendJson(res, 200, { success: true, data: cachedProduct });
      return;
    }

    const row = await queryOne(
      `
      SELECT p.product_id, p.product_name, pd.description, p.avg_rating, p.stock_quantity, pr.price, p.total_reviews,
             b.name AS brand_name, pd.warranty_info, pd.shipping_info, pd.full_specs, c.name AS category_name,
             p.views_count, p.sold_count, p.created_at, p.updated_at
      FROM products p
      LEFT JOIN product_details pd ON p.product_id = pd.product_id
      LEFT JOIN brands b ON p.brand_id = b.brand_id
      LEFT JOIN categories c ON p.category_id = c.category_id
      OUTER APPLY (
        SELECT TOP 1 price
        FROM product_prices
        WHERE product_id = p.product_id
        ORDER BY start_date DESC
      ) pr
      WHERE p.product_id = ? AND pr.price IS NOT NULL
      `,
      [productId]
    );
    if (!row) {
      sendJson(res, 404, { success: false, error: "Product not found" });
      return;
    }

    const specs = await queryAll("SELECT spec_key, spec_value FROM product_specs WHERE product_id = ? ORDER BY spec_id ASC", [productId]);
    const features = await queryAll("SELECT feature_text FROM product_features WHERE product_id = ? ORDER BY feature_id ASC", [productId]);
    const images = await queryAll("SELECT image_url, is_primary FROM product_images WHERE product_id = ? ORDER BY image_id ASC", [productId]);
    
    // Fetch customer reviews for this product
    const reviewsList = await queryAll(
      `
      SELECT r.review_id, r.score, r.review_text, r.is_verified, r.created_at, u.first_name, u.last_name
      FROM reviews r
      INNER JOIN users u ON r.user_id = u.user_id
      WHERE r.product_id = ?
      ORDER BY r.created_at DESC
      `,
      [productId]
    );

    row.specs = specs;
    row.features = features;
    row.images = images;
    row.reviews = reviewsList;

    // Cache in Redis for 1 minute
    redis.set(cacheKey, row, 60);

    sendJson(res, 200, { success: true, data: row });
    return;
  }

  // 6. CATEGORIES
  if (method === "GET" && (path === "/api/categories" || path === "/categories")) {
    const rows = await queryAll("SELECT category_id, name FROM categories ORDER BY name");
    sendJson(res, 200, { success: true, data: rows });
    return;
  }

  // 7. GET CART
  if (method === "GET" && (path === "/api/cart" || path === "/cart")) {
    const userId = await userIdFromToken(getBearerToken(req));
    if (!userId) {
      sendJson(res, 401, { success: false, error: "Unauthorized" });
      return;
    }
    const { cartId } = await getCartContextForUser(userId);
    const rows = await queryAll(
      `
      SELECT
        ci.cart_item_id,
        ci.quantity,
        p.product_id,
        p.product_name AS name,
        ci.unit_price AS price,
        ci.total_price AS line_total,
        p.stock_quantity,
        (SELECT TOP 1 image_url FROM product_images WHERE product_id = p.product_id ORDER BY is_primary DESC, image_id ASC) AS image_url
      FROM cart_items ci
      INNER JOIN products p ON p.product_id = ci.product_id
      WHERE ci.cart_id = ?
      ORDER BY ci.cart_item_id DESC
      `,
      [cartId]
    );
    sendJson(res, 200, { success: true, data: rows });
    return;
  }

  // 8. ADD TO CART
  if (method === "POST" && path === "/api/cart/add") {
    const body = await readBody(req);
    const userId = await userIdFromToken(getBearerToken(req));
    if (!userId) {
      sendJson(res, 401, { success: false, error: "Unauthorized" });
      return;
    }

    const productId = Number(body.product_id || 0);
    const quantity = Number(body.quantity || 1);
    if (!productId || quantity <= 0) {
      sendJson(res, 400, { success: false, error: "Invalid product or quantity" });
      return;
    }

    const { cartId } = await getCartContextForUser(userId);
    const priceRow = await queryOne(
      "SELECT TOP 1 price FROM product_prices WHERE product_id = ? ORDER BY start_date DESC",
      [productId]
    );
    const unitPrice = priceRow ? Number(priceRow.price) : null;
    if (!unitPrice) {
      sendJson(res, 400, { success: false, error: "Product price not found" });
      return;
    }

    const existing = await queryOne(
      "SELECT cart_item_id, quantity FROM cart_items WHERE cart_id = ? AND product_id = ?",
      [cartId, productId]
    );

    if (existing) {
      const newQty = Number(existing.quantity) + quantity;
      const totalPrice = unitPrice * newQty;
      await execute(
        "UPDATE cart_items SET quantity = ?, unit_price = ?, total_price = ?, updated_at = GETDATE() WHERE cart_item_id = ?",
        [newQty, unitPrice, totalPrice, existing.cart_item_id]
      );
    } else {
      const totalPrice = unitPrice * quantity;
      await execute(
        "INSERT INTO cart_items (cart_id, product_id, quantity, unit_price, total_price, updated_at) VALUES (?, ?, ?, ?, ?, GETDATE())",
        [cartId, productId, quantity, unitPrice, totalPrice]
      );
    }

    // Publish Kafka cart event
    kafka.publish("cart-activity", { event_type: "add_to_cart", user_id: userId, product_id: productId, properties: { quantity } });

    sendJson(res, 201, { success: true, message: "Item added to cart" });
    return;
  }

  // 9. UPDATE CART
  if (method === "POST" && path === "/api/cart/update") {
    const body = await readBody(req);
    const userId = await userIdFromToken(getBearerToken(req));
    const cartItemId = Number(body.cart_item_id || 0);
    const quantity = Number(body.quantity || 0);
    if (!cartItemId || quantity <= 0) {
      sendJson(res, 400, { success: false, error: "Quantity must be greater than 0" });
      return;
    }

    const itemDetail = await queryOne("SELECT product_id, quantity, unit_price FROM cart_items WHERE cart_item_id = ?", [cartItemId]);
    if (!itemDetail) {
      sendJson(res, 404, { success: false, error: "Cart item not found" });
      return;
    }

    await execute(
      "UPDATE cart_items SET quantity = ?, total_price = unit_price * ?, updated_at = GETDATE() WHERE cart_item_id = ?",
      [quantity, quantity, cartItemId]
    );

    // Publish Kafka cart event
    kafka.publish("cart-activity", {
      event_type: "update_cart",
      user_id: userId,
      product_id: Number(itemDetail.product_id),
      properties: { old_quantity: Number(itemDetail.quantity), new_quantity: quantity }
    });

    sendJson(res, 200, { success: true, message: "Cart updated" });
    return;
  }

  // 10. REMOVE FROM CART
  if (method === "POST" && path === "/api/cart/remove") {
    const body = await readBody(req);
    const userId = await userIdFromToken(getBearerToken(req));
    const cartItemId = Number(body.cart_item_id || 0);
    if (!cartItemId) {
      sendJson(res, 400, { success: false, error: "cart_item_id is required" });
      return;
    }

    const itemDetail = await queryOne("SELECT product_id, quantity FROM cart_items WHERE cart_item_id = ?", [cartItemId]);
    await execute("DELETE FROM cart_items WHERE cart_item_id = ?", [cartItemId]);

    if (itemDetail) {
      // Publish Kafka cart event
      kafka.publish("cart-activity", {
        event_type: "remove_from_cart",
        user_id: userId,
        product_id: Number(itemDetail.product_id),
        properties: { quantity: Number(itemDetail.quantity) }
      });
    }

    sendJson(res, 200, { success: true, message: "Item removed" });
    return;
  }

  // 11. GET ADDRESSES
  if (method === "GET" && path === "/api/addresses") {
    const userId = await userIdFromToken(getBearerToken(req));
    if (!userId) {
      sendJson(res, 401, { success: false, error: "Unauthorized" });
      return;
    }
    const rows = await queryAll(
      "SELECT address_id, address_type, recipient_name, street_address, city, state, postal_code, country, is_default FROM addresses WHERE user_id = ? ORDER BY is_default DESC, address_id DESC",
      [userId]
    );
    sendJson(res, 200, { success: true, data: rows });
    return;
  }

  // 12. ADD ADDRESS
  if (method === "POST" && path === "/api/addresses") {
    const body = await readBody(req);
    const userId = await userIdFromToken(getBearerToken(req));
    if (!userId) {
      sendJson(res, 401, { success: false, error: "Unauthorized" });
      return;
    }

    const type = body.address_type || "Shipping";
    const name = body.recipient_name || "";
    const street = body.street_address || "";
    const city = body.city || "";
    const state = body.state || "";
    const zip = body.postal_code || "";
    const country = body.country || "";
    const isDefault = body.is_default ? 1 : 0;

    if (!name || !street || !city || !state || !zip || !country) {
      sendJson(res, 400, { success: false, error: "All fields are required" });
      return;
    }

    if (isDefault) {
      await execute("UPDATE addresses SET is_default = 0 WHERE user_id = ?", [userId]);
    }

    const addressId = await execute(
      "INSERT INTO addresses (user_id, address_type, recipient_name, street_address, city, state, postal_code, country, is_default, created_at, updated_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, GETDATE(), GETDATE())",
      [userId, type, name, street, city, state, zip, country, isDefault]
    );

    sendJson(res, 201, { success: true, address_id: addressId });
    return;
  }

  // 13. DELETE ADDRESS
  if (method === "POST" && path === "/api/addresses/delete") {
    const body = await readBody(req);
    const userId = await userIdFromToken(getBearerToken(req));
    if (!userId) {
      sendJson(res, 401, { success: false, error: "Unauthorized" });
      return;
    }
    const addressId = Number(body.address_id);
    if (!addressId) {
      sendJson(res, 400, { success: false, error: "address_id is required" });
      return;
    }
    await execute("DELETE FROM addresses WHERE address_id = ? AND user_id = ?", [addressId, userId]);
    sendJson(res, 200, { success: true, message: "Address deleted" });
    return;
  }

  // 14. GET PAYMENT METHODS
  if (method === "GET" && path === "/api/payment/methods") {
    const rows = await queryAll("SELECT payment_method_id, name, description FROM payment_methods ORDER BY payment_method_id");
    sendJson(res, 200, { success: true, data: rows });
    return;
  }

  // 15. CHECKOUT & ORDERS
  if (method === "POST" && (path === "/api/checkout" || path === "/checkout" || path === "/api/orders" || path === "/orders")) {
    const body = await readBody(req);
    const userId = await userIdFromToken(getBearerToken(req));
    if (!userId) {
      sendJson(res, 401, { success: false, error: "Unauthorized" });
      return;
    }

    const paymentMethodId = Number(body.payment_method_id || 1);
    const addressId = Number(body.address_id || 0);

    if (!addressId) {
      sendJson(res, 400, { success: false, error: "Shipping address is required" });
      return;
    }

    const { cartId, sessionId } = await getCartContextForUser(userId);

    const cartItems = await queryAll(
      `
      SELECT product_id, quantity, unit_price, total_price
      FROM cart_items
      WHERE cart_id = ?
      `,
      [cartId]
    );

    if (!cartItems.length) {
      sendJson(res, 400, { success: false, error: "Cart is empty" });
      return;
    }

    const total = cartItems.reduce(
      (sum, item) => sum + Number(item.total_price || 0),
      0
    );

    const ref = "TX_" + crypto.randomBytes(6).toString("hex").toUpperCase();

    // Construct locked database transaction to prevent race conditions and overselling
    let sql = `
      BEGIN TRY
        BEGIN TRANSACTION;
    `;

    // Step A: Lock and check stock for each item
    for (const item of cartItems) {
      const productId = Number(item.product_id);
      const qty = Number(item.quantity);
      sql += `
        DECLARE @avail_${productId} INT;
        SELECT @avail_${productId} = stock_quantity FROM products WITH (UPDLOCK, HOLDLOCK) WHERE product_id = ${productId};
        IF @avail_${productId} IS NULL OR @avail_${productId} < ${qty}
        BEGIN
            DECLARE @pname_${productId} NVARCHAR(255);
            SELECT @pname_${productId} = product_name FROM products WHERE product_id = ${productId};
            DECLARE @err_${productId} NVARCHAR(255) = 'Insufficient stock for "' + ISNULL(@pname_${productId}, 'Product') + '". Available: ' + CAST(ISNULL(@avail_${productId}, 0) AS NVARCHAR) + ', Requested: ${qty}';
            THROW 50001, @err_${productId}, 1;
        END;
      `;
    }

    // Step B: Create transaction record
    sql += `
      DECLARE @tx_id INT;
      INSERT INTO transactions (user_id, payment_method_id, status_id, total_amount, transaction_date, created_at, updated_at, session_id, address_id, order_status, payment_status)
      VALUES (${userId}, ${paymentMethodId}, 1, ${total}, GETDATE(), GETDATE(), GETDATE(), ${sessionId}, ${addressId}, N'Ordered', N'Completed');
      SET @tx_id = SCOPE_IDENTITY();
    `;

    // Step C: Insert transaction items and update product stock & sold counts
    for (const item of cartItems) {
      const productId = Number(item.product_id);
      const qty = Number(item.quantity);
      const unitPrice = Number(item.unit_price);
      const totalPrice = Number(item.total_price);
      sql += `
        INSERT INTO transaction_items (transaction_id, product_id, quantity, unit_price, total_line)
        VALUES (@tx_id, ${productId}, ${qty}, ${unitPrice}, ${totalPrice});

        UPDATE products
        SET stock_quantity = stock_quantity - ${qty},
            sold_count = sold_count + ${qty},
            updated_at = GETDATE()
        WHERE product_id = ${productId};
      `;
    }

    // Step D: Insert payment record and order status tracking record
    sql += `
      INSERT INTO payment_records (transaction_id, amount, payment_method_id, transaction_reference, status, payment_date, created_at)
      VALUES (@tx_id, ${total}, ${paymentMethodId}, N'${ref}', N'Completed', GETDATE(), GETDATE());

      INSERT INTO order_status_tracking (transaction_id, status, notes, updated_at)
      VALUES (@tx_id, N'Ordered', N'Order placed successfully and payment received.', GETDATE());
    `;

    // Step E: Clear cart and mark session completed
    sql += `
      DELETE FROM cart_items WHERE cart_id = ${cartId};
      UPDATE cart_sessions SET is_abandoned = 1 WHERE cart_id = ${cartId};

      COMMIT TRANSACTION;
      SELECT @tx_id AS id;
      END TRY
      BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
        THROW;
      END CATCH;
    `;

    try {
      const resultRow = await queryOne(sql);
      const transactionId = resultRow ? Number(resultRow.id) : null;
      if (!transactionId) {
        throw new Error("Failed to create checkout order transaction.");
      }

      // Evict Redis caches and publish Kafka events for each item
      for (const item of cartItems) {
        redis.del(`product:details:${item.product_id}`);
        kafka.publish("purchases", {
          event_type: "purchase",
          user_id: userId,
          product_id: Number(item.product_id),
          properties: { quantity: Number(item.quantity), price: Number(item.unit_price), transaction_id: transactionId }
        });
      }

      sendJson(res, 201, { success: true, transaction_id: transactionId, total });
    } catch (err) {
      console.error("Checkout SQL transaction failed:", err);
      console.error("Generated SQL was:", sql);
      let errMsg = err.message || "Checkout failed";
      const match = errMsg.match(/Line \d+\s+(.*)/i) || errMsg.match(/Msg \d+,\s+Level\s+\d+,\s+State\s+\d+,\s+Line\s+\d+\s+(.*)/i);
      if (match) {
        errMsg = match[1];
      }
      sendJson(res, 400, { success: false, error: errMsg });
    }
    return;
  }

  // 16. WISHLIST ENDPOINTS
  if (method === "GET" && path === "/api/wishlist") {
    const userId = await userIdFromToken(getBearerToken(req));
    if (!userId) {
      sendJson(res, 401, { success: false, error: "Unauthorized" });
      return;
    }
    const rows = await queryAll(
      `
      SELECT w.wishlist_id, p.product_id, p.product_name AS name, pr.price, p.avg_rating,
             (SELECT TOP 1 image_url FROM product_images WHERE product_id = p.product_id ORDER BY is_primary DESC, image_id ASC) AS image_url
      FROM wishlist w
      INNER JOIN products p ON w.product_id = p.product_id
      OUTER APPLY (
        SELECT TOP 1 price
        FROM product_prices
        WHERE product_id = p.product_id
        ORDER BY start_date DESC
      ) pr
      WHERE w.user_id = ? AND pr.price IS NOT NULL
      ORDER BY w.wishlist_id DESC
      `,
      [userId]
    );
    sendJson(res, 200, { success: true, data: rows });
    return;
  }

  if (method === "POST" && path === "/api/wishlist/add") {
    const body = await readBody(req);
    const userId = await userIdFromToken(getBearerToken(req));
    if (!userId) {
      sendJson(res, 401, { success: false, error: "Unauthorized" });
      return;
    }
    const productId = Number(body.product_id);
    if (!productId) {
      sendJson(res, 400, { success: false, error: "product_id is required" });
      return;
    }
    const exists = await queryOne("SELECT wishlist_id FROM wishlist WHERE user_id = ? AND product_id = ?", [userId, productId]);
    if (!exists) {
      await execute("INSERT INTO wishlist (user_id, product_id, created_at) VALUES (?, ?, GETDATE())", [userId, productId]);
    }

    // Publish Kafka wishlist add event
    kafka.publish("user-events", { event_type: "add_to_wishlist", user_id: userId, product_id: productId });

    sendJson(res, 201, { success: true, message: "Added to wishlist" });
    return;
  }

  if (method === "POST" && path === "/api/wishlist/remove") {
    const body = await readBody(req);
    const userId = await userIdFromToken(getBearerToken(req));
    if (!userId) {
      sendJson(res, 401, { success: false, error: "Unauthorized" });
      return;
    }
    const productId = Number(body.product_id);
    if (!productId) {
      sendJson(res, 400, { success: false, error: "product_id is required" });
      return;
    }
    await execute("DELETE FROM wishlist WHERE user_id = ? AND product_id = ?", [userId, productId]);

    // Publish Kafka wishlist remove event
    kafka.publish("user-events", { event_type: "remove_from_wishlist", user_id: userId, product_id: productId });

    sendJson(res, 200, { success: true, message: "Removed from wishlist" });
    return;
  }

  // 17. RECOMMENDATIONS
  // Related Products
  const relatedMatch = path.match(/^\/api\/recommendations\/related\/(\d+)$/);
  if (method === "GET" && relatedMatch) {
    const productId = Number(relatedMatch[1]);
    const data = await recs.getRelatedProducts(productId);
    sendJson(res, 200, { success: true, data });
    return;
  }

  // Customers Also Bought (Bought Together)
  const boughtTogetherMatch = path.match(/^\/api\/recommendations\/bought-together\/(\d+)$/);
  if (method === "GET" && boughtTogetherMatch) {
    const productId = Number(boughtTogetherMatch[1]);
    const data = await recs.getBoughtTogether(productId);
    sendJson(res, 200, { success: true, data });
    return;
  }

  // Recently Viewed (keeps the query, caches results in Redis)
  if (method === "GET" && path === "/api/recommendations/recent") {
    const userId = await userIdFromToken(getBearerToken(req));
    if (!userId) {
      sendJson(res, 200, { success: true, data: [] });
      return;
    }
    const cacheKey = `rec:recent:${userId}`;
    const cached = redis.get(cacheKey);
    if (cached) {
      sendJson(res, 200, { success: true, data: cached });
      return;
    }

    const rows = await queryAll(
      `
      SELECT TOP 6 p.product_id, p.product_name AS name, p.avg_rating, pr.price, p.total_reviews,
             (SELECT TOP 1 name FROM brands WHERE brand_id = p.brand_id) AS brand_name,
             (SELECT TOP 1 image_url FROM product_images WHERE product_id = p.product_id ORDER BY is_primary DESC, image_id ASC) AS image_url
      FROM (
        SELECT product_id, MAX(event_timestamp) AS last_view
        FROM events e
        INNER JOIN event_types et ON e.event_type_id = et.event_type_id
        WHERE e.user_id = ? AND et.name = 'view_product'
        GROUP BY product_id
      ) ev
      INNER JOIN products p ON ev.product_id = p.product_id
      OUTER APPLY (
        SELECT TOP 1 price FROM product_prices WHERE product_id = p.product_id ORDER BY start_date DESC
      ) pr
      WHERE pr.price IS NOT NULL
      ORDER BY ev.last_view DESC
      `,
      [userId]
    );

    redis.set(cacheKey, rows, 10); // Cache recently viewed for 10 seconds
    sendJson(res, 200, { success: true, data: rows });
    return;
  }

  // Recommended for You
  if (method === "GET" && path === "/api/recommendations/for-you") {
    const userId = await userIdFromToken(getBearerToken(req));
    const data = await recs.getPersonalizedRecommendations(userId);
    sendJson(res, 200, { success: true, data });
    return;
  }

  // Trending Products
  if (method === "GET" && path === "/api/recommendations/trending") {
    const data = await recs.getTrendingProducts(6);
    sendJson(res, 200, { success: true, data });
    return;
  }

  // Recommendation Click Feedback
  if (method === "POST" && path === "/api/recommendations/feedback") {
    const body = await readBody(req);
    const userId = await userIdFromToken(getBearerToken(req));
    const productId = Number(body.product_id);
    const recType = String(body.recommendation_type || "default");

    // Publish event to Kafka to trace click-through rates (CTR)
    kafka.publish("user-events", {
      event_type: "recommendation_click",
      user_id: userId,
      product_id: productId,
      properties: { recommendation_type: recType }
    });

    sendJson(res, 200, { success: true });
    return;
  }

  // 18. LOG BEHAVIOR EVENTS
  if (method === "POST" && path === "/api/events") {
    const body = await readBody(req);
    const userId = await userIdFromToken(getBearerToken(req)); // Optional (could be guest)

    const eventName = body.event_type;
    const productId = body.product_id ? Number(body.product_id) : null;
    let props = null;
    if (body.properties !== undefined && body.properties !== null) {
      props = typeof body.properties === "object" ? JSON.stringify(body.properties) : JSON.stringify({ value: body.properties });
    }

    if (!eventName) {
      sendJson(res, 400, { success: false, error: "event_type is required" });
      return;
    }

    // Get event type ID
    const etRow = await queryOne("SELECT event_type_id FROM event_types WHERE name = ?", [eventName]);
    let typeId = etRow ? etRow.event_type_id : null;
    if (!typeId) {
      // Auto insert if not exists
      typeId = await execute("INSERT INTO event_types (name, created_at) VALUES (?, GETDATE())", [eventName]);
    }

    // Insert event
    await execute(
      "INSERT INTO events (user_id, event_type_id, product_id, event_properties, event_timestamp, created_at) VALUES (?, ?, ?, ?, GETDATE(), GETDATE())",
      [userId, typeId, productId, props]
    );

    // Publish to Kafka for Spark Streaming analytics
    kafka.publish("user-events", {
      event_type: eventName,
      user_id: userId,
      product_id: productId,
      properties: body.properties
    });

    sendJson(res, 201, { success: true });
    return;
  }

  // 18b. GET USER PROFILE
  if (method === "GET" && path === "/api/user/profile") {
    const userId = await userIdFromToken(getBearerToken(req));
    if (!userId) {
      sendJson(res, 401, { success: false, error: "Unauthorized" });
      return;
    }
    const user = await queryOne("SELECT user_id, first_name, last_name, email FROM users WHERE user_id = ?", [userId]);
    if (!user) {
      sendJson(res, 404, { success: false, error: "User not found" });
      return;
    }
    sendJson(res, 200, { success: true, data: user });
    return;
  }

  // 19. ORDERS HISTORY
  const ordersMatch = path.match(/^\/api\/orders\/(\d+)$/);
  if (method === "GET" && ordersMatch) {
    const targetUserId = Number(ordersMatch[1]);
    const loggedUserId = await userIdFromToken(getBearerToken(req));
    if (!loggedUserId || loggedUserId !== targetUserId) {
      sendJson(res, 401, { success: false, error: "Unauthorized" });
      return;
    }
    const rows = await queryAll(
      `
      SELECT t.transaction_id, t.total_amount, t.transaction_date, pm.name AS payment_method,
             ost.status AS order_status, ost.notes AS order_notes, ost.updated_at AS status_updated_at,
             a.street_address, a.city, a.state, a.postal_code, a.country, a.recipient_name
      FROM transactions t
      LEFT JOIN payment_methods pm ON t.payment_method_id = pm.payment_method_id
      LEFT JOIN (
        SELECT transaction_id, status, notes, updated_at,
               ROW_NUMBER() OVER (PARTITION BY transaction_id ORDER BY updated_at DESC) as rn
        FROM order_status_tracking
      ) ost ON t.transaction_id = ost.transaction_id AND ost.rn = 1
      LEFT JOIN addresses a ON t.address_id = a.address_id
      WHERE t.user_id = ?
      ORDER BY t.transaction_id DESC
      `,
      [targetUserId]
    );

    for (const row of rows) {
      const items = await queryAll(
        `
        SELECT ti.product_id, p.product_name AS name, ti.quantity, ti.unit_price, ti.total_line AS line_total,
               (SELECT TOP 1 image_url FROM product_images WHERE product_id = p.product_id ORDER BY is_primary DESC, image_id ASC) AS image_url
        FROM transaction_items ti
        INNER JOIN products p ON ti.product_id = p.product_id
        WHERE ti.transaction_id = ?
        `,
        [row.transaction_id]
      );
      row.items = items;
    }
    sendJson(res, 200, { success: true, data: rows });
    return;
  }

  // 20. INVOICE DETAILS
  const invoiceMatch = path.match(/^\/api\/invoice\/(\d+)$/);
  if (method === "GET" && invoiceMatch) {
    const transactionId = Number(invoiceMatch[1]);
    const tx = await queryOne(
      `
      SELECT t.transaction_id, t.user_id, t.total_amount, t.transaction_date, pm.name AS payment_method,
             ost.status AS order_status, ost.notes AS order_notes,
             a.recipient_name, a.street_address, a.city, a.state, a.postal_code, a.country,
             pr.transaction_reference, pr.status AS payment_status
      FROM transactions t
      LEFT JOIN payment_methods pm ON t.payment_method_id = pm.payment_method_id
      LEFT JOIN (
        SELECT transaction_id, status, notes,
               ROW_NUMBER() OVER (PARTITION BY transaction_id ORDER BY updated_at DESC) as rn
        FROM order_status_tracking
      ) ost ON t.transaction_id = ost.transaction_id AND ost.rn = 1
      LEFT JOIN addresses a ON t.address_id = a.address_id
      LEFT JOIN payment_records pr ON t.transaction_id = pr.transaction_id
      WHERE t.transaction_id = ?
      `,
      [transactionId]
    );
    if (!tx) {
      sendJson(res, 404, { success: false, error: "Transaction not found" });
      return;
    }

    const loggedUserId = await userIdFromToken(getBearerToken(req));
    if (!loggedUserId || loggedUserId !== Number(tx.user_id)) {
      sendJson(res, 401, { success: false, error: "Unauthorized" });
      return;
    }

    const items = await queryAll(
      `
      SELECT ti.product_id, p.product_name AS name, ti.quantity, ti.unit_price, ti.total_line AS line_total
      FROM transaction_items ti
      INNER JOIN products p ON ti.product_id = p.product_id
      WHERE ti.transaction_id = ?
      `,
      [transactionId]
    );
    tx.items = items;
    sendJson(res, 200, { success: true, data: tx });
    return;
  }

  // 21. ADMIN PRODUCTS
  if (method === "GET" && path === "/api/admin/products") {
    const rows = await queryAll(`
      SELECT p.product_id, p.product_name AS name, p.avg_rating AS rating, c.name AS category_name, pr.price
      FROM products p
      OUTER APPLY (
        SELECT TOP 1 price
        FROM product_prices
        WHERE product_id = p.product_id
        ORDER BY start_date DESC
      ) pr
      LEFT JOIN categories c ON p.category_id = c.category_id
      WHERE pr.price IS NOT NULL
      ORDER BY p.product_id DESC
    `);
    sendJson(res, 200, { success: true, data: rows });
    return;
  }

  // 22. ADMIN ORDERS
  if (method === "GET" && path === "/api/admin/orders") {
    const rows = await queryAll(`
      SELECT t.transaction_id, t.user_id, t.total_amount, t.transaction_date,
             pm.name AS payment_method, ost.status AS payment_status
      FROM transactions t
      LEFT JOIN payment_methods pm ON t.payment_method_id = pm.payment_method_id
      LEFT JOIN (
        SELECT transaction_id, status,
               ROW_NUMBER() OVER (PARTITION BY transaction_id ORDER BY updated_at DESC) as rn
        FROM order_status_tracking
      ) ost ON t.transaction_id = ost.transaction_id AND ost.rn = 1
      ORDER BY t.transaction_id DESC
    `);
    sendJson(res, 200, { success: true, data: rows });
    return;
  }

  // 23. ADMIN STATS (Aggregated panels)
  if (method === "GET" && (path === "/api/admin/stats" || path === "/admin/stats")) {
    const users = await queryOne("SELECT COUNT(*) AS total_users FROM users");
    const sales = await queryOne("SELECT ISNULL(SUM(total_amount), 0) AS total_sales FROM transactions");
    const orders = await queryOne("SELECT COUNT(*) AS total_orders FROM transactions");

    // Fetch the 8 dashboard statistics
    const dbStats = await queryOne(`
      SELECT 
        (SELECT COUNT(*) FROM products) AS total_products,
        (SELECT ISNULL(SUM(quantity), 0) FROM transaction_items) AS total_sales_count,
        (SELECT COUNT(DISTINCT user_id) FROM transactions) AS total_customers,
        (SELECT ISNULL(SUM(views_count), 0) FROM products) AS total_views,
        (SELECT COUNT(*) FROM products WHERE stock_quantity <= 5 AND stock_quantity > 0) AS low_stock_products,
        (SELECT COUNT(*) FROM products WHERE stock_quantity = 0) AS out_of_stock_products
    `);

    // Additional aggregated queries for admin dashboard analytics panels
    const topSearches = await queryAll(
      `
      SELECT TOP 5 event_properties AS query, COUNT(*) AS count
      FROM events e
      INNER JOIN event_types et ON e.event_type_id = et.event_type_id
      WHERE et.name = 'search'
      GROUP BY event_properties
      ORDER BY count DESC
      `
    );

    const topViewed = await queryAll(
      `
      SELECT TOP 5 p.product_name AS name, COUNT(*) AS views
      FROM events e
      INNER JOIN event_types et ON e.event_type_id = et.event_type_id
      INNER JOIN products p ON e.product_id = p.product_id
      WHERE et.name = 'view_product'
      GROUP BY p.product_name
      ORDER BY views DESC
      `
    );

    const avgTime = await queryOne(
      `
      SELECT AVG(TRY_CAST(event_properties AS FLOAT)) AS avg_time
      FROM events e
      INNER JOIN event_types et ON e.event_type_id = et.event_type_id
      WHERE et.name = 'time_spent' AND ISNUMERIC(event_properties) = 1
      `
    );

    const conversion = await queryOne(
      `
      SELECT
        CAST(COUNT(CASE WHEN et.name = 'purchase' THEN 1 END) AS FLOAT) /
        NULLIF(COUNT(CASE WHEN et.name = 'add_to_cart' THEN 1 END), 0) * 100 AS rate
      FROM events e
      INNER JOIN event_types et ON e.event_type_id = et.event_type_id
      `
    );

    sendJson(res, 200, {
      success: true,
      data: {
        total_users: Number(users.total_users || 0),
        total_sales: Number(dbStats.total_sales_count || 0), // Count of items sold
        total_sales_amount: Number(sales.total_sales || 0), // Dollar revenue (original total_sales)
        total_orders: Number(orders.total_orders || 0),
        top_searches: topSearches,
        top_viewed: topViewed,
        avg_time_spent: avgTime ? Number(avgTime.avg_time || 0) : 0,
        conversion_rate: conversion ? Number(conversion.rate || 0) : 0,
        
        // Enrichments for new 8 dashboard stats cards
        total_products: Number(dbStats.total_products || 0),
        total_revenue: Number(sales.total_sales || 0),
        total_customers: Number(dbStats.total_customers || 0),
        total_views: Number(dbStats.total_views || 0),
        low_stock_products: Number(dbStats.low_stock_products || 0),
        out_of_stock_products: Number(dbStats.out_of_stock_products || 0)
      }
    });
    return;
  }

  // 24. ADMIN PIPELINE SYSTEM METRICS
  if (method === "GET" && path === "/api/admin/system-stats") {
    // DB Queries Check
    const dbStatus = "Healthy";
    
    // Active Users (count of users with active tokens)
    const activeUsersRow = await queryOne("SELECT COUNT(DISTINCT user_id) AS total FROM user_tokens");
    const activeUsers = Number(activeUsersRow ? activeUsersRow.total : 0) || 1; // fallback to 1

    // CTR (Clicks on recommendations / Total views of products)
    const clicksRow = await queryOne(
      `
      SELECT COUNT(*) AS total 
      FROM events e 
      INNER JOIN event_types et ON e.event_type_id = et.event_type_id 
      WHERE et.name = 'recommendation_click'
      `
    );
    const viewsRow = await queryOne(
      `
      SELECT COUNT(*) AS total 
      FROM events e 
      INNER JOIN event_types et ON e.event_type_id = et.event_type_id 
      WHERE et.name = 'view_product'
      `
    );
    const clicks = Number(clicksRow ? clicksRow.total : 0);
    const views = Number(viewsRow ? viewsRow.total : 0);
    const ctr = views > 0 ? (clicks / views) * 100 : 0.0;

    const stats = {
      kafka: kafka.getStats(),
      spark: spark.getStats(),
      redis: redis.getStats(),
      db: { status: dbStatus },
      system: {
        activeUsers,
        avgApiLatencyMs: getAvgApiLatency(),
        ctr: Number(ctr.toFixed(1))
      }
    };

    sendJson(res, 200, { success: true, data: stats });
    return;
  }


  // 25. RECENTLY VIEWED RECOMMENDATIONS (for profile page)
  if (method === "GET" && path === "/api/recommendations/recent") {
    const token = getBearerToken(req);
    if (!token) return sendJson(res, 401, { success: false, error: "Unauthorized" });
    const userRow = await queryOne(`SELECT user_id FROM user_tokens WHERE token = '${token}'`);
    if (!userRow) return sendJson(res, 401, { success: false, error: "Invalid token" });
    const userId = Number(userRow.user_id);

    const rows = await queryAll(`
      SELECT TOP 8
        p.product_id, p.product_name, p.avg_rating,
        c.name AS category_name,
        b.name AS brand_name,
        pr.price,
        p.stock_quantity,
        e.created_at AS viewed_at
      FROM events e
      INNER JOIN event_types et ON e.event_type_id = et.event_type_id
      INNER JOIN products p ON e.product_id = p.product_id
      LEFT JOIN categories c ON p.category_id = c.category_id
      LEFT JOIN brands b ON p.brand_id = b.brand_id
      OUTER APPLY (
        SELECT TOP 1 price FROM product_prices
        WHERE product_id = p.product_id ORDER BY start_date DESC
      ) pr
      WHERE et.name = 'view_product' AND e.user_id = ${userId}
      ORDER BY e.created_at DESC
    `);

    sendJson(res, 200, { success: true, data: rows });
    return;
  }

  sendJson(res, 404, { success: false, error: "Not found" });
}

const server = http.createServer((req, res) => {
  const startTime = Date.now();
  handleRequest(req, res).then(() => {
    logLatency(Date.now() - startTime);
  }).catch((error) => {
    logLatency(Date.now() - startTime);
    sendJson(res, 500, { success: false, error: error.message });
  });
});

server.listen(PORT, "0.0.0.0", () => {
  console.log(`Backend running at http://localhost:${PORT}`);
  // Bootstrap Spark Streaming service
  spark.start().then(() => {
    console.log("Spark Streaming Service is operational.");
  }).catch(err => {
    console.error("Failed to start Spark Streaming Service:", err);
  });
});
