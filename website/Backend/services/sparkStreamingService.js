// sparkStreamingService.js
// In-Memory Apache Spark Streaming Emulator
// Consumes Kafka events, performs real-time windowed aggregations, and persists results to SQL Server

const kafka = require("./kafkaService");
const db = require("../db");

class SparkStreamingService {
  constructor() {
    this.status = "Stopped";
    this.processedEventsCount = 0;
    this.lastBatchTime = null;
    this.eventBuffer = []; // Accumulates events between batches
    this.batchInterval = null;
    this.latencyMs = 0;
  }

  // Initialize and run migrations for tables, then start consumption
  async start() {
    if (this.status === "Running") return;

    this.status = "Starting";
    try {
      // 1. Run migrations to create spark_trending_products and spark_user_interests if they don't exist
      await this.runMigrations();

      // 2. Subscribe to Kafka topics
      kafka.subscribe("user-events", (event) => this.enqueueEvent(event));
      kafka.subscribe("cart-activity", (event) => this.enqueueEvent(event));
      kafka.subscribe("purchases", (event) => this.enqueueEvent(event));

      // 3. Start batch processing loop (every 5 seconds)
      this.batchInterval = setInterval(() => this.processBatch(), 5000);
      this.status = "Running";
      console.log("Spark Streaming Service started and listening to Kafka events.");
    } catch (error) {
      this.status = "Failed";
      console.error("Spark Streaming Service failed to start:", error);
    }
  }

  stop() {
    if (this.batchInterval) {
      clearInterval(this.batchInterval);
      this.batchInterval = null;
    }
    this.status = "Stopped";
  }

  enqueueEvent(kafkaMessage) {
    this.eventBuffer.push(kafkaMessage.payload);
    this.processedEventsCount++;
  }

  // Create tables in SQL Server if they do not exist
  async runMigrations() {
    // spark_trending_products
    await db.execute(`
      IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spark_trending_products]') AND type in (N'U'))
      BEGIN
          CREATE TABLE spark_trending_products (
              product_id INT PRIMARY KEY FOREIGN KEY REFERENCES products(product_id) ON DELETE CASCADE,
              score INT NOT NULL,
              updated_at DATETIME DEFAULT GETDATE()
          );
      END
    `);

    // spark_user_interests
    await db.execute(`
      IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spark_user_interests]') AND type in (N'U'))
      BEGIN
          CREATE TABLE spark_user_interests (
              user_id INT NOT NULL FOREIGN KEY REFERENCES users(user_id) ON DELETE CASCADE,
              category_id INT NOT NULL FOREIGN KEY REFERENCES categories(category_id) ON DELETE CASCADE,
              interaction_count INT DEFAULT 0,
              updated_at DATETIME DEFAULT GETDATE(),
              PRIMARY KEY (user_id, category_id)
          );
      END
    `);
  }

  // Process the accumulated batch of events
  async processBatch() {
    if (this.eventBuffer.length === 0) {
      this.lastBatchTime = Date.now();
      return;
    }

    const startTime = Date.now();
    const batch = [...this.eventBuffer];
    this.eventBuffer = []; // Clear buffer for next window

    try {
      // 1. Calculate Trending Product Scores in this batch
      // Weights: view_product = 1, add_to_wishlist = 3, add_to_cart = 5, purchase = 10
      const productScores = {};
      const userInterests = {}; // { userId: { categoryId: count } }

      for (const event of batch) {
        const productId = event.product_id ? Number(event.product_id) : null;
        const userId = event.user_id ? Number(event.user_id) : null;
        const eventType = event.event_type;

        if (productId) {
          let weight = 0;
          if (eventType === "view_product" || eventType === "click_product") weight = 1;
          else if (eventType === "add_to_wishlist") weight = 3;
          else if (eventType === "add_to_cart") weight = 5;
          else if (eventType === "purchase") weight = 10;

          if (weight > 0) {
            productScores[productId] = (productScores[productId] || 0) + weight;
          }
        }

        // Gather real-time User Interests
        if (userId && productId && (eventType === "view_product" || eventType === "click_product")) {
          // Resolve category ID of product
          const pInfo = await db.queryOne("SELECT category_id FROM products WHERE product_id = ?", [productId]);
          if (pInfo && pInfo.category_id) {
            const catId = Number(pInfo.category_id);
            if (!userInterests[userId]) userInterests[userId] = {};
            userInterests[userId][catId] = (userInterests[userId][catId] || 0) + 1;
          }
        }
      }

      // Update Trending Products in SQL Server database
      for (const [prodId, score] of Object.entries(productScores)) {
        const productId = Number(prodId);
        // SQL Server MERGE (upsert)
        await db.execute(`
          MERGE INTO spark_trending_products AS target
          USING (SELECT ? AS product_id) AS source
          ON (target.product_id = source.product_id)
          WHEN MATCHED THEN
              UPDATE SET score = target.score + ?, updated_at = GETDATE()
          WHEN NOT MATCHED THEN
              INSERT (product_id, score, updated_at) VALUES (source.product_id, ?, GETDATE());
        `, [productId, score, score]);
      }

      // Update User Interests in SQL Server database
      for (const [usrId, cats] of Object.entries(userInterests)) {
        const userId = Number(usrId);
        for (const [catId, count] of Object.entries(cats)) {
          const categoryId = Number(catId);
          await db.execute(`
            MERGE INTO spark_user_interests AS target
            USING (SELECT ? AS user_id, ? AS category_id) AS source
            ON (target.user_id = source.user_id AND target.category_id = source.category_id)
            WHEN MATCHED THEN
                UPDATE SET interaction_count = target.interaction_count + ?, updated_at = GETDATE()
            WHEN NOT MATCHED THEN
                INSERT (user_id, category_id, interaction_count, updated_at) VALUES (source.user_id, source.category_id, ?, GETDATE());
          `, [userId, categoryId, count, count]);
        }
      }

      this.latencyMs = Date.now() - startTime;
      this.lastBatchTime = Date.now();
    } catch (err) {
      console.error("Error processing Spark streaming batch:", err);
    }
  }

  // Get metrics for dashboard
  getStats() {
    return {
      status: this.status,
      processedEvents: this.processedEventsCount,
      lastBatchTime: this.lastBatchTime ? new Date(this.lastBatchTime).toISOString() : null,
      latencyMs: this.latencyMs,
      bufferSize: this.eventBuffer.length
    };
  }
}

module.exports = new SparkStreamingService();
