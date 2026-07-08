const API_BASE = "http://localhost:5000/api";

function getToken() {
  return localStorage.getItem("token") || sessionStorage.getItem("token");
}

function getHeaders() {
  const token = getToken();
  return {
    "Content-Type": "application/json",
    ...(token ? { Authorization: `Bearer ${token}` } : {}),
  };
}

async function request(path, options = {}) {
  const response = await fetch(`${API_BASE}${path}`, {
    ...options,
    headers: { ...getHeaders(), ...(options.headers || {}) },
  });

  const payload = await response.json();
  if (!response.ok) {
    throw new Error(payload.error || "Request failed");
  }
  return payload;
}

export async function getProducts(searchQuery = "") {
  const q = searchQuery ? `?search=${encodeURIComponent(searchQuery)}` : "";
  return request(`/products${q}`);
}

export async function getProduct(id) {
  return request(`/products/${id}`);
}

export async function getCategories() {
  return request("/categories");
}

export async function login(email, password) {
  return request("/login", {
    method: "POST",
    body: JSON.stringify({ email, password }),
  });
}

export async function signup(first_name, last_name, email, password) {
  return request("/signup", {
    method: "POST",
    body: JSON.stringify({ first_name, last_name, email, password }),
  });
}

export async function logout() {
  return request("/logout", {
    method: "POST"
  });
}

export async function getCart() {
  return request("/cart");
}

export async function addToCart(product_id, quantity = 1) {
  return request("/cart/add", {
    method: "POST",
    body: JSON.stringify({ product_id, quantity }),
  });
}

export async function updateCart(cart_item_id, quantity) {
  return request("/cart/update", {
    method: "POST",
    body: JSON.stringify({ cart_item_id, quantity }),
  });
}

export async function removeCart(cart_item_id) {
  return request("/cart/remove", {
    method: "POST",
    body: JSON.stringify({ cart_item_id }),
  });
}

export async function getAddresses() {
  return request("/addresses");
}

export async function addAddress(addressData) {
  return request("/addresses", {
    method: "POST",
    body: JSON.stringify(addressData),
  });
}

export async function deleteAddress(address_id) {
  return request("/addresses/delete", {
    method: "POST",
    body: JSON.stringify({ address_id }),
  });
}

export async function getPaymentMethods() {
  return request("/payment/methods");
}

export async function checkout(payment_method_id = 1, address_id) {
  return request("/checkout", {
    method: "POST",
    body: JSON.stringify({ payment_method_id, address_id }),
  });
}

export async function getWishlist() {
  return request("/wishlist");
}

export async function addToWishlist(product_id) {
  return request("/wishlist/add", {
    method: "POST",
    body: JSON.stringify({ product_id }),
  });
}

export async function removeFromWishlist(product_id) {
  return request("/wishlist/remove", {
    method: "POST",
    body: JSON.stringify({ product_id }),
  });
}

export async function getRelatedProducts(productId) {
  return request(`/recommendations/related/${productId}`);
}

export async function getBoughtTogether(productId) {
  return request(`/recommendations/bought-together/${productId}`);
}

export async function getRecentRecommendations() {
  return request("/recommendations/recent");
}

export async function getForYouRecommendations() {
  return request("/recommendations/for-you");
}

export async function getTrendingRecommendations() {
  return request("/recommendations/trending");
}

export async function logEvent(event_type, product_id = null, properties = {}) {
  // Silent catch to prevent event errors from blocking UX
  try {
    return await request("/events", {
      method: "POST",
      body: JSON.stringify({ event_type, product_id, properties }),
    });
  } catch (err) {
    console.warn("Analytics event logging failed:", err);
  }
}

export async function getOrders(userId) {
  return request(`/orders/${userId}`);
}

export async function getInvoice(transactionId) {
  return request(`/invoice/${transactionId}`);
}

export async function getAdminProducts() {
  return request("/admin/products");
}

export async function getAdminOrders() {
  return request("/admin/orders");
}

export async function getAdminStats() {
  return request("/admin/stats");
}

export function setAuth(token, userId, remember = false) {
  if (remember) {
    localStorage.setItem("token", token);
    localStorage.setItem("user_id", String(userId));
  } else {
    sessionStorage.setItem("token", token);
    sessionStorage.setItem("user_id", String(userId));
  }
}

export function clearAuth() {
  localStorage.removeItem("token");
  localStorage.removeItem("user_id");
  sessionStorage.removeItem("token");
  sessionStorage.removeItem("user_id");
}

export function getUserId() {
  return localStorage.getItem("user_id") || sessionStorage.getItem("user_id");
}

export async function logRecommendationClick(product_id, recommendation_type) {
  try {
    return await request("/recommendations/feedback", {
      method: "POST",
      body: JSON.stringify({ product_id, recommendation_type })
    });
  } catch (err) {
    console.warn("Feedback logging failed:", err);
  }
}

export async function getSystemStats() {
  return request("/admin/system-stats");
}

export async function getDashboardStats() {
  return request("/dashboard/stats");
}

export async function patchProductStock(id, stock_quantity) {
  return request(`/products/${id}/stock`, {
    method: "PATCH",
    body: JSON.stringify({ stock_quantity })
  });
}

export async function patchProductViews(id) {
  return request(`/products/${id}/views`, {
    method: "PATCH"
  });
}

export async function getBestSelling() {
  return request("/products/best-selling");
}

export async function getMostViewed() {
  return request("/products/most-viewed");
}

export async function getLatestProducts() {
  return request("/products/latest");
}

export async function checkoutOrder(payment_method_id, address_id) {
  return request("/orders", {
    method: "POST",
    body: JSON.stringify({ payment_method_id, address_id })
  });
}

