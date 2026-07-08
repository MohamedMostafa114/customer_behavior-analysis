// redisService.js
// In-Memory Redis Cache Emulator with TTL, LRU eviction, and stats tracking

class RedisService {
  constructor(maxSize = 1000) {
    this.store = new Map(); // key -> { value, expiry, lastAccessed }
    this.maxSize = maxSize;
    this.hits = 0;
    this.misses = 0;
  }

  // Set key-value with optional TTL in seconds
  set(key, value, ttlSeconds = null) {
    // Evict if over limit
    if (this.store.size >= this.maxSize && !this.store.has(key)) {
      this.evictLRU();
    }

    const expiry = ttlSeconds ? Date.now() + ttlSeconds * 1000 : null;
    this.store.set(key, {
      value,
      expiry,
      lastAccessed: Date.now()
    });
    return "OK";
  }

  // Get value by key, handles expiration and logs hit/miss
  get(key) {
    const item = this.store.get(key);
    if (!item) {
      this.misses++;
      return null;
    }

    // Check expiration
    if (item.expiry && item.expiry < Date.now()) {
      this.store.delete(key);
      this.misses++;
      return null;
    }

    // Update access timestamp for LRU
    item.lastAccessed = Date.now();
    this.hits++;
    return item.value;
  }

  // Delete key
  del(key) {
    const existed = this.store.delete(key);
    return existed ? 1 : 0;
  }

  // Clear cache
  flushAll() {
    this.store.clear();
    this.hits = 0;
    this.misses = 0;
    return "OK";
  }

  // Evict the least recently used item
  evictLRU() {
    let oldestKey = null;
    let oldestTime = Infinity;

    for (const [key, item] of this.store.entries()) {
      if (item.lastAccessed < oldestTime) {
        oldestTime = item.lastAccessed;
        oldestKey = key;
      }
    }

    if (oldestKey) {
      this.store.delete(oldestKey);
    }
  }

  // Get active key count (filtering out expired keys)
  getActiveKeysCount() {
    const now = Date.now();
    let count = 0;
    for (const [key, item] of this.store.entries()) {
      if (!item.expiry || item.expiry >= now) {
        count++;
      } else {
        this.store.delete(key); // clean up expired items lazily
      }
    }
    return count;
  }

  // Get statistics for the dashboard
  getStats() {
    const totalRequests = this.hits + this.misses;
    const hitRate = totalRequests > 0 ? (this.hits / totalRequests) * 100 : 0.0;
    const activeKeys = this.getActiveKeysCount();

    // Approximate memory usage based on serialized size
    let approxBytes = 0;
    try {
      approxBytes = JSON.stringify(Array.from(this.store.entries())).length;
    } catch {
      approxBytes = activeKeys * 150; // fallback estimate
    }

    return {
      hits: this.hits,
      misses: this.misses,
      hitRate: Number(hitRate.toFixed(1)),
      activeKeys,
      memoryUsageKb: Number((approxBytes / 1024).toFixed(2))
    };
  }
}

module.exports = new RedisService();
