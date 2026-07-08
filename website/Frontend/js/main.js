import {
  getProducts,
  getProduct,
  getCategories,
  login,
  signup,
  logout,
  getCart,
  addToCart,
  updateCart,
  removeCart,
  getAddresses,
  addAddress,
  deleteAddress,
  getPaymentMethods,
  checkout,
  getWishlist,
  addToWishlist,
  removeFromWishlist,
  getRelatedProducts,
  getBoughtTogether,
  getRecentRecommendations,
  getForYouRecommendations,
  getTrendingRecommendations,
  logEvent,
  getOrders,
  getInvoice,
  getAdminProducts,
  getAdminOrders,
  getAdminStats,
  setAuth,
  clearAuth,
  getUserId,
  logRecommendationClick,
  getSystemStats,
  getBestSelling,
  getMostViewed,
  getLatestProducts,
  patchProductViews,
  patchProductStock
} from "./api.js";

// Helper to show messages
function showMessage(el, text, type = "error") {
  if (!el) return;
  el.className = type;
  el.textContent = text;
}

// Helper to validate email
function validEmail(email) {
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
}

// Fallback image urls mapping based on product category & name keywords
const fallbackImages = {
  mobile: [
    "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=600&auto=format&fit=crop&q=80",
    "https://images.unsplash.com/photo-1598327105666-5b89351aff97?w=600&auto=format&fit=crop&q=80",
    "https://images.unsplash.com/photo-1565849906461-0e443530e24c?w=600&auto=format&fit=crop&q=80"
  ],
  laptop: [
    "https://images.unsplash.com/photo-1496181130204-755241544e35?w=600&auto=format&fit=crop&q=80",
    "https://images.unsplash.com/photo-1588872657578-7efd1f1555ed?w=600&auto=format&fit=crop&q=80",
    "https://images.unsplash.com/photo-1603302576837-37561b2e2302?w=600&auto=format&fit=crop&q=80"
  ],
  audio: [
    "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600&auto=format&fit=crop&q=80",
    "https://images.unsplash.com/photo-1484704849700-f032a568e944?w=600&auto=format&fit=crop&q=80",
    "https://images.unsplash.com/photo-1546435770-a3e426bf472b?w=600&auto=format&fit=crop&q=80"
  ],
  electronics: [
    "https://images.unsplash.com/photo-1527689368864-3a821dbccc34?w=600&auto=format&fit=crop&q=80",
    "https://images.unsplash.com/photo-1593305841991-05c297ba4575?w=600&auto=format&fit=crop&q=80",
    "https://images.unsplash.com/photo-1550745165-9bc0b252726f?w=600&auto=format&fit=crop&q=80"
  ],
  appliances: [
    "https://images.unsplash.com/photo-1584622650111-993a426fbf0a?w=600&auto=format&fit=crop&q=80",
    "https://images.unsplash.com/photo-1522338242992-e1a54906a8da?w=600&auto=format&fit=crop&q=80",
    "https://images.unsplash.com/photo-1626806787461-102c1bfaaea1?w=600&auto=format&fit=crop&q=80"
  ],
  default: [
    "https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80"
  ]
};

export function getProductImages(product) {
  const name = (product.product_name || product.name || "").toLowerCase();
  const cat = (product.category_name || "").toLowerCase();
  let type = "default";

  if (cat.includes("laptop") || name.includes("laptop") || name.includes("macbook") || name.includes("thinkpad") || name.includes("spectre") || name.includes("rog") || name.includes("hp elitebook") || name.includes("gigabyte")) {
    type = "laptop";
  } else if (cat.includes("mobile") || name.includes("phone") || name.includes("iphone") || name.includes("galaxy") || name.includes("pixel") || name.includes("motorola") || name.includes("nothing")) {
    type = "mobile";
  } else if (name.includes("headset") || name.includes("headphone") || name.includes("audio") || name.includes("soundbar") || name.includes("buds") || name.includes("earbuds") || name.includes("echo")) {
    type = "audio";
  } else if (name.includes("washing") || name.includes("mixer") || name.includes("dryer") || name.includes("conditioner")) {
    type = "appliances";
  } else if (cat.includes("electronics") || name.includes("camera") || name.includes("lock") || name.includes("toothbrush") || name.includes("charger") || name.includes("hub") || name.includes("hdd") || name.includes("ram") || name.includes("controller") || name.includes("deck")) {
    type = "electronics";
  }

  if (product.images && product.images.length > 0) {
    return product.images.map(img => img.image_url);
  }
  if (product.image_url) {
    return [product.image_url];
  }
  return fallbackImages[type] || fallbackImages.default;
}

// User wishlist in memory cache
export const userWishlist = new Set();
export async function loadUserWishlist() {
  const token = localStorage.getItem("token") || sessionStorage.getItem("token");
  if (!token) return;
  try {
    const { data = [] } = await getWishlist();
    userWishlist.clear();
    data.forEach(item => userWishlist.add(Number(item.product_id)));
  } catch (e) {
    console.warn("Failed to load wishlist:", e);
  }
}

// Slide-in Toast notifications manager
function getToastContainer() {
  let container = document.getElementById("toastContainer");
  if (!container) {
    container = document.createElement("div");
    container.id = "toastContainer";
    container.className = "toast-container";
    document.body.appendChild(container);
  }
  return container;
}

export function showToast(message, type = "info", duration = 4000) {
  const container = getToastContainer();
  const toast = document.createElement("div");
  toast.className = `toast toast-${type}`;
  
  let icon = "ℹ️";
  if (type === "success") icon = "✅";
  if (type === "error") icon = "❌";
  if (type === "warning") icon = "⚠️";

  toast.innerHTML = `
    <div style="display:flex; align-items:center; gap:8px;">
      <span>${icon}</span>
      <span>${message}</span>
    </div>
    <button class="toast-close">&times;</button>
  `;
  
  container.appendChild(toast);
  setTimeout(() => toast.classList.add("show"), 10);

  const closeToast = () => {
    toast.classList.remove("show");
    setTimeout(() => toast.remove(), 300);
  };

  toast.querySelector(".toast-close").addEventListener("click", closeToast);
  if (duration > 0) {
    setTimeout(closeToast, duration);
  }
}

// Live Cart badge update
export async function updateCartBadge() {
  const token = localStorage.getItem("token") || sessionStorage.getItem("token");
  const cartBtns = document.querySelectorAll(".nav-cart-btn");
  if (!cartBtns.length) return;

  if (!token) {
    const guestItems = JSON.parse(localStorage.getItem("guest_cart") || "[]");
    const totalCount = guestItems.reduce((sum, item) => sum + item.quantity, 0);
    cartBtns.forEach(btn => {
      btn.innerHTML = `Cart ${totalCount > 0 ? `<span class="discount-badge" style="margin-left:4px; padding:2px 5px; background:var(--accent); color:#000;">${totalCount}</span>` : ""}`;
    });
    return;
  }

  try {
    const { data = [] } = await getCart();
    const totalCount = data.reduce((sum, item) => sum + item.quantity, 0);
    cartBtns.forEach(btn => {
      btn.innerHTML = `Cart ${totalCount > 0 ? `<span class="discount-badge" style="margin-left:4px; padding:2px 5px; background:var(--accent); color:#000;">${totalCount}</span>` : ""}`;
    });
  } catch (e) {
    console.warn("Failed to update cart badge:", e);
  }
}

// Profile info fetch
let cachedProfile = null;
export async function fetchUserProfile() {
  if (cachedProfile) return cachedProfile;
  const token = getToken();
  if (!token) return null;
  try {
    const response = await fetch("http://localhost:5000/api/user/profile", {
      headers: getHeaders()
    });
    if (response.ok) {
      const payload = await response.json();
      cachedProfile = payload.data;
      return cachedProfile;
    }
  } catch (e) {
    console.warn("Failed to fetch profile:", e);
  }
  return null;
}

// Skeleton screen renderer
export function renderSkeletonGrid(count = 6) {
  return Array(count).fill(0).map(() => `
    <div class="course-card">
      <div class="skeleton skeleton-img"></div>
      <div class="skeleton skeleton-title"></div>
      <div class="skeleton skeleton-meta" style="width: 50%;"></div>
      <div class="skeleton skeleton-price" style="width: 30%;"></div>
      <div class="card-actions" style="margin-top:12px;">
        <div class="skeleton skeleton-btn" style="height:32px; width:45%;"></div>
        <div class="skeleton skeleton-btn" style="height:32px; width:45%;"></div>
      </div>
    </div>
  `).join("");
}

// Track page time spent
let pageStartTime = Date.now();
function initTimeTracking() {
  const logTimeSpent = () => {
    const timeSpentSeconds = Math.round((Date.now() - pageStartTime) / 1000);
    const token = localStorage.getItem("token") || sessionStorage.getItem("token");
    const headers = { "Content-Type": "application/json" };
    if (token) headers["Authorization"] = `Bearer ${token}`;

    const body = JSON.stringify({
      event_type: "time_spent",
      product_id: null,
      properties: String(timeSpentSeconds)
    });

    fetch("http://localhost:5000/api/events", {
      method: "POST",
      headers,
      body,
      keepalive: true
    }).catch(() => {});
  };

  window.addEventListener("beforeunload", logTimeSpent);
  window.addEventListener("pagehide", logTimeSpent);
}

// Dynamically render the navigation bar based on login state
export function renderNavbar() {
  const navLinks = document.querySelector(".nav-links");
  if (!navLinks) return;

  const token = localStorage.getItem("token") || sessionStorage.getItem("token");
  const userId = getUserId();

  if (token && userId) {
    navLinks.innerHTML = `
      <a class="nav-btn" href="./index.html">Home</a>
      <a class="nav-btn" href="./products.html">Products</a>
      <a class="nav-cart-btn" href="./cart.html">Cart</a>
      <a class="nav-btn" href="./profile.html#wishlist">Wishlist</a>
      <a class="nav-btn" href="./profile.html#orders">My Orders</a>
      <a class="nav-btn" href="./profile.html">Profile</a>
      <a class="nav-btn" href="./admin.html">Admin</a>
      <div class="nav-user-container">
        <div id="navAvatar" class="nav-avatar">U</div>
        <span id="navUsername" style="font-size:13px; color:var(--text2);">User #${userId}</span>
      </div>
      <button class="nav-cta" id="logoutBtn" style="cursor:pointer; background:var(--red); color:#fff; border-color:transparent;">Logout</button>
    `;
    document.getElementById("logoutBtn").addEventListener("click", handleLogout);
    
    // Fetch actual username and initials avatar asynchronously
    fetchUserProfile().then(user => {
      if (user) {
        const initials = `${user.first_name[0] || ""}${user.last_name[0] || ""}`.toUpperCase() || "U";
        const avatarEl = document.getElementById("navAvatar");
        const nameEl = document.getElementById("navUsername");
        if (avatarEl) avatarEl.textContent = initials;
        if (nameEl) nameEl.textContent = `${user.first_name} ${user.last_name}`;
      }
    }).catch(() => {});
  } else {
    navLinks.innerHTML = `
      <a class="nav-btn" href="./index.html">Home</a>
      <a class="nav-btn" href="./products.html">Products</a>
      <a class="nav-cart-btn" href="./cart.html">Cart</a>
      <a class="nav-btn" href="./login.html">Login</a>
      <a class="nav-cta" href="./signup.html">Register</a>
    `;
  }
  updateCartBadge();
}

// Handle user logout
async function handleLogout() {
  try {
    await logout();
  } catch (err) {
    console.warn("Logout request failed:", err);
  }
  clearAuth();
  cachedProfile = null;
  window.location.href = "./index.html";
}

// Redirect if page requires login
function checkAuthProtection() {
  const page = document.body.dataset.page;
  const token = localStorage.getItem("token") || sessionStorage.getItem("token");
  const protectedPages = ["cart", "checkout", "profile"];
  
  if (protectedPages.includes(page) && !token) {
    showToast("Please log in to access this page.", "info");
    setTimeout(() => {
      window.location.href = "./login.html";
    }, 1500);
  }
}

// Product Card HTML builder
export function productCard(product) {
  const productId = Number(product.product_id);
  const name = product.product_name || product.name || "Unnamed product";
  const rating = product.avg_rating ? Number(product.avg_rating).toFixed(1) : "0.0";
  const reviewsCount = product.total_reviews ?? 0;
  const stock = product.stock_quantity ?? 0;
  const brand = product.brand_name || "Premium Brand";
  const category = product.category_name || "Electronics";
  const viewsCount = product.views_count ?? 0;
  const soldCount = product.sold_count ?? 0;
  const isBestSeller = soldCount >= 15;
  
  // Image selection
  const imagesList = getProductImages(product);
  const primaryImg = imagesList[0];

  // Price & Discount Calculation (Simulated)
  const basePrice = Number(product.price || 0);
  const hasDiscount = (productId % 3 === 0);
  const discountPercent = hasDiscount ? (10 + (productId % 4) * 5) : 0; // 10%, 15%, 20%, 25%
  const finalPrice = hasDiscount ? (basePrice * (1 - discountPercent / 100)) : basePrice;

  const priceHtml = hasDiscount 
    ? `<div style="display:flex; align-items:center; gap:8px;">
         <span style="font-size:16px; font-weight:700; color:var(--accent);">$${finalPrice.toFixed(2)}</span>
         <span style="font-size:13px; text-decoration:line-through; color:var(--text3);">$${basePrice.toFixed(2)}</span>
         <span class="discount-badge">-${discountPercent}%</span>
       </div>`
    : `<div style="font-size:16px; font-weight:700; color:var(--accent);">$${basePrice.toFixed(2)}</div>`;

  // Stock status text
  let stockHtml = `<span style="color:var(--green); font-weight:600; font-size:12px;">In Stock (${stock})</span>`;
  if (stock === 0) {
    stockHtml = `<span style="color:var(--red); font-weight:600; font-size:12px;">Out of Stock</span>`;
  } else if (stock <= 5) {
    stockHtml = `<span style="color:var(--amber); font-weight:600; font-size:12px;">⚠️ Only ${stock} left!</span>`;
  }

  // Wishlist state
  const isWish = userWishlist.has(productId);
  const wishlistBtnClass = isWish ? "wishlist-icon-btn active" : "wishlist-icon-btn";
  const wishlistHeart = isWish ? "❤️" : "🤍";

  const description = product.description || "High performance retail product with modern technology specs.";
  const shortDesc = description.length > 70 ? description.substring(0, 67) + "..." : description;

  // Best seller badge overlay
  const bestSellerBadge = isBestSeller
    ? `<span class="default-badge" style="background:var(--accent); color:#000; font-size:10px; font-weight:700; padding:3px 8px; border-radius:4px; position:absolute; top:12px; left:12px; z-index:10; box-shadow:0 4px 10px rgba(0,0,0,0.3);">🔥 Best Seller</span>`
    : "";

  return `
    <div class="course-card" style="display:flex; flex-direction:column; justify-content:space-between; position:relative; overflow:hidden;">
      <!-- Best Seller Badge -->
      ${bestSellerBadge}

      <!-- Wishlist Heart Button -->
      <button class="${wishlistBtnClass}" data-wl-toggle="${productId}" style="position:absolute; top:12px; right:12px; z-index:10; background:rgba(8,13,20,0.6); border-radius:50%; width:32px; height:32px; display:flex; align-items:center; justify-content:center; border:none; outline:none; cursor:pointer; font-size:16px;">
        ${wishlistHeart}
      </button>

      <div>
        <!-- Product Image -->
        <a href="./product.html?id=${productId}" data-click-product="${productId}">
          <img src="${primaryImg}" alt="${name}" style="width:100%; height:160px; object-fit:cover; border-radius:8px; margin-bottom:12px; border:1px solid var(--border);" />
        </a>

        <!-- Brand & Category -->
        <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:6px;">
          <span style="font-size:11px; text-transform:uppercase; color:var(--text2); font-weight:600;">${brand}</span>
          <span class="tag" style="padding:2px 8px; font-size:10px;">${category}</span>
        </div>

        <!-- Title -->
        <h3 class="card-title" style="font-size:15px; font-weight:700; margin-bottom:6px; line-height:1.3; font-family:var(--font-body);">
          <a href="./product.html?id=${productId}" data-click-product="${productId}" style="color:var(--text); transition:color 0.2s;">
            ${name}
          </a>
        </h3>

        <!-- Description -->
        <p style="font-size:12px; color:var(--text2); margin-bottom:10px; line-height:1.4;">${shortDesc}</p>

        <!-- Rating & Analytics Views/Sold -->
        <div class="card-meta" style="display:flex; justify-content:space-between; align-items:center; margin-bottom:10px; font-size:12px;">
          <span>⭐ ${rating} <span style="color:var(--text3);">(${reviewsCount})</span></span>
          <span style="color:var(--text2); font-size:11px;">👁️ ${viewsCount} &nbsp;|&nbsp; 🛍️ ${soldCount}</span>
        </div>
      </div>

      <!-- Price & Actions -->
      <div style="border-top:1px solid var(--border); padding-top:12px; margin-top:6px;">
        <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:10px;">
          <div>${priceHtml}</div>
          <div>${stockHtml}</div>
        </div>
        <div class="card-actions" style="display:grid; grid-template-columns: 1fr auto; gap:8px;">
          <a class="btn-sm btn-details" style="text-align:center; padding:8px 4px; font-size:12px; font-weight:600;" href="./product.html?id=${productId}" data-click-product="${productId}">Details</a>
          <button class="btn-sm btn-enroll" data-add="${productId}" style="padding:8px 12px; font-size:12px; font-weight:600; display:flex; align-items:center; gap:4px; ${stock === 0 ? 'background:var(--text3); color:var(--text2); border-color:transparent; cursor:not-allowed;' : ''}" ${stock === 0 ? "disabled" : ""}>
            ${stock === 0 ? "Out of Stock" : "Add to Cart"}
          </button>
        </div>
      </div>
    </div>
  `;
}

// Bind product card interaction listeners
export function bindProductCardEvents(container) {
  if (!container) return;

  container.querySelectorAll("[data-add]").forEach(btn => {
    btn.addEventListener("click", async (e) => {
      e.preventDefault();
      const id = Number(btn.getAttribute("data-add"));
      await handleAddToCart(id, 1);
    });
  });

  container.querySelectorAll("[data-wl-toggle]").forEach(btn => {
    btn.addEventListener("click", async (e) => {
      e.preventDefault();
      const id = Number(btn.getAttribute("data-wl-toggle"));
      const token = getToken();
      if (!token) {
        showToast("Please log in to manage your wishlist.", "info");
        setTimeout(() => {
          window.location.href = `./login.html?redirect=${encodeURIComponent(window.location.href)}`;
        }, 1500);
        return;
      }

      try {
        if (userWishlist.has(id)) {
          await removeFromWishlist(id);
          userWishlist.delete(id);
          btn.innerHTML = "🤍";
          btn.classList.remove("active");
          showToast("Removed from wishlist", "success");
          await logEvent("remove_from_wishlist", id);
        } else {
          await addToWishlist(id);
          userWishlist.add(id);
          btn.innerHTML = "❤️";
          btn.classList.add("active");
          showToast("Added to wishlist", "success");
          await logEvent("add_to_wishlist", id);
        }
      } catch (err) {
        showToast(err.message, "error");
      }
    });
  });

  container.querySelectorAll("[data-click-product]").forEach(el => {
    el.addEventListener("click", () => {
      const id = Number(el.getAttribute("data-click-product"));
      logEvent("click_product", id);
    });
  });
}

// Standard Add to Cart handler (enforces login protection)
export async function handleAddToCart(productId, quantity) {
  const token = localStorage.getItem("token") || sessionStorage.getItem("token");
  if (!token) {
    showToast("Please log in to add items to your cart.", "info");
    setTimeout(() => {
      window.location.href = `./login.html?redirect=${encodeURIComponent(window.location.href)}`;
    }, 1500);
    return;
  }

  try {
    await addToCart(productId, quantity);
    await logEvent("add_to_cart", productId, { quantity });
    showToast("Added to cart successfully!", "success");
    updateCartBadge();
  } catch (error) {
    showToast(`Failed to add to cart: ${error.message}`, "error");
  }
}

// 1. HOME PAGE
async function renderHome() {
  const target = document.getElementById("products");
  const forYouSection = document.getElementById("forYouSection");
  const forYouRecs = document.getElementById("forYouRecs");
  const trendingRecs = document.getElementById("trendingRecs");

  // Show shimmer screens
  target.innerHTML = renderSkeletonGrid(8);
  trendingRecs.innerHTML = renderSkeletonGrid(4);
  forYouRecs.innerHTML = renderSkeletonGrid(4);

  await loadUserWishlist();

  // Load All Products
  try {
    const result = await getProducts();
    const products = result.data || [];
    target.innerHTML = products.map(productCard).join("");
    bindProductCardEvents(target);
  } catch (error) {
    target.innerHTML = `<p class="error">${error.message}</p>`;
  }

  // Load Trending recommendations
  try {
    const result = await getTrendingRecommendations();
    const items = result.data || [];
    trendingRecs.innerHTML = items.map(productCard).join("");
    bindProductCardEvents(trendingRecs);
  } catch (e) {
    trendingRecs.innerHTML = `<p class="error">${e.message}</p>`;
  }

  // Load Tabbed Sections (Best Selling, Most Viewed, Latest)
  const tabbedContainer = document.getElementById("tabbedProducts");
  const tabButtons = document.querySelectorAll(".tab-btn");
  if (tabbedContainer && tabButtons.length > 0) {
    const loadTab = async (tabName) => {
      tabbedContainer.innerHTML = renderSkeletonGrid(4);
      try {
        let result;
        if (tabName === "best-selling") {
          result = await getBestSelling();
        } else if (tabName === "most-viewed") {
          result = await getMostViewed();
        } else if (tabName === "latest") {
          result = await getLatestProducts();
        }
        
        const items = result.data || [];
        if (items.length === 0) {
          tabbedContainer.innerHTML = "<p style='color:var(--text3); font-size:14px; padding:10px 0;'>No products in this category.</p>";
        } else {
          // Limit to top 8 for main view
          tabbedContainer.innerHTML = items.slice(0, 8).map(productCard).join("");
          bindProductCardEvents(tabbedContainer);
        }
      } catch (err) {
        tabbedContainer.innerHTML = `<p class="error">${err.message}</p>`;
      }
    };

    // Bind event listeners to tab buttons
    tabButtons.forEach(btn => {
      btn.addEventListener("click", async (e) => {
        e.preventDefault();
        tabButtons.forEach(b => {
          b.classList.remove("active");
          b.style.color = "var(--text3)";
          b.style.borderBottomColor = "transparent";
        });
        btn.classList.add("active");
        btn.style.color = "var(--accent)";
        btn.style.borderBottomColor = "var(--accent)";
        
        const selectedTab = btn.getAttribute("data-tab");
        await loadTab(selectedTab);
      });
    });

    // Load default tab
    await loadTab("best-selling");
  }

  // Load For You recommendations if logged in
  const token = getToken();
  if (token) {
    if (forYouSection) forYouSection.style.display = "block";
    try {
      const result = await getForYouRecommendations();
      const items = result.data || [];
      forYouRecs.innerHTML = items.map(productCard).join("");
      bindProductCardEvents(forYouRecs);
    } catch (e) {
      forYouRecs.innerHTML = `<p class="error">${e.message}</p>`;
    }
  }

  // Categories
  const categoriesEl = document.getElementById("categories");
  try {
    const result = await getCategories();
    categoriesEl.classList.remove("loading");
    categoriesEl.innerHTML = (result.data || []).map((c) => `<span class="tag">${c.name}</span>`).join("");
  } catch (error) {
    categoriesEl.innerHTML = `<p class="error">${error.message}</p>`;
  }

  // Search functionality
  const searchInput = document.getElementById("search");
  if (searchInput) {
    let searchTimeout;
    searchInput.addEventListener("input", () => {
      clearTimeout(searchTimeout);
      searchTimeout = setTimeout(async () => {
        const query = searchInput.value.trim();
        target.innerHTML = renderSkeletonGrid(4);
        try {
          const result = await getProducts(query);
          target.innerHTML = (result.data || []).map(productCard).join("");
          bindProductCardEvents(target);
          if (query) {
            await logEvent("search", null, query);
          }
        } catch (error) {
          target.innerHTML = `<p class="error">${error.message}</p>`;
        }
      }, 500);
    });
  }

  await logEvent("view_home");
}

// 2. PRODUCTS PAGE
async function renderProductsPage() {
  await renderProducts("products");
  await logEvent("view_products");
}

async function renderProducts(targetId) {
  const target = document.getElementById(targetId);
  target.innerHTML = renderSkeletonGrid(8);
  await loadUserWishlist();
  try {
    const result = await getProducts();
    const products = result.data || [];
    target.innerHTML = products.map(productCard).join("");
    bindProductCardEvents(target);
  } catch (error) {
    target.innerHTML = `<p class="error">${error.message}</p>`;
  }
}

// 3. PRODUCT DETAILS PAGE
async function renderProductDetails() {
  const target = document.getElementById("product");
  const productId = Number(new URLSearchParams(window.location.search).get("id"));
  if (!productId) {
    target.innerHTML = '<p class="error">Missing product id</p>';
    return;
  }

  // Deduplicate page view counts within a 30-minute window
  const viewedKey = "viewed_products_timers";
  let viewedTimers = {};
  try { viewedTimers = JSON.parse(localStorage.getItem(viewedKey) || "{}"); } catch (_) {}
  const lastViewed = viewedTimers[productId];
  const now = Date.now();
  if (!lastViewed || (now - lastViewed > 30 * 60 * 1000)) {
    try {
      await patchProductViews(productId);
      viewedTimers[productId] = now;
      localStorage.setItem(viewedKey, JSON.stringify(viewedTimers));
    } catch (e) {
      console.warn("Failed to increment view counter:", e);
    }
  }

  try {
    const { data: product } = await getProduct(productId);
    const productName = product.product_name || product.name || "Unnamed product";
    const rating = product.avg_rating ? Number(product.avg_rating).toFixed(1) : "0.0";
    const reviewsCount = product.total_reviews ?? 0;
    const stock = product.stock_quantity ?? 0;
    const price = typeof product.price === "number" ? `$${product.price.toFixed(2)}` : `$${product.price}`;
    const viewsCount = product.views_count ?? 0;
    const soldCount = product.sold_count ?? 0;

    await loadUserWishlist();

    // Check if in wishlist
    let wishlistButtonText = "❤ Add to Wishlist";
    let isWishlisted = userWishlist.has(productId);
    const token = localStorage.getItem("token") || sessionStorage.getItem("token");
    if (isWishlisted) {
      wishlistButtonText = "❤ Wishlisted";
    }

    // Product images gallery logic
    const imgs = getProductImages(product);
    const primaryImg = imgs[0] || "https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop";

    const thumbsHtml = imgs.map((imgUrl, idx) => `
      <img src="${imgUrl}" class="thumb-img ${imgUrl === primaryImg ? 'active' : ''}" data-idx="${idx}" alt="Thumb ${idx + 1}" />
    `).join("");

    // Realistic fallback specifications if empty
    let specs = product.specs || [];
    if (!specs.length) {
      const pName = productName.toLowerCase();
      if (pName.includes("laptop") || pName.includes("macbook") || pName.includes("thinkpad") || pName.includes("rog") || pName.includes("aorus") || pName.includes("elitebook")) {
        specs = [
          { spec_key: "Processor", spec_value: "High-Performance Core Octa-Core Processor" },
          { spec_key: "Memory", spec_value: "16GB LPDDR5 Dual-Channel High Speed RAM" },
          { spec_key: "Storage", spec_value: "512GB PCIe Gen4 NVMe SSD" },
          { spec_key: "Display", spec_value: "14.2-inch Liquid Retina IPS Display (120Hz)" }
        ];
      } else if (pName.includes("phone") || pName.includes("iphone") || pName.includes("galaxy") || pName.includes("pixel") || pName.includes("edge")) {
        specs = [
          { spec_key: "Display", spec_value: "6.1-inch Super OLED Display (120Hz)" },
          { spec_key: "Processor", spec_value: "Next-gen Octa-Core High Energy Chip" },
          { spec_key: "Camera", spec_value: "Dual 50MP Wide & Ultra-Wide Camera Array" },
          { spec_key: "Battery Life", spec_value: "Up to 24 hours of all-day battery" }
        ];
      } else {
        specs = [
          { spec_key: "Product Type", spec_value: "Retail Technology Accessories" },
          { spec_key: "Model Year", spec_value: "2026 Edition" },
          { spec_key: "Certification", spec_value: "FCC / CE Certified Product" },
          { spec_key: "Connectivity", spec_value: "Ultra-low latency connection protocol" }
        ];
      }
    }

    const specsHtml = specs.map(spec => `
      <tr>
        <td>${spec.spec_key}</td>
        <td>${spec.spec_value}</td>
      </tr>
    `).join("");

    // Fallback key features if empty
    let features = product.features || [];
    if (!features.length) {
      const pName = productName.toLowerCase();
      if (pName.includes("laptop") || pName.includes("macbook") || pName.includes("phone") || pName.includes("iphone")) {
        features = [
          { feature_text: "Engineered for maximum speed and compute efficiency." },
          { feature_text: "Stunning high-refresh display with vivid, true-to-life colors." },
          { feature_text: "Integrated security chip to encrypt biometric and session keys." }
        ];
      } else {
        features = [
          { feature_text: "Robust built quality with premium, industrial-grade materials." },
          { feature_text: "Intuitive touch parameters and plug-and-play synchronization." },
          { feature_text: "Eco-friendly retail package utilizing recycled composite plastics." }
        ];
      }
    }

    const featuresHtml = features.map(f => `
      <li>${f.feature_text}</li>
    `).join("");

    // Reviews list
    const reviewsList = product.reviews || [];
    let reviewsHtml = reviewsList.map(r => `
      <div class="review-item">
        <div class="review-header">
          <strong>${r.first_name} ${r.last_name[0]}. ${r.is_verified ? '<span class="default-badge" style="background:var(--accent); color:#000; font-size:9px; padding:1px 6px;">Verified Buyer</span>' : ''}</strong>
          <span class="review-stars">${"⭐".repeat(r.score)}</span>
        </div>
        <p class="review-text">${r.review_text || "No review content provided."}</p>
        <span style="font-size:11px; color:var(--text3);">${new Date(r.created_at).toLocaleDateString()}</span>
      </div>
    `).join("");

    if (!reviewsHtml) {
      reviewsHtml = "<p style='color:var(--text3); font-size:14px; padding:10px 0;'>No reviews yet. Be the first to review this product!</p>";
    }

    // Stock Status tags
    let stockStatusHtml = `<span class="default-badge" style="background:rgba(0, 229, 153, 0.1); color:var(--green); font-size:12px; padding:4px 10px;">In Stock (${stock} left)</span>`;
    if (stock === 0) {
      stockStatusHtml = `<span class="default-badge" style="background:rgba(255, 80, 80, 0.1); color:var(--red); font-size:12px; padding:4px 10px;">Out of Stock</span>`;
    } else if (stock <= 5) {
      stockStatusHtml = `<span class="default-badge" style="background:rgba(255, 176, 32, 0.1); color:var(--amber); font-size:12px; padding:4px 10px;">⚠️ Only ${stock} left!</span>`;
    }

    target.innerHTML = `
      <div class="product-detail-layout">
        <!-- Left: Images -->
        <div class="gallery-wrap">
          <div class="main-img-container" id="mainImgContainer">
            <img id="mainProductImg" src="${primaryImg}" alt="${productName}" />
          </div>
          <div class="thumb-container">
            ${thumbsHtml}
          </div>
        </div>

        <!-- Right: Info -->
        <div class="product-info-wrap">
          <div>
            <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:12px; flex-wrap:wrap; gap:8px;">
              <div style="display:flex; align-items:center; gap:8px;">
                <span class="brand-badge" style="margin-bottom:0;">${product.brand_name || "Premium Tech"}</span>
                ${soldCount >= 15 ? '<span class="default-badge" style="background:var(--accent); color:#000; font-size:10px; font-weight:700; padding:2px 8px; border-radius:4px; border:none; box-shadow:0 2px 6px rgba(0,212,255,0.2);">🔥 Best Seller</span>' : ''}
              </div>
              ${stockStatusHtml}
            </div>
            <h1 class="page-title" style="font-size:32px; margin-bottom:10px;">${productName}</h1>
            
            <div class="card-meta" style="font-size:14px; margin-bottom:15px; display:flex; gap:16px; align-items:center; flex-wrap:wrap;">
              <span>⭐ ${rating} <span style="color:var(--text3);">(${reviewsCount} reviews)</span></span>
              <span style="color:var(--text2); font-size:13px;">👁️ <strong>${viewsCount}</strong> views &nbsp;|&nbsp; 🛍️ <strong>${soldCount}</strong> items sold</span>
            </div>
            
            <div class="info-block" style="padding:12px; margin-bottom:15px; background:var(--bg3);">
              <p style="color:var(--text2); font-size:14px; line-height:1.5;">${product.description || "No description available."}</p>
            </div>
            
            <div class="summary-total" style="margin:20px 0; border:none; padding:0;">
              <span style="font-size:16px; color:var(--text2);">Price</span>
              <span style="font-size:28px; font-family:var(--font-head); color:var(--accent); font-weight:700;">${price}</span>
            </div>
          </div>

          <div>
            <div class="row" style="align-items:center;">
              <label for="qty" class="form-label" style="margin-bottom:0;">Qty</label>
              <input id="qty" class="form-input" type="number" min="1" value="1" style="max-width:80px; text-align:center;" />
              <button class="wishlist-btn ${isWishlisted ? 'active' : ''}" id="wishlistBtn">${wishlistButtonText}</button>
            </div>
            
            <div class="action-row">
              <button class="btn-primary" id="addCartBtn" ${stock === 0 ? "disabled" : ""}>Add to Cart</button>
              <button class="btn-buy-now" id="buyNowBtn" ${stock === 0 ? "disabled" : ""}>Buy Now</button>
            </div>

            <div style="font-size:13px; color:var(--text3); display:flex; flex-direction:column; gap:4px; margin-top:10px;">
              <span><strong>Warranty:</strong> ${product.warranty_info || "Standard manufacturer warranty"}</span>
              <span><strong>Shipping:</strong> ${product.shipping_info || "Ships worldwide"}</span>
            </div>
          </div>
        </div>
      </div>

      <!-- Specs & Features detail block -->
      <div class="analytics-grid" style="margin-top:30px;">
        <div class="info-block">
          <h3>Product Specifications</h3>
          <table class="specs-table">${specsHtml}</table>
        </div>
        <div class="info-block">
          <h3>Key Features</h3>
          <ul class="features-list">${featuresHtml}</ul>
        </div>
      </div>

      <!-- Reviews Section -->
      <div class="info-block" style="margin-top:20px;">
        <h3>Customer Reviews</h3>
        <div class="reviews-list-block">${reviewsHtml}</div>
      </div>
    `;

    // Bind thumbnail click events to switch main image
    const mainImg = document.getElementById("mainProductImg");
    target.querySelectorAll(".thumb-img").forEach(thumb => {
      thumb.addEventListener("click", () => {
        target.querySelectorAll(".thumb-img").forEach(t => t.classList.remove("active"));
        thumb.classList.add("active");
        mainImg.src = thumb.src;
      });
    });

    // Image Zoom on Hover (Pointer coordinates zoom)
    const mainImgContainer = document.getElementById("mainImgContainer");
    if (mainImgContainer && mainImg) {
      mainImgContainer.addEventListener("mousemove", (e) => {
        const rect = mainImgContainer.getBoundingClientRect();
        const x = ((e.clientX - rect.left) / rect.width) * 100;
        const y = ((e.clientY - rect.top) / rect.height) * 100;
        mainImg.style.transformOrigin = `${x}% ${y}%`;
        mainImg.style.transform = "scale(1.5)";
      });
      
      mainImgContainer.addEventListener("mouseleave", () => {
        mainImg.style.transform = "scale(1)";
        mainImg.style.transformOrigin = "center center";
      });
    }

    // Wishlist Toggle
    document.getElementById("wishlistBtn").addEventListener("click", async () => {
      if (!token) {
        showToast("Please log in to manage your wishlist.", "info");
        setTimeout(() => {
          window.location.href = `./login.html?redirect=${encodeURIComponent(window.location.href)}`;
        }, 1500);
        return;
      }
      const btn = document.getElementById("wishlistBtn");
      try {
        if (isWishlisted) {
          await removeFromWishlist(productId);
          isWishlisted = false;
          userWishlist.delete(productId);
          btn.textContent = "❤ Add to Wishlist";
          btn.classList.remove("active");
          await logEvent("remove_from_wishlist", productId);
          showToast("Removed from wishlist.", "success");
        } else {
          await addToWishlist(productId);
          isWishlisted = true;
          userWishlist.add(productId);
          btn.textContent = "❤ Wishlisted";
          btn.classList.add("active");
          await logEvent("add_to_wishlist", productId);
          showToast("Added to wishlist.", "success");
        }
      } catch (err) {
        showToast(err.message, "error");
      }
    });

    // Add to Cart
    document.getElementById("addCartBtn").addEventListener("click", async () => {
      const qty = Number(document.getElementById("qty").value);
      if (qty <= 0) return showToast("Quantity must be greater than 0", "warning");
      if (qty > stock) return showToast(`Cannot exceed available stock of ${stock} items.`, "warning");
      await handleAddToCart(productId, qty);
    });

    // Buy Now (Add to cart + redirect to checkout)
    document.getElementById("buyNowBtn").addEventListener("click", async () => {
      if (!token) {
        showToast("Please log in to checkout.", "info");
        setTimeout(() => {
          window.location.href = `./login.html?redirect=${encodeURIComponent(window.location.href)}`;
        }, 1500);
        return;
      }
      const qty = Number(document.getElementById("qty").value);
      if (qty <= 0) return showToast("Quantity must be greater than 0", "warning");
      if (qty > stock) return showToast(`Cannot exceed available stock of ${stock} items.`, "warning");
      try {
        await addToCart(productId, qty);
        updateCartBadge();
        window.location.href = "./checkout.html";
      } catch (err) {
        showToast(err.message, "error");
      }
    });

    // Load recommendations
    renderRecommendations(productId);

    // Log product view event
    await logEvent("view_product", productId);

  } catch (error) {
    target.innerHTML = `<p class="error">${error.message}</p>`;
  }
}

// Render recommendations on product page
async function renderRecommendations(productId) {
  const boughtEl = document.getElementById("boughtTogether");
  const relatedEl = document.getElementById("relatedProducts");

  boughtEl.innerHTML = renderSkeletonGrid(3);
  relatedEl.innerHTML = renderSkeletonGrid(3);

  await loadUserWishlist();

  // Bought together
  try {
    const { data: items = [] } = await getBoughtTogether(productId);
    boughtEl.classList.remove("loading");
    if (!items.length) {
      boughtEl.innerHTML = "<p style='color:var(--text3); font-size:14px; padding:10px 0;'>No co-occurrence purchases recorded.</p>";
    } else {
      boughtEl.innerHTML = items.slice(0, 4).map(productCard).join("");
      bindProductCardEvents(boughtEl);
    }
  } catch (e) {
    boughtEl.innerHTML = `<p class="error">${e.message}</p>`;
  }

  // Related products
  try {
    const { data: items = [] } = await getRelatedProducts(productId);
    relatedEl.classList.remove("loading");
    if (!items.length) {
      relatedEl.innerHTML = "<p style='color:var(--text3); font-size:14px; padding:10px 0;'>No related items found.</p>";
    } else {
      relatedEl.innerHTML = items.slice(0, 4).map(productCard).join("");
      bindProductCardEvents(relatedEl);
    }
  } catch (e) {
    relatedEl.innerHTML = `<p class="error">${e.message}</p>`;
  }
}

// 4. CART PAGE
async function renderCart() {
  const target = document.getElementById("cartItems");
  const totalEl = document.getElementById("cartTotal");

  // Show skeleton while loading
  target.innerHTML = `
    ${[1,2,3].map(() => `
      <div class="cart-item" style="display:flex; gap:16px; align-items:center; padding:16px 0; border-bottom:1px solid var(--border);">
        <div class="skeleton" style="width:70px; height:70px; border-radius:8px; flex-shrink:0;"></div>
        <div style="flex:1; display:flex; flex-direction:column; gap:10px;">
          <div class="skeleton" style="height:16px; width:60%; border-radius:6px;"></div>
          <div class="skeleton" style="height:12px; width:40%; border-radius:6px;"></div>
          <div class="skeleton" style="height:30px; width:80px; border-radius:6px;"></div>
        </div>
      </div>
    `).join('')}
  `;

  try {
    const { data: items = [] } = await getCart();
    if (!items.length) {
      target.innerHTML = `
        <div style="text-align:center; padding:60px 20px; color:var(--text3);">
          <div style="font-size:64px; margin-bottom:16px; opacity:0.4;">🛒</div>
          <h3 style="font-family:var(--font-head); color:var(--text2); margin-bottom:8px;">Your cart is empty</h3>
          <p style="font-size:14px; margin-bottom:24px;">Browse products and add items to your cart.</p>
          <a class="btn-primary" href="./products.html" style="display:inline-block; text-decoration:none;">Start Shopping</a>
        </div>`;
      totalEl.textContent = "$0.00";
      updateCartBadge();
      return;
    }

    let total = 0;
    target.innerHTML = items.map((item) => {
      total += Number(item.line_total || 0);
      const imgs = getProductImages(item);
      const img = item.image_url || imgs[0] || "https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop";
      const price = typeof item.price === "number" ? `$${item.price.toFixed(2)}` : `$${item.price}`;
      const lineTotal = typeof item.line_total === "number" ? `$${item.line_total.toFixed(2)}` : `$${item.line_total}`;
      
      return `
      <div class="cart-item" style="display:flex; gap:16px; align-items:center; padding:16px 0; border-bottom:1px solid var(--border);">
        <a href="./product.html?id=${item.product_id}">
          <img src="${img}" style="width:80px; height:80px; border-radius:10px; object-fit:cover; border:1px solid var(--border); transition:opacity .2s;" onerror="this.src='https://images.unsplash.com/photo-1542751371-adc38448a05e?w=300&auto=format&fit=crop'" />
        </a>
        <div style="flex:1;">
          <div class="between" style="margin-bottom:4px;">
            <a href="./product.html?id=${item.product_id}" style="font-weight:600; color:var(--text1); text-decoration:none; font-size:15px;">${item.name}</a>
            <button class="btn-sm" data-remove="${item.cart_item_id}" style="background:transparent; border:1px solid var(--red); color:var(--red); border-radius:6px; padding:4px 10px; font-size:11px; cursor:pointer;">✕ Remove</button>
          </div>
          <div class="card-meta" style="margin-bottom:8px;">Unit: <strong style="color:var(--accent);">${price}</strong> &nbsp;|&nbsp; Subtotal: <strong>${lineTotal}</strong></div>
          <div style="display:flex; align-items:center; gap:8px;">
            <button class="qty-btn" data-dec="${item.cart_item_id}" style="width:28px; height:28px; background:var(--bg3); border:1px solid var(--border); border-radius:6px; font-size:16px; cursor:pointer; color:var(--text1);">−</button>
            <input class="form-input" type="number" min="1" value="${item.quantity}" data-qty="${item.cart_item_id}" style="max-width:60px; padding:4px 8px; border-radius:6px; text-align:center;" />
            <button class="qty-btn" data-inc="${item.cart_item_id}" data-current="${item.quantity}" style="width:28px; height:28px; background:var(--bg3); border:1px solid var(--border); border-radius:6px; font-size:16px; cursor:pointer; color:var(--text1);">+</button>
          </div>
        </div>
      </div>`;
    }).join("");

    totalEl.textContent = `$${total.toFixed(2)}`;
    updateCartBadge();

    // Remove item
    target.querySelectorAll("[data-remove]").forEach((btn) => btn.addEventListener("click", async () => {
      btn.textContent = "...";
      btn.disabled = true;
      try {
        await removeCart(Number(btn.getAttribute("data-remove")));
        await logEvent("remove_from_cart");
        showToast("Item removed from cart.", "success");
        renderCart();
      } catch (err) {
        showToast(err.message, "error");
      }
    }));

    // Decrement buttons
    target.querySelectorAll("[data-dec]").forEach((btn) => btn.addEventListener("click", async () => {
      const itemId = Number(btn.getAttribute("data-dec"));
      const input = target.querySelector(`[data-qty="${itemId}"]`);
      const newQty = Math.max(1, Number(input.value) - 1);
      input.value = newQty;
      await updateCart(itemId, newQty);
      renderCart();
    }));

    // Increment buttons
    target.querySelectorAll("[data-inc]").forEach((btn) => btn.addEventListener("click", async () => {
      const itemId = Number(btn.getAttribute("data-inc"));
      const input = target.querySelector(`[data-qty="${itemId}"]`);
      const item = items.find(i => Number(i.cart_item_id) === itemId);
      const stock = item ? Number(item.stock_quantity) : 999;
      const newQty = Number(input.value) + 1;
      if (newQty > stock) {
        return showToast(`Cannot exceed available stock of ${stock} items.`, "warning");
      }
      input.value = newQty;
      await updateCart(itemId, newQty);
      renderCart();
    }));

    // Manual quantity change
    target.querySelectorAll("[data-qty]").forEach((input) => input.addEventListener("change", async () => {
      const itemId = Number(input.getAttribute("data-qty"));
      const qty = Number(input.value);
      if (qty <= 0) return renderCart();
      const item = items.find(i => Number(i.cart_item_id) === itemId);
      const stock = item ? Number(item.stock_quantity) : 999;
      if (qty > stock) {
        showToast(`Cannot exceed available stock of ${stock} items.`, "warning");
        return renderCart();
      }
      await updateCart(itemId, qty);
      renderCart();
    }));

    await logEvent("view_cart");

  } catch (error) {
    target.innerHTML = `<p class="error">${error.message}</p>`;
  }
}

// 5. LOGIN PAGE
async function initLogin() {
  const btn = document.getElementById("loginBtn");
  const msg = document.getElementById("loginMsg");
  const redirectUrl = new URLSearchParams(window.location.search).get("redirect");

  btn.addEventListener("click", async () => {
    const email = document.getElementById("email").value.trim();
    const password = document.getElementById("password").value;
    const remember = document.getElementById("remember")?.checked || false;
    
    if (!email || !password) return showMessage(msg, "Email and password are required");
    if (!validEmail(email)) return showMessage(msg, "Invalid email format");

    btn.disabled = true;
    btn.textContent = "Signing in...";
    try {
      const result = await login(email, password);
      setAuth(result.token, result.user_id, remember);
      
      // Merge guest cart items to user cart upon login
      const guestItems = JSON.parse(localStorage.getItem("guest_cart") || "[]");
      for (const item of guestItems) {
        try { await addToCart(item.product_id, item.quantity); } catch (_) {}
      }
      localStorage.removeItem("guest_cart");

      showMessage(msg, "Login successful! Redirecting...", "success");
      setTimeout(() => {
        window.location.href = redirectUrl ? decodeURIComponent(redirectUrl) : "./index.html";
      }, 600);
    } catch (error) {
      showMessage(msg, error.message);
      btn.disabled = false;
      btn.textContent = "Login";
    }
  });
}

// 6. SIGNUP PAGE
async function initSignup() {
  const btn = document.getElementById("signupBtn");
  const msg = document.getElementById("signupMsg");
  const redirectUrl = new URLSearchParams(window.location.search).get("redirect");

  btn.addEventListener("click", async () => {
    const first = document.getElementById("first_name").value.trim();
    const last = document.getElementById("last_name").value.trim();
    const email = document.getElementById("email").value.trim();
    const password = document.getElementById("password").value;

    if (!first || !last || !email || !password) return showMessage(msg, "All fields are required");
    if (!validEmail(email)) return showMessage(msg, "Invalid email format");
    if (password.length < 6) return showMessage(msg, "Password must be at least 6 characters");

    btn.disabled = true;
    btn.textContent = "Creating account...";
    try {
      const result = await signup(first, last, email, password);
      setAuth(result.token, result.user_id, false);

      // Merge guest cart items
      const guestItems = JSON.parse(localStorage.getItem("guest_cart") || "[]");
      for (const item of guestItems) {
        try { await addToCart(item.product_id, item.quantity); } catch (_) {}
      }
      localStorage.removeItem("guest_cart");

      showMessage(msg, "Account created! Redirecting...", "success");
      setTimeout(() => {
        window.location.href = redirectUrl ? decodeURIComponent(redirectUrl) : "./index.html";
      }, 600);
    } catch (error) {
      showMessage(msg, error.message);
      btn.disabled = false;
      btn.textContent = "Create Account";
    }
  });
}

// 7. CHECKOUT PAGE
async function initCheckout() {
  const list = document.getElementById("checkoutItems");
  const totalEl = document.getElementById("checkoutTotal");
  const addrDropdown = document.getElementById("checkoutAddress");
  const payDropdown = document.getElementById("paymentMethod");
  const msg = document.getElementById("checkoutMsg");
  const btn = document.getElementById("checkoutBtn");

  // Skeleton loader
  list.innerHTML = `
    ${[1,2].map(() => `
      <div class="summary-row">
        <div class="skeleton" style="height:14px; width:55%; border-radius:4px;"></div>
        <div class="skeleton" style="height:14px; width:20%; border-radius:4px;"></div>
      </div>
    `).join('')}
  `;

  try {
    // 1. Fetch cart items
    const { data: items = [] } = await getCart();
    if (!items.length) {
      list.innerHTML = `
        <div style="text-align:center; padding:30px; color:var(--text3);">
          <div style="font-size:40px; margin-bottom:10px; opacity:0.4;">🛒</div>
          <p>Cart is empty. <a href="./products.html" style="color:var(--accent);">Browse products</a></p>
        </div>`;
      btn.disabled = true;
      return;
    }

    let total = 0;
    let itemCount = 0;
    list.innerHTML = items.map((item) => {
      total += Number(item.line_total || 0);
      itemCount += Number(item.quantity || 1);
      const lineTotal = typeof item.line_total === "number" ? `$${item.line_total.toFixed(2)}` : `$${item.line_total}`;
      const unitPrice = typeof item.price === "number" ? `$${item.price.toFixed(2)}` : `$${item.price}`;
      return `
        <div class="summary-row" style="align-items:flex-start; padding:8px 0;">
          <div>
            <span style="font-weight:500;">${item.name}</span>
            <span style="color:var(--text3); font-size:12px;"> × ${item.quantity} @ ${unitPrice}</span>
          </div>
          <span style="font-weight:600; color:var(--accent);">${lineTotal}</span>
        </div>`;
    }).join("");

    // Subtotal + shipping + total breakdown
    const shipping = total > 100 ? 0 : 9.99;
    const grandTotal = total + shipping;
    totalEl.textContent = `$${grandTotal.toFixed(2)}`;

    // Append breakdown summary below items
    list.insertAdjacentHTML("afterend", `
      <div style="margin-top:12px; padding-top:12px; border-top:1px solid var(--border);">
        <div class="summary-row" style="color:var(--text2); font-size:13px;"><span>Subtotal (${itemCount} items)</span><span>$${total.toFixed(2)}</span></div>
        <div class="summary-row" style="color:var(--text2); font-size:13px;"><span>Shipping</span><span>${shipping === 0 ? '<span style="color:var(--green);">Free</span>' : '$' + shipping.toFixed(2)}</span></div>
      </div>
    `);

    // 2. Fetch user addresses
    const { data: addresses = [] } = await getAddresses();
    if (!addresses.length) {
      addrDropdown.innerHTML = '<option value="">-- No addresses saved — go to Profile to add one --</option>';
    } else {
      addrDropdown.innerHTML = addresses.map(addr => `
        <option value="${addr.address_id}" ${addr.is_default ? 'selected' : ''}>
          ${addr.recipient_name} — ${addr.street_address}, ${addr.city} (${addr.address_type})
        </option>
      `).join("");
    }

    // 3. Fetch payment methods
    const { data: payments = [] } = await getPaymentMethods();
    if (payments.length) {
      payDropdown.innerHTML = payments.map(pay => `
        <option value="${pay.payment_method_id}">${pay.name} (${pay.description})</option>
      `).join("");
    }

    // 4. Submit checkout
    btn.addEventListener("click", async () => {
      const selectedAddressId = Number(addrDropdown.value);
      const selectedPaymentId = Number(payDropdown.value);

      if (!selectedAddressId) {
        return showMessage(msg, "Please select or add a shipping address first.");
      }

      btn.disabled = true;
      btn.innerHTML = '<span class="spinner" style="display:inline-block;width:14px;height:14px;border:2px solid rgba(255,255,255,.4);border-top-color:#fff;border-radius:50%;animation:spin 0.6s linear infinite;"></span> Processing...';

      try {
        const result = await checkout(selectedPaymentId, selectedAddressId);
        await logEvent("purchase", null, { total: result.total, transaction_id: result.transaction_id });
        updateCartBadge();
        showMessage(msg, "🎉 Order placed successfully! Redirecting...", "success");
        setTimeout(() => {
          window.location.href = `./invoice.html?transaction_id=${result.transaction_id}`;
        }, 1000);
      } catch (err) {
        showMessage(msg, err.message);
        btn.disabled = false;
        btn.textContent = "Submit Order";
      }
    });

    await logEvent("view_checkout");

  } catch (error) {
    showMessage(msg, error.message);
  }
}

// 8. INVOICE PAGE
async function renderInvoicePage() {
  const target = document.getElementById("invoice");
  const transactionId = Number(new URLSearchParams(window.location.search).get("transaction_id"));
  if (!transactionId) {
    target.innerHTML = '<p class="error">Missing transaction_id</p>';
    return;
  }

  try {
    const { data: inv } = await getInvoice(transactionId);
    target.classList.remove("loading");
    
    const formattedTotal = typeof inv.total_amount === "number" ? `$${inv.total_amount.toFixed(2)}` : `$${inv.total_amount}`;
    const invoiceRowsHtml = (inv.items || []).map((i) => {
      const lineTotal = typeof i.line_total === "number" ? `$${i.line_total.toFixed(2)}` : `$${i.line_total}`;
      const price = typeof i.unit_price === "number" ? `$${i.unit_price.toFixed(2)}` : `$${i.unit_price}`;
      return `
        <div class="invoice-row">
          <span>${i.name} x ${i.quantity} (at ${price})</span>
          <span>${lineTotal}</span>
        </div>`;
    }).join("");

    target.innerHTML = `
      <div style="display:flex; justify-content:space-between; margin-bottom:20px; align-items:center;">
        <div>
          <p style="font-size:18px; font-weight:700; color:var(--accent);">Invoice Ordered</p>
          <p style="font-size:13px; color:var(--text2);">Date: ${new Date(inv.transaction_date).toLocaleString()}</p>
        </div>
        <div style="text-align:right;">
          <span class="order-status">${inv.order_status || "Ordered"}</span>
        </div>
      </div>
      
      <p><strong>Transaction ID:</strong> #${inv.transaction_id}</p>
      <p><strong>Payment Reference:</strong> ${inv.transaction_reference || "N/A"}</p>
      <p><strong>Payment Method:</strong> ${inv.payment_method || "N/A"}</p>
      <p><strong>Payment Status:</strong> <span style="color:var(--green); font-weight:600;">${inv.payment_status || "Completed"}</span></p>
      
      <hr style="border-color:var(--border); margin:15px 0;" />
      
      <p><strong>Ship To:</strong></p>
      <p style="color:var(--text2); margin-bottom:15px; font-size:14px; line-height:1.4;">
        ${inv.recipient_name || "N/A"}<br/>
        ${inv.street_address || ""}<br/>
        ${inv.city}, ${inv.state} ${inv.postal_code}<br/>
        ${inv.country}
      </p>

      <hr style="border-color:var(--border); margin:15px 0;" />

      <h3 style="font-family:var(--font-head); font-size:16px; margin-bottom:10px;">Items</h3>
      ${invoiceRowsHtml}

      <div class="summary-total" style="margin-top:20px; border-top:1px solid var(--border); padding-top:15px;">
        <span>Grand Total</span>
        <span style="color:var(--accent); font-weight:700; font-size:22px;">${formattedTotal}</span>
      </div>
    `;

    await logEvent("view_invoice", null, { transaction_id: transactionId });

  } catch (error) {
    target.innerHTML = `<p class="error">${error.message}</p>`;
  }
}

// 9. PROFILE PAGE
async function renderProfile() {
  const user = getUserId();
  const userEl = document.getElementById("profileUser");
  const ordersEl = document.getElementById("orders");
  const addrListEl = document.getElementById("addressesList");
  const wishlistEl = document.getElementById("wishlistContainer");

  if (!user) {
    userEl.textContent = "Not logged in";
    ordersEl.innerHTML = '<p class="error">Please login first.</p>';
    return;
  }

  // Display user name from API
  userEl.textContent = `Loading profile...`;
  try {
    const profileResult = await fetch(`${API_BASE}/api/user/profile`, {
      headers: { Authorization: `Bearer ${localStorage.getItem("token") || sessionStorage.getItem("token")}` }
    });
    if (profileResult.ok) {
      const profileData = await profileResult.json();
      const u = profileData.data || profileData;
      const displayName = u.first_name ? `${u.first_name} ${u.last_name || ''}`.trim() : `User #${user}`;
      userEl.textContent = displayName;

      // Update avatar initials in navbar too
      const avatarEl = document.getElementById("userAvatar");
      if (avatarEl) {
        avatarEl.textContent = (u.first_name?.[0] || "") + (u.last_name?.[0] || "");
      }

      // Show full profile details
      const profileDetailsEl = document.getElementById("profileDetails");
      if (profileDetailsEl) {
        profileDetailsEl.innerHTML = `
          <div style="display:flex; flex-direction:column; gap:8px;">
            <div style="display:flex; gap:12px;">
              <div style="width:56px; height:56px; border-radius:50%; background:linear-gradient(135deg, var(--accent), var(--accent2)); display:flex; align-items:center; justify-content:center; font-size:22px; font-weight:700; color:#000; flex-shrink:0;">
                ${((u.first_name?.[0] || "") + (u.last_name?.[0] || "")).toUpperCase()}
              </div>
              <div>
                <div style="font-size:18px; font-weight:700; color:var(--text1);">${displayName}</div>
                <div style="font-size:13px; color:var(--text3);">${u.email || ""}</div>
                <div style="font-size:12px; color:var(--text3); margin-top:2px;">Member since ${u.created_at ? new Date(u.created_at).toLocaleDateString('en-US', { year:'numeric', month:'long' }) : "N/A"}</div>
              </div>
            </div>
          </div>
        `;
      }
    } else {
      userEl.textContent = `User #${user}`;
    }
  } catch (_) {
    userEl.textContent = `User #${user}`;
  }

  // Load recently viewed recommendations
  const recentRecsEl = document.getElementById("recentRecs");
  if (recentRecsEl) {
    recentRecsEl.innerHTML = renderSkeletonGrid(4);
    try {
      const recRes = await fetch(`${API_BASE}/api/recommendations/recent`, {
        headers: { Authorization: `Bearer ${localStorage.getItem("token") || sessionStorage.getItem("token")}` }
      });
      if (recRes.ok) {
        const recData = await recRes.json();
        const recItems = recData.data || [];
        if (recItems.length) {
          recentRecsEl.innerHTML = recItems.slice(0, 4).map(productCard).join("");
          bindProductCardEvents(recentRecsEl);
        } else {
          recentRecsEl.innerHTML = "<p style='color:var(--text3); font-size:14px; padding:10px 0;'>No recently viewed products yet.</p>";
        }
      } else {
        recentRecsEl.innerHTML = "<p style='color:var(--text3); font-size:14px; padding:10px 0;'>No recently viewed products yet.</p>";
      }
    } catch (_) {
      recentRecsEl.innerHTML = "<p style='color:var(--text3); font-size:14px; padding:10px 0;'>Could not load recently viewed items.</p>";
    }
  }

  // Function to load and render addresses
  const loadAddresses = async () => {
    addrListEl.innerHTML = '<p class="loading">Loading addresses...</p>';
    try {
      const { data: list = [] } = await getAddresses();
      addrListEl.classList.remove("loading");
      if (!list.length) {
        addrListEl.innerHTML = "<p style='color:var(--text3); font-size:14px;'>No addresses saved yet.</p>";
        return;
      }
      addrListEl.innerHTML = list.map(addr => `
        <div class="address-card">
          ${addr.is_default ? '<span class="default-badge">Default</span>' : ''}
          <div style="font-weight:600; font-size:15px; margin-bottom:4px;">${addr.recipient_name} (${addr.address_type})</div>
          <div style="font-size:13px; color:var(--text2); line-height:1.4;">
            ${addr.street_address}<br/>
            ${addr.city}, ${addr.state} ${addr.postal_code}, ${addr.country}
          </div>
          <div class="address-actions">
            <button class="btn-sm btn-details" style="background:var(--red); border:none; padding:4px 8px; font-size:11px; cursor:pointer;" data-del-addr="${addr.address_id}">Delete</button>
          </div>
        </div>
      `).join("");

      // Bind delete handlers
      addrListEl.querySelectorAll("[data-del-addr]").forEach(btn => {
        btn.addEventListener("click", async () => {
          const addrId = Number(btn.getAttribute("data-del-addr"));
          btn.textContent = "Deleting...";
          btn.disabled = true;
          try {
            await deleteAddress(addrId);
            showToast("Address deleted.", "success");
            loadAddresses();
          } catch (err) {
            showToast(err.message, "error");
            btn.disabled = false;
            btn.textContent = "Delete";
          }
        });
      });
    } catch (e) {
      addrListEl.innerHTML = `<p class="error">${e.message}</p>`;
    }
  };

  // Function to load and render wishlist
  const loadWishlist = async () => {
    wishlistEl.innerHTML = '<p class="loading">Loading wishlist...</p>';
    try {
      const { data: wl = [] } = await getWishlist();
      wishlistEl.classList.remove("loading");
      if (!wl.length) {
        wishlistEl.innerHTML = "<p style='color:var(--text3); font-size:14px;'>Your wishlist is empty.</p>";
        return;
      }
      wishlistEl.innerHTML = wl.map(w => `
        <div class="course-card" style="display:flex; flex-direction:column; justify-content:space-between;">
          <div>
            <img src="${w.image_url || 'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=300&auto=format&fit=crop'}" style="width:100%; height:110px; border-radius:8px; object-fit:cover; margin-bottom:8px; border:1px solid var(--border);" />
            <div class="card-title" style="font-size:14px; margin-bottom:4px;">${w.name}</div>
            <div class="card-price" style="font-size:15px; margin-bottom:8px;">$${Number(w.price).toFixed(2)}</div>
          </div>
          <div class="card-actions" style="flex-direction:column; gap:6px;">
            <button class="btn-sm btn-enroll" data-wl-cart="${w.product_id}" style="font-size:11px; padding:6px;">Add to Cart</button>
            <button class="btn-sm btn-details" data-wl-rem="${w.product_id}" style="font-size:11px; padding:6px; background:var(--surface2);">Remove</button>
          </div>
        </div>
      `).join("");

      // Bind wishlist events
      wishlistEl.querySelectorAll("[data-wl-cart]").forEach(btn => {
        btn.addEventListener("click", async () => {
          const pid = Number(btn.getAttribute("data-wl-cart"));
          await handleAddToCart(pid, 1);
        });
      });
      wishlistEl.querySelectorAll("[data-wl-rem]").forEach(btn => {
        btn.addEventListener("click", async () => {
          const pid = Number(btn.getAttribute("data-wl-rem"));
          btn.textContent = "Removing...";
          btn.disabled = true;
          try {
            await removeFromWishlist(pid);
            userWishlist.delete(pid);
            showToast("Removed from wishlist.", "success");
            loadWishlist();
          } catch (e) {
            showToast(e.message, "error");
          }
        });
      });
    } catch (e) {
      wishlistEl.innerHTML = `<p class="error">${e.message}</p>`;
    }
  };

  // Function to load and render orders with tracking
  const loadOrders = async () => {
    ordersEl.innerHTML = '<p class="loading">Loading orders...</p>';
    try {
      const { data: list = [] } = await getOrders(user);
      ordersEl.classList.remove("loading");
      if (!list.length) {
        ordersEl.innerHTML = "<p style='color:var(--text3); font-size:14px;'>No orders found.</p>";
        return;
      }
      ordersEl.innerHTML = list.map(o => {
        const orderDate = new Date(o.transaction_date).toLocaleDateString();
        const itemsHtml = (o.items || []).map(i => `
          <div class="order-item-row">
            <span>${i.name} x ${i.quantity}</span>
            <span>$${Number(i.line_total).toFixed(2)}</span>
          </div>
        `).join("");

        return `
          <div class="order-card">
            <div class="order-header">
              <div>
                <strong>Order #${o.transaction_id}</strong>
                <div style="font-size:12px; color:var(--text3); margin-top:2px;">Placed on: ${orderDate}</div>
              </div>
              <div>
                <span class="order-status">${o.order_status || "Ordered"}</span>
              </div>
            </div>
            
            <p style="font-size:13px; color:var(--text2); margin:5px 0;"><strong>Shipping To:</strong> ${o.recipient_name || "N/A"} - ${o.street_address}, ${o.city}</p>
            <p style="font-size:13px; color:var(--text2); margin:5px 0 12px 0;"><strong>Status Update Notes:</strong> <em>${o.order_notes || "Your order has been recorded."}</em></p>
            
            <div class="order-items">
              ${itemsHtml}
            </div>

            <div class="between" style="border-top:1px solid var(--border); padding-top:12px; margin-top:10px;">
              <div>Total: <strong style="color:var(--accent); font-size:16px;">$${Number(o.total_amount).toFixed(2)}</strong></div>
              <a class="btn-primary" href="./invoice.html?transaction_id=${o.transaction_id}" style="font-size:13px; padding:6px 12px;">View Invoice</a>
            </div>
          </div>
        `;
      }).join("");
    } catch (e) {
      ordersEl.innerHTML = `<p class="error">${e.message}</p>`;
    }
  };

  // Add address handler
  document.getElementById("addAddressBtn").addEventListener("click", async () => {
    const msg = document.getElementById("addressMsg");
    const name = document.getElementById("addrName").value.trim();
    const street = document.getElementById("addrStreet").value.trim();
    const city = document.getElementById("addrCity").value.trim();
    const state = document.getElementById("addrState").value.trim();
    const zip = document.getElementById("addrZip").value.trim();
    const country = document.getElementById("addrCountry").value.trim();
    const isDefault = document.getElementById("addrDefault").checked;

    if (!name || !street || !city || !state || !zip || !country) {
      return showMessage(msg, "Please fill out all address fields.");
    }

    try {
      await addAddress({
        recipient_name: name,
        street_address: street,
        city: city,
        state: state,
        postal_code: zip,
        country: country,
        is_default: isDefault
      });
      showMessage(msg, "Address added successfully!", "success");
      
      // Reset fields
      document.getElementById("addrName").value = "";
      document.getElementById("addrStreet").value = "";
      document.getElementById("addrCity").value = "";
      document.getElementById("addrState").value = "";
      document.getElementById("addrZip").value = "";
      document.getElementById("addrCountry").value = "";
      document.getElementById("addrDefault").checked = false;

      loadAddresses();
    } catch (e) {
      showMessage(msg, e.message);
    }
  });

  // Init loads
  loadAddresses();
  loadWishlist();
  loadOrders();

  await logEvent("view_profile");
}

// 10. ADMIN DASHBOARD PAGE
async function renderAdmin() {
  const statsEl = document.getElementById("stats");
  const productsEl = document.getElementById("adminProducts");
  const ordersEl = document.getElementById("adminOrders");
  const searchesEl = document.getElementById("topSearches");
  const viewedEl = document.getElementById("topViewed");
  const pipelineEl = document.getElementById("pipelineStats");

  // Skeleton loaders
  statsEl.innerHTML = `<div class="admin-stats-large" style="grid-template-columns: repeat(auto-fill, minmax(180px, 1fr));">${[1,2,3,4,5,6,7,8].map(() => '<div class="admin-stat-card"><div class="skeleton" style="height:14px; width:60%; border-radius:4px; margin-bottom:12px;"></div><div class="skeleton" style="height:32px; width:80%; border-radius:6px;"></div></div>').join('')}</div>`;
  if (pipelineEl) pipelineEl.innerHTML = `<div style="display:grid; grid-template-columns:repeat(auto-fit,minmax(150px,1fr)); gap:12px;">${[1,2,3,4].map(() => '<div class="skeleton" style="height:80px; border-radius:10px;"></div>').join('')}</div>`;

  try {
    const [statsResult, products, orders] = await Promise.all([getAdminStats(), getAdminProducts(), getAdminOrders()]);
    const stats = statsResult.data;

    statsEl.classList.remove("loading");
    statsEl.innerHTML = `
      <div class="admin-stats-large" style="grid-template-columns: repeat(auto-fill, minmax(180px, 1fr));">
        <div class="admin-stat-card"><div>📦 Total Products</div><h2>${stats.total_products ?? 0}</h2></div>
        <div class="admin-stat-card"><div>🛒 Total Orders</div><h2>${stats.total_orders ?? 0}</h2></div>
        <div class="admin-stat-card"><div>📈 Total Sales (Items)</div><h2>${stats.total_sales ?? 0}</h2></div>
        <div class="admin-stat-card"><div>💰 Total Revenue</div><h2>$${Number(stats.total_revenue || 0).toFixed(2)}</h2></div>
        <div class="admin-stat-card"><div>👥 Total Customers</div><h2>${stats.total_customers ?? 0}</h2></div>
        <div class="admin-stat-card"><div>👁️ Total Views</div><h2>${stats.total_views ?? 0}</h2></div>
        <div class="admin-stat-card" style="border-left: 4px solid var(--amber);"><div>⚠️ Low Stock</div><h2>${stats.low_stock_products ?? 0}</h2></div>
        <div class="admin-stat-card" style="border-left: 4px solid var(--red);"><div>🚨 Out of Stock</div><h2>${stats.out_of_stock_products ?? 0}</h2></div>
      </div>`;

    // Pipeline metrics (system stats)
    if (pipelineEl) {
      const renderPipeline = (data) => {
        const d = data || {};
        // Backend returns nested: kafka: {status, throughputMsgSec}, spark: {status, latencyMs}, redis: {status, hitRate}, system: {activeUsers}
        const kafkaStatus = (d.kafka?.status || "unknown").toLowerCase();
        const sparkStatus = (d.spark?.status || "unknown").toLowerCase();
        const redisStatus = (d.redis?.status || "unknown").toLowerCase();
        const dbStatus = (d.db?.status || "Healthy").toLowerCase();
        const activeUsers = d.system?.activeUsers ?? "—";
        const kafkaThroughput = d.kafka?.throughputMsgSec != null ? d.kafka.throughputMsgSec.toFixed(1) : "—";
        const sparkLatency = d.spark?.latencyMs != null ? d.spark.latencyMs : "—";
        const cacheHitRate = d.redis?.hitRate != null ? `${d.redis.hitRate}%` : "—";

        const statusBadge = (s) => s === "ok" || s === "running" || s === "connected" || s === "healthy"
          ? `<span style="color:var(--green); font-weight:600;">● ${s}</span>`
          : s === "unknown" ? `<span style="color:var(--text3);">○ ${s}</span>`
          : `<span style="color:var(--red); font-weight:600;">● ${s}</span>`;

        pipelineEl.innerHTML = `
          <div style="display:grid; grid-template-columns:repeat(auto-fit,minmax(160px,1fr)); gap:12px;">
            <div class="metric-card">
              <div class="metric-label">🔁 Kafka</div>
              <div class="metric-value">${kafkaThroughput} <span style="font-size:13px; color:var(--text3);">msg/s</span></div>
              <div style="font-size:12px; margin-top:4px;">${statusBadge(kafkaStatus)}</div>
            </div>
            <div class="metric-card">
              <div class="metric-label">⚡ Spark Latency</div>
              <div class="metric-value">${sparkLatency} <span style="font-size:13px; color:var(--text3);">ms</span></div>
              <div style="font-size:12px; margin-top:4px;">${statusBadge(sparkStatus)}</div>
            </div>
            <div class="metric-card">
              <div class="metric-label">📦 Redis Cache</div>
              <div class="metric-value">${cacheHitRate}</div>
              <div style="font-size:12px; margin-top:4px;">${statusBadge(redisStatus)}</div>
            </div>
            <div class="metric-card">
              <div class="metric-label">🗄 Database</div>
              <div class="metric-value">${activeUsers} <span style="font-size:13px; color:var(--text3);">active</span></div>
              <div style="font-size:12px; margin-top:4px;">${statusBadge(dbStatus)}</div>
            </div>
          </div>
          <div style="font-size:11px; color:var(--text3); margin-top:8px; text-align:right;">Last updated: ${new Date().toLocaleTimeString()}</div>
        `;
      };

      // Fetch live system stats
      try {
        const sysRes = await fetch(`${API_BASE}/api/admin/system-stats`, {
          headers: { Authorization: `Bearer ${localStorage.getItem("token") || sessionStorage.getItem("token")}` }
        });
        if (sysRes.ok) {
          const sysData = await sysRes.json();
          renderPipeline(sysData.data || sysData);
        } else {
          renderPipeline({});
        }
      } catch (_) {
        renderPipeline({});
      }

      // Poll every 15 seconds
      setInterval(async () => {
        try {
          const sysRes = await fetch(`${API_BASE}/api/admin/system-stats`, {
            headers: { Authorization: `Bearer ${localStorage.getItem("token") || sessionStorage.getItem("token")}` }
          });
          if (sysRes.ok) {
            const sysData = await sysRes.json();
            renderPipeline(sysData.data || sysData);
          }
        } catch (_) {}
      }, 15000);
    }

    // Top searches
    searchesEl.innerHTML = "";
    if (!stats.top_searches || !stats.top_searches.length) {
      searchesEl.innerHTML = "<p style='color:var(--text3); font-size:14px; padding:10px;'>No searches tracked yet.</p>";
    } else {
      const maxCount = Math.max(...stats.top_searches.map(s => s.count));
      searchesEl.innerHTML = stats.top_searches.map(s => `
        <div class="analytics-item">
          <span>"${s.query}"</span>
          <div style="display:flex; align-items:center; gap:8px;">
            <div style="width:80px; height:6px; border-radius:3px; background:var(--bg3); overflow:hidden;">
              <div style="width:${Math.round((s.count / maxCount) * 100)}%; height:100%; background:var(--accent); border-radius:3px;"></div>
            </div>
            <span>${s.count}</span>
          </div>
        </div>
      `).join("");
    }

    // Top viewed products
    viewedEl.innerHTML = "";
    if (!stats.top_viewed || !stats.top_viewed.length) {
      viewedEl.innerHTML = "<p style='color:var(--text3); font-size:14px; padding:10px;'>No product views tracked yet.</p>";
    } else {
      const maxViews = Math.max(...stats.top_viewed.map(v => v.views));
      viewedEl.innerHTML = stats.top_viewed.map(v => `
        <div class="analytics-item">
          <span>${v.name}</span>
          <div style="display:flex; align-items:center; gap:8px;">
            <div style="width:80px; height:6px; border-radius:3px; background:var(--bg3); overflow:hidden;">
              <div style="width:${Math.round((v.views / maxViews) * 100)}%; height:100%; background:var(--accent2,#a78bfa); border-radius:3px;"></div>
            </div>
            <span>${v.views}</span>
          </div>
        </div>
      `).join("");
    }

    // Render products list
    if (productsEl) {
      productsEl.innerHTML = (products.data || []).map((p) => {
        const price = typeof p.price === "number" ? `$${p.price.toFixed(2)}` : `$${p.price}`;
        const stockColor = p.stock_quantity === 0 ? 'var(--red)' : p.stock_quantity <= 5 ? 'var(--amber)' : 'var(--green)';
        return `
          <div class="course-card">
            <div class="card-title">${p.name}</div>
            <div class="card-meta" style="margin-bottom:6px;">Category: ${p.category_name || "General"} &nbsp;|&nbsp; ⭐ ${p.rating ?? 'N/A'}</div>
            <div style="display:flex; justify-content:space-between; align-items:center;">
              <div class="card-price" style="font-size:16px;">${price}</div>
              <span style="font-size:11px; color:${stockColor}; font-weight:600;">Stock: ${p.stock_quantity ?? '?'}</span>
            </div>
          </div>`;
      }).join("");
    }

    // Render orders table
    if (ordersEl) {
      ordersEl.innerHTML = `
        <div class="admin-table">
          ${(orders.data || []).map((o) => {
            const total = typeof o.total_amount === "number" ? `$${o.total_amount.toFixed(2)}` : `$${o.total_amount}`;
            const date = new Date(o.transaction_date).toLocaleDateString();
            const statusColor = o.payment_status === 'completed' ? 'var(--green)' : o.payment_status === 'failed' ? 'var(--red)' : 'var(--amber)';
            return `
              <div class="admin-table-row" style="grid-template-columns: 1fr 1.5fr 1fr 1fr;">
                <span style="font-weight:600;">#${o.transaction_id}</span>
                <span style="font-size:13px; color:var(--text2);">${date}</span>
                <span style="color:var(--accent); font-weight:600;">${total}</span>
                <span class="order-status" style="width:fit-content; color:${statusColor}; border-color:${statusColor};">${o.payment_status || "ordered"}</span>
              </div>`;
          }).join("")}
        </div>`;
    // Poll dashboard stats every 10 seconds for real-time auto-updates (Requirement 4)
    const statsInterval = setInterval(async () => {
      try {
        const statsRes = await getAdminStats();
        const updatedStats = statsRes.data;
        const cards = statsEl.querySelectorAll(".admin-stat-card h2");
        if (cards.length >= 8) {
          cards[0].textContent = updatedStats.total_products ?? 0;
          cards[1].textContent = updatedStats.total_orders ?? 0;
          cards[2].textContent = updatedStats.total_sales ?? 0;
          cards[3].textContent = `$${Number(updatedStats.total_revenue || 0).toFixed(2)}`;
          cards[4].textContent = updatedStats.total_customers ?? 0;
          cards[5].textContent = updatedStats.total_views ?? 0;
          cards[6].textContent = updatedStats.low_stock_products ?? 0;
          cards[7].textContent = updatedStats.out_of_stock_products ?? 0;
        }
      } catch (e) {
        console.warn("Failed to auto-update dashboard stats:", e);
      }
    }, 10000);

    await logEvent("view_admin");

  } catch (error) {
    statsEl.innerHTML = `<p class="error">${error.message}</p>`;
  }
}

// ROUTER BOOTSTRAP
async function boot() {
  renderNavbar();
  checkAuthProtection();
  initTimeTracking();

  const page = document.body.dataset.page;
  if (page === "home") await renderHome();
  if (page === "products") await renderProductsPage();
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
