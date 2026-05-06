const API_BASE = "http://localhost:5000/api";

function getToken() {
  return localStorage.getItem("token");
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

export async function getProducts() {
  return request("/products");
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

export async function checkout(payment_method_id = 1) {
  return request("/checkout", {
    method: "POST",
    body: JSON.stringify({ payment_method_id }),
  });
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

export function setAuth(token, userId) {
  localStorage.setItem("token", token);
  localStorage.setItem("user_id", String(userId));
}

export function clearAuth() {
  localStorage.removeItem("token");
  localStorage.removeItem("user_id");
}

export function getUserId() {
  return localStorage.getItem("user_id");
}
