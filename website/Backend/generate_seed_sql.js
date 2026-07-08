// generate_seed_sql.js
const fs = require("fs");
const { queryAll } = require("./db");

const IMAGES = {
  Mobile: [
    "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=600&auto=format&fit=crop&q=80",
    "https://images.unsplash.com/photo-1598327105666-5b89351aff97?w=600&auto=format&fit=crop&q=80",
    "https://images.unsplash.com/photo-1565849906461-0e443530e24c?w=600&auto=format&fit=crop&q=80"
  ],
  Laptop: [
    "https://images.unsplash.com/photo-1496181130204-755241544e35?w=600&auto=format&fit=crop&q=80",
    "https://images.unsplash.com/photo-1588872657578-7efd1f1555ed?w=600&auto=format&fit=crop&q=80",
    "https://images.unsplash.com/photo-1603302576837-37561b2e2302?w=600&auto=format&fit=crop&q=80"
  ],
  Electronics: [
    "https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80",
    "https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80",
    "https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80"
  ],
  Accessories: [
    "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600&auto=format&fit=crop&q=80",
    "https://images.unsplash.com/photo-1546435770-a3e426bf472b?w=600&auto=format&fit=crop&q=80",
    "https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=600&auto=format&fit=crop&q=80"
  ],
  Home: [
    "https://images.unsplash.com/photo-1584622650111-993a426fbf0a?w=600&auto=format&fit=crop&q=80",
    "https://images.unsplash.com/photo-1522335789203-aabd1fc54bc9?w=600&auto=format&fit=crop&q=80",
    "https://images.unsplash.com/photo-1574269909862-7e1d70bb8078?w=600&auto=format&fit=crop&q=80"
  ],
  Gaming: [
    "https://images.unsplash.com/photo-1605901309584-818e25960a8f?w=600&auto=format&fit=crop&q=80",
    "https://images.unsplash.com/photo-1592155977684-f0605554ac85?w=600&auto=format&fit=crop&q=80",
    "https://images.unsplash.com/photo-1607604276583-eef5d076aa5f?w=600&auto=format&fit=crop&q=80"
  ]
};

function escapeSql(value) {
  if (value === null || value === undefined) return "NULL";
  return `N'${String(value).replace(/'/g, "''")}'`;
}

async function run() {
  const products = await queryAll(`
    SELECT p.product_id, p.product_name, c.name AS category_name, b.name AS brand_name
    FROM products p
    LEFT JOIN categories c ON p.category_id = c.category_id
    LEFT JOIN brands b ON p.brand_id = b.brand_id
  `);

  let sql = [];
  sql.push("SET NOCOUNT ON;");
  sql.push("DELETE FROM product_details;");
  sql.push("DELETE FROM product_images;");
  sql.push("DELETE FROM product_specs;");
  sql.push("DELETE FROM product_features;");

  for (const p of products) {
    const pid = p.product_id;
    const cat = p.category_name || "Electronics";
    const brand = p.brand_name || "Generic";
    const name = p.product_name;

    const desc = `The premium ${name} by ${brand} delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.`;
    const fullSpecs = `Brand: ${brand}\nModel: ${name}\nCategory: ${cat}\nWarranty: 2 Years Manufacturer Warranty\nShipping: Ships in 1-2 business days with express tracking.`;
    const warranty = "2 Years Manufacturer Warranty";
    const shipping = "Free Express Shipping worldwide. Dispatched within 24 hours.";

    sql.push(`INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (${pid}, ${escapeSql(desc)}, ${escapeSql(fullSpecs)}, ${escapeSql(warranty)}, ${escapeSql(shipping)});`);

    const imgList = IMAGES[cat] || IMAGES["Electronics"];
    for (let i = 0; i < imgList.length; i++) {
      const isPrimary = i === 0 ? 1 : 0;
      const imgUrl = `${imgList[i]}&sig=${pid}_${i}`;
      sql.push(`INSERT INTO product_images (product_id, image_url, is_primary) VALUES (${pid}, ${escapeSql(imgUrl)}, ${isPrimary});`);
    }

    const specs = [
      { key: "Brand", val: brand },
      { key: "Model", val: name },
      { key: "Condition", val: "New" },
      { key: "Rating", val: "Excellent" }
    ];
    if (cat === "Mobile" || cat === "Tablet" || name.includes("Phone") || name.includes("iPad")) {
      specs.push({ key: "Network", val: "5G Enabled" });
      specs.push({ key: "Screen", val: "OLED High Refresh Rate" });
      specs.push({ key: "Battery", val: "All-day Battery Life" });
    } else if (cat === "Laptop" || name.includes("Laptop") || name.includes("MacBook") || name.includes("EliteBook")) {
      specs.push({ key: "CPU", val: "Intel i7 / Apple Silicon M-Series" });
      specs.push({ key: "RAM", val: "16GB LPDDR5" });
      specs.push({ key: "Storage", val: "512GB NVMe SSD" });
    } else {
      specs.push({ key: "Connectivity", val: "Wireless / Bluetooth" });
      specs.push({ key: "Color", val: "Matte Black / Space Gray" });
    }

    for (const spec of specs) {
      sql.push(`INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (${pid}, ${escapeSql(spec.key)}, ${escapeSql(spec.val)});`);
    }

    const features = [
      "Built with high-quality, durable materials for longevity.",
      "Sleek and modern aesthetic that looks premium in any setting.",
      "Optimized for energy efficiency and high performance.",
      "Includes comprehensive package contents and quick start guide."
    ];
    for (const f of features) {
      sql.push(`INSERT INTO product_features (product_id, feature_text) VALUES (${pid}, ${escapeSql(f)});`);
    }
  }

  fs.writeFileSync("seed_data.sql", sql.join("\n"), "utf8");
  console.log("SQL file generated successfully as seed_data.sql!");
  process.exit(0);
}

run().catch(err => {
  console.error(err);
  process.exit(1);
});
