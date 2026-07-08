// verify_endpoints.js
// Programmatic E2E API Verification Script

const http = require("node:http");

const API_BASE = "http://localhost:5000/api";

// Helper to make requests
function makeRequest(path, method = "GET", body = null, token = null) {
  return new Promise((resolve, reject) => {
    const url = `${API_BASE}${path}`;
    const options = {
      method,
      headers: {
        "Content-Type": "application/json"
      }
    };
    if (token) {
      options.headers["Authorization"] = `Bearer ${token}`;
    }

    const req = http.request(url, options, (res) => {
      let data = "";
      res.on("data", chunk => data += chunk);
      res.on("end", () => {
        try {
          const parsed = JSON.parse(data);
          if (res.statusCode >= 400) {
            reject({ status: res.statusCode, error: parsed.error || "Request failed" });
          } else {
            resolve(parsed);
          }
        } catch {
          reject({ status: res.statusCode, error: `Invalid JSON: ${data}` });
        }
      });
    });

    req.on("error", reject);

    if (body) {
      req.write(JSON.stringify(body));
    }
    req.end();
  });
}

async function runTests() {
  console.log("=== Starting End-to-End API Integration Verification ===");

  const randomId = Math.floor(Math.random() * 1000000);
  const email = `tester_${randomId}@example.com`;
  const password = "Password123";
  let token = null;
  let userId = null;
  let productId = 1; // iPhone 14
  let addressId = null;
  let transactionId = null;

  try {
    // 1. SIGNUP
    console.log("\n[TEST 1] Registering a new user...");
    const signupRes = await makeRequest("/signup", "POST", {
      first_name: "E2E",
      last_name: "Tester",
      email,
      password
    });
    console.log("✔ Signup successful! User ID:", signupRes.user_id);
    userId = signupRes.user_id;

    // 2. LOGIN
    console.log("\n[TEST 2] Logging in...");
    const loginRes = await makeRequest("/login", "POST", { email, password });
    console.log("✔ Login successful! Token received.");
    token = loginRes.token;

    // 3. SEARCH PRODUCTS
    console.log("\n[TEST 3] Searching for 'iPhone'...");
    const searchRes = await makeRequest("/products?search=iPhone", "GET");
    console.log(`✔ Search successful! Found ${searchRes.data.length} products matching 'iPhone'.`);

    // 4. LOG BEHAVIOR EVENTS
    console.log("\n[TEST 4] Logging product view & search events...");
    await makeRequest("/events", "POST", { event_type: "view_product", product_id: productId }, token);
    await makeRequest("/events", "POST", { event_type: "search", properties: "iPhone" }, token);
    await makeRequest("/events", "POST", { event_type: "time_spent", properties: "45" }, token);
    console.log("✔ Telemetry events logged successfully.");

    // 5. WISHLIST TOGGLE
    console.log("\n[TEST 5] Adding product to wishlist...");
    await makeRequest("/wishlist/add", "POST", { product_id: productId }, token);
    const wishlistRes = await makeRequest("/wishlist", "GET", null, token);
    const inWishlist = wishlistRes.data.some(w => Number(w.product_id) === productId);
    if (inWishlist) {
      console.log("✔ Wishlist check passed! Product in wishlist.");
    } else {
      throw new Error("Product was not found in wishlist.");
    }

    // 6. ADDRESS MANAGEMENT
    console.log("\n[TEST 6] Adding shipping address...");
    const addrRes = await makeRequest("/addresses", "POST", {
      recipient_name: "E2E Tester",
      street_address: "456 Tech Avenue",
      city: "Silicon Valley",
      state: "CA",
      postal_code: "94025",
      country: "USA",
      is_default: true
    }, token);
    addressId = addrRes.address_id;
    console.log("✔ Address saved! Address ID:", addressId);

    const addrListRes = await makeRequest("/addresses", "GET", null, token);
    if (addrListRes.data.some(a => Number(a.address_id) === addressId)) {
      console.log("✔ Address list verification passed.");
    } else {
      throw new Error("Saved address not found in address list.");
    }

    // 7. PERSISTENT CART SHOPPING
    console.log("\n[TEST 7] Adding product to cart...");
    await makeRequest("/cart/add", "POST", { product_id: productId, quantity: 2 }, token);
    const cartRes = await makeRequest("/cart", "GET", null, token);
    const cartItem = cartRes.data.find(i => Number(i.product_id) === productId);
    if (cartItem && Number(cartItem.quantity) === 2) {
      console.log(`✔ Cart verification passed! Item name: ${cartItem.name}, Qty: ${cartItem.quantity}`);
    } else {
      throw new Error("Cart verification failed.");
    }

    // 8. CHECKOUT WITH ADDRESS
    console.log("\n[TEST 8] Proceeding to checkout...");
    const checkoutRes = await makeRequest("/checkout", "POST", {
      payment_method_id: 1, // Cash / default
      address_id: addressId
    }, token);
    transactionId = checkoutRes.transaction_id;
    console.log(`✔ Order placed successfully! Transaction ID: #${transactionId}, Total: $${checkoutRes.total}`);

    // 9. ORDER HISTORY & TRACKING
    console.log("\n[TEST 9] Fetching order history...");
    const ordersRes = await makeRequest(`/orders/${userId}`, "GET", null, token);
    const placedOrder = ordersRes.data.find(o => Number(o.transaction_id) === transactionId);
    if (placedOrder) {
      console.log(`✔ Order History check passed! Status: ${placedOrder.order_status}, Ship Address: ${placedOrder.street_address}`);
    } else {
      throw new Error("Order not found in history.");
    }

    // 10. INVOICE REVIEW
    console.log("\n[TEST 10] Fetching invoice details...");
    const invoiceRes = await makeRequest(`/invoice/${transactionId}`, "GET", null, token);
    const inv = invoiceRes.data;
    if (Number(inv.transaction_id) === transactionId && inv.items.length > 0) {
      console.log(`✔ Invoice check passed! Ref: ${inv.transaction_reference}, Amount: $${inv.total_amount}`);
    } else {
      throw new Error("Invoice details mismatch.");
    }

    // 11. ADMIN ANALYTICS
    console.log("\n[TEST 11] Fetching admin stats & telemetry aggregations...");
    const adminStatsRes = await makeRequest("/admin/stats", "GET");
    const stats = adminStatsRes.data;
    console.log("✔ Admin Stats summary:");
    console.log("  - Total Users registered:", stats.total_users);
    console.log("  - Total Sales volume: $", stats.total_sales);
    console.log("  - Total Orders completed:", stats.total_orders);
    console.log("  - Avg Time spent on page:", stats.avg_time_spent_seconds ?? stats.avg_time_spent, "seconds");
    console.log("  - Cart Conversion Rate:", stats.conversion_rate ? stats.conversion_rate.toFixed(1) + "%" : "N/A");
    console.log("  - Top Searches:", stats.top_searches.map(s => `"${s.query}" (${s.count})`).join(", "));
    console.log("  - Top Viewed Products:", stats.top_viewed.map(v => `${v.name} (${v.views} views)`).join(", "));

    console.log("\n=== ALL E2E INTEGRATION TESTS COMPLETED SUCCESSFULLY! ===");
    process.exit(0);

  } catch (err) {
    console.error("\n❌ E2E Verification failed with error:", err);
    process.exit(1);
  }
}

// Small delay to ensure server started
setTimeout(runTests, 1000);
