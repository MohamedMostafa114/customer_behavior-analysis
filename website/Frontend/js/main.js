import {
  addToCart,
  checkout,
  getAdminOrders,
  getAdminProducts,
  getAdminStats,
  getCart,
  getCategories,
  getInvoice,
  getOrders,
  getProduct,
  getProducts,
  getUserId,
  login,
  removeCart,
  setAuth,
  signup,
  updateCart,
} from "./api.js";

function showMessage(el, text, type = "error") {
  if (!el) return;
  el.className = type;
  el.textContent = text;
}

function validEmail(email) {
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
}

function guestCart() {
  return JSON.parse(localStorage.getItem("guest_cart") || "[]");
}

function setGuestCart(items) {
  localStorage.setItem("guest_cart", JSON.stringify(items));
}

async function syncGuestCartToServer() {
  const cart = guestCart();
  for (const item of cart) {
    await addToCart(item.product_id, item.quantity);
  }
  setGuestCart([]);
}

function productCard(product) {
  const productName = product.product_name || product.name || "Unnamed product";
  const rating = product.avg_rating ?? product.rating ?? "N/A";
  const stock = product.stock_quantity ?? product.stock ?? "N/A";
  return `
    <div class="course-card">
      <div class="card-title">${productName}</div>
      <div class="card-meta">Rating: ${rating} - Stock: ${stock}</div>
      <div class="card-price">${product.price}</div>
      <div class="card-actions">
        <a class="btn-sm btn-details" href="./product.html?id=${product.product_id}">View Details</a>
        <button class="btn-sm btn-enroll" data-add="${product.product_id}">Add to Cart</button>
      </div>
    </div>
  `;
}

async function renderProducts(targetId) {
  const target = document.getElementById(targetId);
  target.innerHTML = '<p class="loading">Loading products...</p>';
  try {
    const result = await getProducts();
    const products = result.data || [];
    console.log("Products API payload:", result);
    console.log("Products count:", products.length);
    target.innerHTML = products.map(productCard).join("");
    target.querySelectorAll("[data-add]").forEach((btn) => {
      btn.addEventListener("click", async () => {
        await handleAddToCart(Number(btn.getAttribute("data-add")), 1);
      });
    });
  } catch (error) {
    target.innerHTML = `<p class="error">${error.message}</p>`;
  }
}

async function handleAddToCart(productId, quantity) {
  if (quantity <= 0) return alert("Quantity must be greater than 0");
  const token = localStorage.getItem("token");

  if (!token) {
    const cart = guestCart();
    const found = cart.find((item) => item.product_id === productId);
    if (found) found.quantity += quantity;
    else cart.push({ product_id: productId, quantity });
    setGuestCart(cart);
    return alert("Added to guest cart");
  }

  await addToCart(productId, quantity);
  alert("Added to cart");
}

async function renderHome() {
  await renderProducts("products");
  const categoriesEl = document.getElementById("categories");
  try {
    const result = await getCategories();
    categoriesEl.classList.remove("loading");
    categoriesEl.innerHTML = (result.data || []).map((c) => `<span class="tag">${c.name}</span>`).join("");
  } catch (error) {
    categoriesEl.innerHTML = `<p class="error">${error.message}</p>`;
  }
}

async function renderProductDetails() {
  const target = document.getElementById("product");
  const productId = Number(new URLSearchParams(window.location.search).get("id"));
  if (!productId) return (target.innerHTML = '<p class="error">Missing product id</p>');

  try {
    const { data: product } = await getProduct(productId);
    console.log("Product details:", product);
    const productName = product.product_name || product.name || "Unnamed product";
    const rating = product.avg_rating ?? product.rating ?? "N/A";
    const stock = product.stock_quantity ?? product.stock ?? "N/A";
    target.classList.remove("loading");
    target.innerHTML = `
      <h1 class="page-title" style="font-size:30px">${productName}</h1>
      <p style="color:var(--text2);margin-bottom:10px">${product.description || "No description"}</p>
      <p class="card-meta">Rating: ${rating} - Stock: ${stock}</p>
      <div class="summary-total" style="margin:14px 0"><span>Price</span><span>${product.price}</span></div>
      <div class="row">
        <input id="qty" class="form-input" type="number" min="1" value="1" style="max-width:100px" />
        <button class="btn-primary" id="addProductBtn">Add to Cart</button>
      </div>
    `;

    document.getElementById("addProductBtn").addEventListener("click", async () => {
      const qty = Number(document.getElementById("qty").value);
      if (qty <= 0) return alert("Quantity must be greater than 0");
      await handleAddToCart(product.product_id, qty);
    });
  } catch (error) {
    target.innerHTML = `<p class="error">${error.message}</p>`;
  }
}

async function renderCart() {
  const target = document.getElementById("cartItems");
  const totalEl = document.getElementById("cartTotal");
  const token = localStorage.getItem("token");

  if (!token) {
    const cart = guestCart();
    if (!cart.length) {
      target.innerHTML = "<p class='loading'>Your guest cart is empty.</p>";
      totalEl.textContent = "0";
      return;
    }

    target.innerHTML = cart.map((item, idx) => `
      <div class="cart-item">
        <div class="between"><span>Product ID: ${item.product_id}</span><button class="btn-sm btn-details" data-remove-guest="${idx}">Remove</button></div>
        <div class="row" style="margin-top:8px"><label>Qty</label><input class="form-input" type="number" min="1" value="${item.quantity}" data-qty-guest="${idx}" style="max-width:100px" /></div>
      </div>`).join("");

    totalEl.textContent = "N/A";

    target.querySelectorAll("[data-remove-guest]").forEach((btn) => btn.addEventListener("click", () => {
      const items = guestCart();
      items.splice(Number(btn.getAttribute("data-remove-guest")), 1);
      setGuestCart(items);
      renderCart();
    }));

    target.querySelectorAll("[data-qty-guest]").forEach((input) => input.addEventListener("change", () => {
      const qty = Number(input.value);
      if (qty <= 0) return renderCart();
      const items = guestCart();
      items[Number(input.getAttribute("data-qty-guest"))].quantity = qty;
      setGuestCart(items);
    }));

    return;
  }

  try {
    const { data: items = [] } = await getCart();
    if (!items.length) {
      target.innerHTML = "<p class='loading'>Your cart is empty.</p>";
      totalEl.textContent = "0";
      return;
    }

    let total = 0;
    target.innerHTML = items.map((item) => {
      total += Number(item.line_total || 0);
      return `
      <div class="cart-item">
        <div class="between"><div><strong>${item.name}</strong><div class="card-meta">Price: ${item.price}</div></div><button class="btn-sm btn-details" data-remove="${item.cart_item_id}">Remove</button></div>
        <div class="row" style="margin-top:8px"><label>Qty</label><input class="form-input" type="number" min="1" value="${item.quantity}" data-qty="${item.cart_item_id}" style="max-width:100px" /></div>
      </div>`;
    }).join("");

    totalEl.textContent = total.toFixed(2);

    target.querySelectorAll("[data-remove]").forEach((btn) => btn.addEventListener("click", async () => {
      await removeCart(Number(btn.getAttribute("data-remove")));
      renderCart();
    }));

    target.querySelectorAll("[data-qty]").forEach((input) => input.addEventListener("change", async () => {
      const qty = Number(input.value);
      if (qty <= 0) return renderCart();
      await updateCart(Number(input.getAttribute("data-qty")), qty);
      renderCart();
    }));
  } catch (error) {
    target.innerHTML = `<p class="error">${error.message}</p>`;
  }
}

async function initLogin() {
  const btn = document.getElementById("loginBtn");
  const msg = document.getElementById("loginMsg");
  btn.addEventListener("click", async () => {
    const email = document.getElementById("email").value.trim();
    const password = document.getElementById("password").value;
    if (!email || !password) return showMessage(msg, "Email and password are required");
    if (!validEmail(email)) return showMessage(msg, "Invalid email format");

    try {
      const result = await login(email, password);
      setAuth(result.token, result.user_id);
      await syncGuestCartToServer();
      showMessage(msg, "Login successful", "success");
      setTimeout(() => (window.location.href = "./index.html"), 500);
    } catch (error) {
      showMessage(msg, error.message);
    }
  });
}

async function initSignup() {
  const btn = document.getElementById("signupBtn");
  const msg = document.getElementById("signupMsg");
  btn.addEventListener("click", async () => {
    const first = document.getElementById("first_name").value.trim();
    const last = document.getElementById("last_name").value.trim();
    const email = document.getElementById("email").value.trim();
    const password = document.getElementById("password").value;

    if (!first || !last || !email || !password) return showMessage(msg, "All fields are required");
    if (!validEmail(email)) return showMessage(msg, "Invalid email format");

    try {
      const result = await signup(first, last, email, password);
      setAuth(result.token, result.user_id);
      await syncGuestCartToServer();
      showMessage(msg, "Signup successful", "success");
      setTimeout(() => (window.location.href = "./index.html"), 500);
    } catch (error) {
      showMessage(msg, error.message);
    }
  });
}

async function initCheckout() {
  const list = document.getElementById("checkoutItems");
  const msg = document.getElementById("checkoutMsg");
  const btn = document.getElementById("checkoutBtn");
  if (!localStorage.getItem("token")) {
    list.innerHTML = '<p class="error">Login is required for checkout.</p>';
    btn.disabled = true;
    return;
  }

  try {
    const { data: items = [] } = await getCart();
    if (!items.length) {
      list.innerHTML = "<p class='loading'>Cart is empty.</p>";
      btn.disabled = true;
      return;
    }

    list.innerHTML = items.map((item) => `<div class="summary-row"><span>${item.name} x ${item.quantity}</span><span>${item.line_total}</span></div>`).join("");

    btn.addEventListener("click", async () => {
      btn.disabled = true;
      btn.textContent = "Processing...";
      try {
        const result = await checkout(Number(document.getElementById("paymentMethod").value));
        showMessage(msg, "Order placed", "success");
        setTimeout(() => (window.location.href = `./invoice.html?transaction_id=${result.transaction_id}`), 600);
      } catch (error) {
        showMessage(msg, error.message);
      } finally {
        btn.disabled = false;
        btn.textContent = "Submit Order";
      }
    });
  } catch (error) {
    showMessage(msg, error.message);
  }
}

async function renderInvoicePage() {
  const target = document.getElementById("invoice");
  const transactionId = Number(new URLSearchParams(window.location.search).get("transaction_id"));
  if (!transactionId) return (target.innerHTML = '<p class="error">Missing transaction_id</p>');

  try {
    const { data: inv } = await getInvoice(transactionId);
    target.classList.remove("loading");
    target.innerHTML = `
      <p><strong>Transaction ID:</strong> ${inv.transaction_id}</p>
      <p><strong>Status:</strong> ${inv.payment_status || "N/A"}</p>
      <p><strong>Total:</strong> ${inv.total_amount}</p>
      <hr style="border-color:var(--border);margin:10px 0" />
      ${(inv.items || []).map((i) => `<div class="invoice-row"><span>${i.name} x ${i.quantity}</span><span>${i.line_total}</span></div>`).join("")}
    `;
  } catch (error) {
    target.innerHTML = `<p class="error">${error.message}</p>`;
  }
}

async function renderProfile() {
  const user = getUserId();
  const userEl = document.getElementById("profileUser");
  const ordersEl = document.getElementById("orders");
  if (!user) {
    userEl.textContent = "Not logged in";
    ordersEl.innerHTML = '<p class="error">Please login first.</p>';
    return;
  }

  userEl.textContent = user;
  try {
    const { data: orders = [] } = await getOrders(user);
    if (!orders.length) return (ordersEl.innerHTML = "<p class='loading'>No orders found.</p>");

    ordersEl.classList.remove("loading");
    ordersEl.innerHTML = orders.map((o) => `
      <div class="card" style="margin-bottom:8px">
        <div class="between"><span>Order #${o.transaction_id}</span><span>${o.payment_status || "N/A"}</span></div>
        <p style="margin:8px 0">Total: ${o.total_amount}</p>
        <a class="btn-primary" href="./invoice.html?transaction_id=${o.transaction_id}" style="display:inline-block;">View Invoice</a>
      </div>`).join("");
  } catch (error) {
    ordersEl.innerHTML = `<p class="error">${error.message}</p>`;
  }
}

async function renderAdmin() {
  const statsEl = document.getElementById("stats");
  const productsEl = document.getElementById("adminProducts");
  const ordersEl = document.getElementById("adminOrders");

  try {
    const [stats, products, orders] = await Promise.all([getAdminStats(), getAdminProducts(), getAdminOrders()]);

    statsEl.classList.remove("loading");
    statsEl.innerHTML = `
      <div class="admin-stats">
        <div class="admin-stat-card"><div>Users</div><h2>${stats.data.total_users}</h2></div>
        <div class="admin-stat-card"><div>Sales</div><h2>${stats.data.total_sales}</h2></div>
        <div class="admin-stat-card"><div>Orders</div><h2>${stats.data.total_orders}</h2></div>
      </div>`;

    productsEl.innerHTML = (products.data || []).map((p) => `<div class="course-card"><div class="card-title">${p.name}</div><div class="card-price">${p.price}</div></div>`).join("");

    ordersEl.innerHTML = `<div class="admin-table">${(orders.data || []).map((o) => `<div class="admin-table-row"><span>#${o.transaction_id}</span><span>${o.total_amount}</span><span>${o.payment_status || "N/A"}</span></div>`).join("")}</div>`;
  } catch (error) {
    statsEl.innerHTML = `<p class="error">${error.message}</p>`;
  }
}

async function boot() {
  const page = document.body.dataset.page;
  if (page === "home") await renderHome();
  if (page === "products") await renderProducts("products");
  if (page === "product") await renderProductDetails();
  if (page === "cart") await renderCart();
  if (page === "login") await initLogin();
  if (page === "signup") await initSignup();
  if (page === "checkout") await initCheckout();
  if (page === "invoice") await renderInvoicePage();
  if (page === "profile") await renderProfile();
  if (page === "admin") await renderAdmin();
}

boot();
