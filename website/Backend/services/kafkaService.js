// kafkaService.js
// In-Memory Apache Kafka Emulator with topics, producers, consumers, and throughput metrics

class KafkaService {
  constructor() {
    this.topics = new Map(); // topicName -> Array of messages
    this.subscribers = new Map(); // topicName -> Array of callbacks
    this.messageCount = 0;
    this.recentMessageTimes = []; // list of timestamps of published messages to calculate throughput
    this.activeWorkers = new Set();
  }

  // Publish a message to a topic
  publish(topic, payload) {
    if (!this.topics.has(topic)) {
      this.topics.set(topic, []);
    }
    if (!this.subscribers.has(topic)) {
      this.subscribers.set(topic, []);
    }

    const message = {
      offset: this.topics.get(topic).length,
      timestamp: Date.now(),
      topic,
      payload
    };

    // Store in topic history
    this.topics.get(topic).push(message);
    this.messageCount++;
    this.recentMessageTimes.push(Date.now());

    // Clean up throughput timestamp window (keep only last 10 seconds of timestamps)
    const threshold = Date.now() - 10000;
    while (this.recentMessageTimes.length > 0 && this.recentMessageTimes[0] < threshold) {
      this.recentMessageTimes.shift();
    }

    // Notify subscribers asynchronously
    const callbacks = this.subscribers.get(topic);
    callbacks.forEach(callback => {
      setImmediate(() => {
        try {
          callback(message);
        } catch (error) {
          console.error(`Error in Kafka subscriber for topic ${topic}:`, error);
        }
      });
    });

    return message;
  }

  // Subscribe to a topic with a callback
  subscribe(topic, callback) {
    if (!this.subscribers.has(topic)) {
      this.subscribers.set(topic, []);
    }
    this.subscribers.get(topic).push(callback);
    return () => {
      const idx = this.subscribers.get(topic).indexOf(callback);
      if (idx !== -1) {
        this.subscribers.get(topic).splice(idx, 1);
      }
    };
  }

  // Clear topics
  clearAll() {
    this.topics.clear();
    this.subscribers.clear();
    this.messageCount = 0;
    this.recentMessageTimes = [];
  }

  // Get active throughput (messages per second in the last 10 seconds)
  getThroughput() {
    const threshold = Date.now() - 10000;
    while (this.recentMessageTimes.length > 0 && this.recentMessageTimes[0] < threshold) {
      this.recentMessageTimes.shift();
    }
    const count = this.recentMessageTimes.length;
    return Number((count / 10).toFixed(1)); // average over 10 seconds
  }

  // Get system stats for dashboard
  getStats() {
    const list = Array.from(this.topics.keys());
    return {
      topicsCount: list.length,
      topicsList: list,
      totalMessages: this.messageCount,
      throughputMsgSec: this.getThroughput()
    };
  }
}

module.exports = new KafkaService();
