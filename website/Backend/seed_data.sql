SET NOCOUNT ON;
DELETE FROM product_details;
DELETE FROM product_images;
DELETE FROM product_specs;
DELETE FROM product_features;
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (1, N'The premium iPhone 14 by Apple delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Apple
Model: iPhone 14
Category: Mobile
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (1, N'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=600&auto=format&fit=crop&q=80&sig=1_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (1, N'https://images.unsplash.com/photo-1598327105666-5b89351aff97?w=600&auto=format&fit=crop&q=80&sig=1_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (1, N'https://images.unsplash.com/photo-1565849906461-0e443530e24c?w=600&auto=format&fit=crop&q=80&sig=1_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (1, N'Brand', N'Apple');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (1, N'Model', N'iPhone 14');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (1, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (1, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (1, N'Network', N'5G Enabled');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (1, N'Screen', N'OLED High Refresh Rate');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (1, N'Battery', N'All-day Battery Life');
INSERT INTO product_features (product_id, feature_text) VALUES (1, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (1, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (1, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (1, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (2, N'The premium Samsung S23 by Samsung delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Samsung
Model: Samsung S23
Category: Mobile
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (2, N'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=600&auto=format&fit=crop&q=80&sig=2_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (2, N'https://images.unsplash.com/photo-1598327105666-5b89351aff97?w=600&auto=format&fit=crop&q=80&sig=2_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (2, N'https://images.unsplash.com/photo-1565849906461-0e443530e24c?w=600&auto=format&fit=crop&q=80&sig=2_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (2, N'Brand', N'Samsung');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (2, N'Model', N'Samsung S23');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (2, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (2, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (2, N'Network', N'5G Enabled');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (2, N'Screen', N'OLED High Refresh Rate');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (2, N'Battery', N'All-day Battery Life');
INSERT INTO product_features (product_id, feature_text) VALUES (2, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (2, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (2, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (2, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (3, N'The premium Dell Laptop by Dell delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Dell
Model: Dell Laptop
Category: Laptop
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (3, N'https://images.unsplash.com/photo-1496181130204-755241544e35?w=600&auto=format&fit=crop&q=80&sig=3_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (3, N'https://images.unsplash.com/photo-1588872657578-7efd1f1555ed?w=600&auto=format&fit=crop&q=80&sig=3_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (3, N'https://images.unsplash.com/photo-1603302576837-37561b2e2302?w=600&auto=format&fit=crop&q=80&sig=3_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (3, N'Brand', N'Dell');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (3, N'Model', N'Dell Laptop');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (3, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (3, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (3, N'CPU', N'Intel i7 / Apple Silicon M-Series');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (3, N'RAM', N'16GB LPDDR5');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (3, N'Storage', N'512GB NVMe SSD');
INSERT INTO product_features (product_id, feature_text) VALUES (3, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (3, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (3, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (3, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (4, N'The premium iPhone 15 Pro Max by Apple delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Apple
Model: iPhone 15 Pro Max
Category: Mobile
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (4, N'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=600&auto=format&fit=crop&q=80&sig=4_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (4, N'https://images.unsplash.com/photo-1598327105666-5b89351aff97?w=600&auto=format&fit=crop&q=80&sig=4_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (4, N'https://images.unsplash.com/photo-1565849906461-0e443530e24c?w=600&auto=format&fit=crop&q=80&sig=4_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (4, N'Brand', N'Apple');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (4, N'Model', N'iPhone 15 Pro Max');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (4, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (4, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (4, N'Network', N'5G Enabled');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (4, N'Screen', N'OLED High Refresh Rate');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (4, N'Battery', N'All-day Battery Life');
INSERT INTO product_features (product_id, feature_text) VALUES (4, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (4, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (4, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (4, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (5, N'The premium Samsung Galaxy S24 Ultra by Samsung delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Samsung
Model: Samsung Galaxy S24 Ultra
Category: Mobile
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (5, N'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=600&auto=format&fit=crop&q=80&sig=5_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (5, N'https://images.unsplash.com/photo-1598327105666-5b89351aff97?w=600&auto=format&fit=crop&q=80&sig=5_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (5, N'https://images.unsplash.com/photo-1565849906461-0e443530e24c?w=600&auto=format&fit=crop&q=80&sig=5_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (5, N'Brand', N'Samsung');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (5, N'Model', N'Samsung Galaxy S24 Ultra');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (5, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (5, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (5, N'Network', N'5G Enabled');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (5, N'Screen', N'OLED High Refresh Rate');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (5, N'Battery', N'All-day Battery Life');
INSERT INTO product_features (product_id, feature_text) VALUES (5, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (5, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (5, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (5, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (6, N'The premium Xiaomi 13 Pro by Xiaomi delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Xiaomi
Model: Xiaomi 13 Pro
Category: Mobile
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (6, N'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=600&auto=format&fit=crop&q=80&sig=6_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (6, N'https://images.unsplash.com/photo-1598327105666-5b89351aff97?w=600&auto=format&fit=crop&q=80&sig=6_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (6, N'https://images.unsplash.com/photo-1565849906461-0e443530e24c?w=600&auto=format&fit=crop&q=80&sig=6_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (6, N'Brand', N'Xiaomi');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (6, N'Model', N'Xiaomi 13 Pro');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (6, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (6, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (6, N'Network', N'5G Enabled');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (6, N'Screen', N'OLED High Refresh Rate');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (6, N'Battery', N'All-day Battery Life');
INSERT INTO product_features (product_id, feature_text) VALUES (6, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (6, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (6, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (6, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (7, N'The premium Dell XPS 13 by Dell delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Dell
Model: Dell XPS 13
Category: Laptop
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (7, N'https://images.unsplash.com/photo-1496181130204-755241544e35?w=600&auto=format&fit=crop&q=80&sig=7_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (7, N'https://images.unsplash.com/photo-1588872657578-7efd1f1555ed?w=600&auto=format&fit=crop&q=80&sig=7_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (7, N'https://images.unsplash.com/photo-1603302576837-37561b2e2302?w=600&auto=format&fit=crop&q=80&sig=7_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (7, N'Brand', N'Dell');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (7, N'Model', N'Dell XPS 13');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (7, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (7, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (7, N'CPU', N'Intel i7 / Apple Silicon M-Series');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (7, N'RAM', N'16GB LPDDR5');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (7, N'Storage', N'512GB NVMe SSD');
INSERT INTO product_features (product_id, feature_text) VALUES (7, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (7, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (7, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (7, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (8, N'The premium HP Pavilion 15 by HP delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: HP
Model: HP Pavilion 15
Category: Laptop
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (8, N'https://images.unsplash.com/photo-1496181130204-755241544e35?w=600&auto=format&fit=crop&q=80&sig=8_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (8, N'https://images.unsplash.com/photo-1588872657578-7efd1f1555ed?w=600&auto=format&fit=crop&q=80&sig=8_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (8, N'https://images.unsplash.com/photo-1603302576837-37561b2e2302?w=600&auto=format&fit=crop&q=80&sig=8_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (8, N'Brand', N'HP');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (8, N'Model', N'HP Pavilion 15');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (8, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (8, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (8, N'CPU', N'Intel i7 / Apple Silicon M-Series');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (8, N'RAM', N'16GB LPDDR5');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (8, N'Storage', N'512GB NVMe SSD');
INSERT INTO product_features (product_id, feature_text) VALUES (8, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (8, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (8, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (8, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (9, N'The premium Lenovo Legion 5 by Lenovo delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Lenovo
Model: Lenovo Legion 5
Category: Laptop
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (9, N'https://images.unsplash.com/photo-1496181130204-755241544e35?w=600&auto=format&fit=crop&q=80&sig=9_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (9, N'https://images.unsplash.com/photo-1588872657578-7efd1f1555ed?w=600&auto=format&fit=crop&q=80&sig=9_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (9, N'https://images.unsplash.com/photo-1603302576837-37561b2e2302?w=600&auto=format&fit=crop&q=80&sig=9_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (9, N'Brand', N'Lenovo');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (9, N'Model', N'Lenovo Legion 5');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (9, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (9, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (9, N'CPU', N'Intel i7 / Apple Silicon M-Series');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (9, N'RAM', N'16GB LPDDR5');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (9, N'Storage', N'512GB NVMe SSD');
INSERT INTO product_features (product_id, feature_text) VALUES (9, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (9, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (9, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (9, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (10, N'The premium AirPods Pro 2 by Apple delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Apple
Model: AirPods Pro 2
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (10, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=10_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (10, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=10_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (10, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=10_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (10, N'Brand', N'Apple');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (10, N'Model', N'AirPods Pro 2');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (10, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (10, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (10, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (10, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (10, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (10, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (10, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (10, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (11, N'The premium Samsung Buds 2 by Samsung delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Samsung
Model: Samsung Buds 2
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (11, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=11_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (11, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=11_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (11, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=11_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (11, N'Brand', N'Samsung');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (11, N'Model', N'Samsung Buds 2');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (11, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (11, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (11, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (11, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (11, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (11, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (11, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (11, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (12, N'The premium Logitech MX Master 3 by Logitech delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Logitech
Model: Logitech MX Master 3
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (12, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=12_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (12, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=12_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (12, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=12_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (12, N'Brand', N'Logitech');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (12, N'Model', N'Logitech MX Master 3');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (12, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (12, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (12, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (12, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (12, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (12, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (12, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (12, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (13, N'The premium PlayStation 5 by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: PlayStation 5
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (13, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=13_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (13, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=13_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (13, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=13_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (13, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (13, N'Model', N'PlayStation 5');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (13, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (13, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (13, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (13, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (13, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (13, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (13, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (13, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (14, N'The premium Xbox Series X by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Xbox Series X
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (14, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=14_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (14, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=14_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (14, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=14_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (14, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (14, N'Model', N'Xbox Series X');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (14, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (14, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (14, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (14, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (14, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (14, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (14, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (14, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (15, N'The premium LG Smart TV 55 inch by LG delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: LG
Model: LG Smart TV 55 inch
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (15, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=15_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (15, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=15_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (15, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=15_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (15, N'Brand', N'LG');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (15, N'Model', N'LG Smart TV 55 inch');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (15, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (15, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (15, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (15, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (15, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (15, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (15, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (15, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (16, N'The premium Samsung Washing Machine by Samsung delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Samsung
Model: Samsung Washing Machine
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (16, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=16_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (16, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=16_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (16, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=16_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (16, N'Brand', N'Samsung');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (16, N'Model', N'Samsung Washing Machine');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (16, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (16, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (16, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (16, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (16, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (16, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (16, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (16, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (17, N'The premium MacBook Air M2 by Apple delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Apple
Model: MacBook Air M2
Category: Laptop
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (17, N'https://images.unsplash.com/photo-1496181130204-755241544e35?w=600&auto=format&fit=crop&q=80&sig=17_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (17, N'https://images.unsplash.com/photo-1588872657578-7efd1f1555ed?w=600&auto=format&fit=crop&q=80&sig=17_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (17, N'https://images.unsplash.com/photo-1603302576837-37561b2e2302?w=600&auto=format&fit=crop&q=80&sig=17_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (17, N'Brand', N'Apple');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (17, N'Model', N'MacBook Air M2');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (17, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (17, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (17, N'CPU', N'Intel i7 / Apple Silicon M-Series');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (17, N'RAM', N'16GB LPDDR5');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (17, N'Storage', N'512GB NVMe SSD');
INSERT INTO product_features (product_id, feature_text) VALUES (17, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (17, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (17, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (17, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (18, N'The premium Asus ROG Strix by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Asus ROG Strix
Category: Laptop
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (18, N'https://images.unsplash.com/photo-1496181130204-755241544e35?w=600&auto=format&fit=crop&q=80&sig=18_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (18, N'https://images.unsplash.com/photo-1588872657578-7efd1f1555ed?w=600&auto=format&fit=crop&q=80&sig=18_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (18, N'https://images.unsplash.com/photo-1603302576837-37561b2e2302?w=600&auto=format&fit=crop&q=80&sig=18_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (18, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (18, N'Model', N'Asus ROG Strix');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (18, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (18, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (18, N'CPU', N'Intel i7 / Apple Silicon M-Series');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (18, N'RAM', N'16GB LPDDR5');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (18, N'Storage', N'512GB NVMe SSD');
INSERT INTO product_features (product_id, feature_text) VALUES (18, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (18, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (18, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (18, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (19, N'The premium Huawei MateBook D15 by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Huawei MateBook D15
Category: Laptop
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (19, N'https://images.unsplash.com/photo-1496181130204-755241544e35?w=600&auto=format&fit=crop&q=80&sig=19_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (19, N'https://images.unsplash.com/photo-1588872657578-7efd1f1555ed?w=600&auto=format&fit=crop&q=80&sig=19_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (19, N'https://images.unsplash.com/photo-1603302576837-37561b2e2302?w=600&auto=format&fit=crop&q=80&sig=19_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (19, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (19, N'Model', N'Huawei MateBook D15');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (19, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (19, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (19, N'CPU', N'Intel i7 / Apple Silicon M-Series');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (19, N'RAM', N'16GB LPDDR5');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (19, N'Storage', N'512GB NVMe SSD');
INSERT INTO product_features (product_id, feature_text) VALUES (19, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (19, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (19, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (19, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (20, N'The premium Realme GT Neo by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Realme GT Neo
Category: Mobile
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (20, N'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=600&auto=format&fit=crop&q=80&sig=20_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (20, N'https://images.unsplash.com/photo-1598327105666-5b89351aff97?w=600&auto=format&fit=crop&q=80&sig=20_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (20, N'https://images.unsplash.com/photo-1565849906461-0e443530e24c?w=600&auto=format&fit=crop&q=80&sig=20_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (20, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (20, N'Model', N'Realme GT Neo');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (20, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (20, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (20, N'Network', N'5G Enabled');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (20, N'Screen', N'OLED High Refresh Rate');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (20, N'Battery', N'All-day Battery Life');
INSERT INTO product_features (product_id, feature_text) VALUES (20, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (20, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (20, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (20, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (21, N'The premium OnePlus 11 by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: OnePlus 11
Category: Mobile
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (21, N'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=600&auto=format&fit=crop&q=80&sig=21_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (21, N'https://images.unsplash.com/photo-1598327105666-5b89351aff97?w=600&auto=format&fit=crop&q=80&sig=21_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (21, N'https://images.unsplash.com/photo-1565849906461-0e443530e24c?w=600&auto=format&fit=crop&q=80&sig=21_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (21, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (21, N'Model', N'OnePlus 11');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (21, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (21, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (21, N'Network', N'5G Enabled');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (21, N'Screen', N'OLED High Refresh Rate');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (21, N'Battery', N'All-day Battery Life');
INSERT INTO product_features (product_id, feature_text) VALUES (21, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (21, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (21, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (21, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (22, N'The premium Anker Power Bank 20000mAh by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Anker Power Bank 20000mAh
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (22, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=22_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (22, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=22_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (22, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=22_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (22, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (22, N'Model', N'Anker Power Bank 20000mAh');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (22, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (22, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (22, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (22, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (22, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (22, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (22, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (22, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (23, N'The premium JBL Speaker Charge 5 by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: JBL Speaker Charge 5
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (23, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=23_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (23, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=23_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (23, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=23_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (23, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (23, N'Model', N'JBL Speaker Charge 5');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (23, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (23, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (23, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (23, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (23, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (23, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (23, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (23, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (24, N'The premium Sony Headphones WH-1000XM5 by Sony delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Sony
Model: Sony Headphones WH-1000XM5
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (24, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=24_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (24, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=24_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (24, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=24_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (24, N'Brand', N'Sony');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (24, N'Model', N'Sony Headphones WH-1000XM5');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (24, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (24, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (24, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (24, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (24, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (24, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (24, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (24, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (25, N'The premium Nintendo Switch by Nintendo delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Nintendo
Model: Nintendo Switch
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (25, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=25_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (25, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=25_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (25, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=25_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (25, N'Brand', N'Nintendo');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (25, N'Model', N'Nintendo Switch');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (25, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (25, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (25, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (25, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (25, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (25, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (25, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (25, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (26, N'The premium Toshiba Refrigerator by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Toshiba Refrigerator
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (26, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=26_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (26, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=26_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (26, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=26_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (26, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (26, N'Model', N'Toshiba Refrigerator');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (26, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (26, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (26, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (26, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (26, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (26, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (26, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (26, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (27, N'The premium Google Pixel 8 Pro by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Google Pixel 8 Pro
Category: Mobile
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (27, N'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=600&auto=format&fit=crop&q=80&sig=27_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (27, N'https://images.unsplash.com/photo-1598327105666-5b89351aff97?w=600&auto=format&fit=crop&q=80&sig=27_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (27, N'https://images.unsplash.com/photo-1565849906461-0e443530e24c?w=600&auto=format&fit=crop&q=80&sig=27_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (27, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (27, N'Model', N'Google Pixel 8 Pro');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (27, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (27, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (27, N'Network', N'5G Enabled');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (27, N'Screen', N'OLED High Refresh Rate');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (27, N'Battery', N'All-day Battery Life');
INSERT INTO product_features (product_id, feature_text) VALUES (27, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (27, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (27, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (27, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (28, N'The premium Samsung Galaxy A54 by Samsung delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Samsung
Model: Samsung Galaxy A54
Category: Mobile
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (28, N'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=600&auto=format&fit=crop&q=80&sig=28_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (28, N'https://images.unsplash.com/photo-1598327105666-5b89351aff97?w=600&auto=format&fit=crop&q=80&sig=28_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (28, N'https://images.unsplash.com/photo-1565849906461-0e443530e24c?w=600&auto=format&fit=crop&q=80&sig=28_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (28, N'Brand', N'Samsung');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (28, N'Model', N'Samsung Galaxy A54');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (28, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (28, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (28, N'Network', N'5G Enabled');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (28, N'Screen', N'OLED High Refresh Rate');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (28, N'Battery', N'All-day Battery Life');
INSERT INTO product_features (product_id, feature_text) VALUES (28, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (28, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (28, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (28, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (29, N'The premium MacBook Pro M3 by Apple delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Apple
Model: MacBook Pro M3
Category: Laptop
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (29, N'https://images.unsplash.com/photo-1496181130204-755241544e35?w=600&auto=format&fit=crop&q=80&sig=29_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (29, N'https://images.unsplash.com/photo-1588872657578-7efd1f1555ed?w=600&auto=format&fit=crop&q=80&sig=29_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (29, N'https://images.unsplash.com/photo-1603302576837-37561b2e2302?w=600&auto=format&fit=crop&q=80&sig=29_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (29, N'Brand', N'Apple');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (29, N'Model', N'MacBook Pro M3');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (29, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (29, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (29, N'CPU', N'Intel i7 / Apple Silicon M-Series');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (29, N'RAM', N'16GB LPDDR5');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (29, N'Storage', N'512GB NVMe SSD');
INSERT INTO product_features (product_id, feature_text) VALUES (29, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (29, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (29, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (29, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (30, N'The premium Acer Nitro 5 by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Acer Nitro 5
Category: Laptop
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (30, N'https://images.unsplash.com/photo-1496181130204-755241544e35?w=600&auto=format&fit=crop&q=80&sig=30_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (30, N'https://images.unsplash.com/photo-1588872657578-7efd1f1555ed?w=600&auto=format&fit=crop&q=80&sig=30_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (30, N'https://images.unsplash.com/photo-1603302576837-37561b2e2302?w=600&auto=format&fit=crop&q=80&sig=30_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (30, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (30, N'Model', N'Acer Nitro 5');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (30, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (30, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (30, N'CPU', N'Intel i7 / Apple Silicon M-Series');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (30, N'RAM', N'16GB LPDDR5');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (30, N'Storage', N'512GB NVMe SSD');
INSERT INTO product_features (product_id, feature_text) VALUES (30, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (30, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (30, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (30, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (31, N'The premium Apple Watch Series 9 by Apple delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Apple
Model: Apple Watch Series 9
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (31, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=31_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (31, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=31_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (31, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=31_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (31, N'Brand', N'Apple');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (31, N'Model', N'Apple Watch Series 9');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (31, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (31, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (31, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (31, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (31, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (31, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (31, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (31, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (32, N'The premium Fitbit Charge 6 by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Fitbit Charge 6
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (32, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=32_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (32, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=32_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (32, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=32_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (32, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (32, N'Model', N'Fitbit Charge 6');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (32, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (32, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (32, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (32, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (32, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (32, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (32, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (32, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (33, N'The premium Sandisk 1TB SSD by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Sandisk 1TB SSD
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (33, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=33_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (33, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=33_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (33, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=33_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (33, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (33, N'Model', N'Sandisk 1TB SSD');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (33, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (33, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (33, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (33, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (33, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (33, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (33, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (33, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (34, N'The premium PS5 Controller DualSense by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: PS5 Controller DualSense
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (34, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=34_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (34, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=34_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (34, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=34_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (34, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (34, N'Model', N'PS5 Controller DualSense');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (34, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (34, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (34, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (34, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (34, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (34, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (34, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (34, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (35, N'The premium Gaming Chair DXRacer by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Gaming Chair DXRacer
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (35, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=35_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (35, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=35_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (35, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=35_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (35, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (35, N'Model', N'Gaming Chair DXRacer');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (35, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (35, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (35, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (35, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (35, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (35, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (35, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (35, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (36, N'The premium Sharp Microwave by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Sharp Microwave
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (36, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=36_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (36, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=36_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (36, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=36_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (36, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (36, N'Model', N'Sharp Microwave');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (36, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (36, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (36, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (36, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (36, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (36, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (36, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (36, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (37, N'The premium Philips Air Fryer by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Philips Air Fryer
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (37, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=37_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (37, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=37_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (37, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=37_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (37, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (37, N'Model', N'Philips Air Fryer');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (37, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (37, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (37, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (37, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (37, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (37, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (37, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (37, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (38, N'The premium Oppo Reno 10 by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Oppo Reno 10
Category: Mobile
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (38, N'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=600&auto=format&fit=crop&q=80&sig=38_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (38, N'https://images.unsplash.com/photo-1598327105666-5b89351aff97?w=600&auto=format&fit=crop&q=80&sig=38_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (38, N'https://images.unsplash.com/photo-1565849906461-0e443530e24c?w=600&auto=format&fit=crop&q=80&sig=38_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (38, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (38, N'Model', N'Oppo Reno 10');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (38, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (38, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (38, N'Network', N'5G Enabled');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (38, N'Screen', N'OLED High Refresh Rate');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (38, N'Battery', N'All-day Battery Life');
INSERT INTO product_features (product_id, feature_text) VALUES (38, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (38, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (38, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (38, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (39, N'The premium Honor 90 by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Honor 90
Category: Mobile
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (39, N'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=600&auto=format&fit=crop&q=80&sig=39_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (39, N'https://images.unsplash.com/photo-1598327105666-5b89351aff97?w=600&auto=format&fit=crop&q=80&sig=39_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (39, N'https://images.unsplash.com/photo-1565849906461-0e443530e24c?w=600&auto=format&fit=crop&q=80&sig=39_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (39, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (39, N'Model', N'Honor 90');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (39, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (39, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (39, N'Network', N'5G Enabled');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (39, N'Screen', N'OLED High Refresh Rate');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (39, N'Battery', N'All-day Battery Life');
INSERT INTO product_features (product_id, feature_text) VALUES (39, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (39, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (39, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (39, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (40, N'The premium Vivo V29 by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Vivo V29
Category: Mobile
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (40, N'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=600&auto=format&fit=crop&q=80&sig=40_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (40, N'https://images.unsplash.com/photo-1598327105666-5b89351aff97?w=600&auto=format&fit=crop&q=80&sig=40_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (40, N'https://images.unsplash.com/photo-1565849906461-0e443530e24c?w=600&auto=format&fit=crop&q=80&sig=40_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (40, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (40, N'Model', N'Vivo V29');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (40, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (40, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (40, N'Network', N'5G Enabled');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (40, N'Screen', N'OLED High Refresh Rate');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (40, N'Battery', N'All-day Battery Life');
INSERT INTO product_features (product_id, feature_text) VALUES (40, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (40, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (40, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (40, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (41, N'The premium Nokia G60 by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Nokia G60
Category: Mobile
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (41, N'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=600&auto=format&fit=crop&q=80&sig=41_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (41, N'https://images.unsplash.com/photo-1598327105666-5b89351aff97?w=600&auto=format&fit=crop&q=80&sig=41_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (41, N'https://images.unsplash.com/photo-1565849906461-0e443530e24c?w=600&auto=format&fit=crop&q=80&sig=41_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (41, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (41, N'Model', N'Nokia G60');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (41, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (41, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (41, N'Network', N'5G Enabled');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (41, N'Screen', N'OLED High Refresh Rate');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (41, N'Battery', N'All-day Battery Life');
INSERT INTO product_features (product_id, feature_text) VALUES (41, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (41, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (41, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (41, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (42, N'The premium Realme 11 Pro by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Realme 11 Pro
Category: Mobile
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (42, N'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=600&auto=format&fit=crop&q=80&sig=42_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (42, N'https://images.unsplash.com/photo-1598327105666-5b89351aff97?w=600&auto=format&fit=crop&q=80&sig=42_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (42, N'https://images.unsplash.com/photo-1565849906461-0e443530e24c?w=600&auto=format&fit=crop&q=80&sig=42_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (42, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (42, N'Model', N'Realme 11 Pro');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (42, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (42, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (42, N'Network', N'5G Enabled');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (42, N'Screen', N'OLED High Refresh Rate');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (42, N'Battery', N'All-day Battery Life');
INSERT INTO product_features (product_id, feature_text) VALUES (42, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (42, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (42, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (42, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (43, N'The premium MSI Katana GF66 by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: MSI Katana GF66
Category: Laptop
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (43, N'https://images.unsplash.com/photo-1496181130204-755241544e35?w=600&auto=format&fit=crop&q=80&sig=43_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (43, N'https://images.unsplash.com/photo-1588872657578-7efd1f1555ed?w=600&auto=format&fit=crop&q=80&sig=43_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (43, N'https://images.unsplash.com/photo-1603302576837-37561b2e2302?w=600&auto=format&fit=crop&q=80&sig=43_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (43, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (43, N'Model', N'MSI Katana GF66');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (43, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (43, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (43, N'CPU', N'Intel i7 / Apple Silicon M-Series');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (43, N'RAM', N'16GB LPDDR5');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (43, N'Storage', N'512GB NVMe SSD');
INSERT INTO product_features (product_id, feature_text) VALUES (43, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (43, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (43, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (43, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (44, N'The premium Dell Inspiron 15 by Dell delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Dell
Model: Dell Inspiron 15
Category: Laptop
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (44, N'https://images.unsplash.com/photo-1496181130204-755241544e35?w=600&auto=format&fit=crop&q=80&sig=44_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (44, N'https://images.unsplash.com/photo-1588872657578-7efd1f1555ed?w=600&auto=format&fit=crop&q=80&sig=44_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (44, N'https://images.unsplash.com/photo-1603302576837-37561b2e2302?w=600&auto=format&fit=crop&q=80&sig=44_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (44, N'Brand', N'Dell');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (44, N'Model', N'Dell Inspiron 15');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (44, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (44, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (44, N'CPU', N'Intel i7 / Apple Silicon M-Series');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (44, N'RAM', N'16GB LPDDR5');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (44, N'Storage', N'512GB NVMe SSD');
INSERT INTO product_features (product_id, feature_text) VALUES (44, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (44, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (44, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (44, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (45, N'The premium HP Omen 16 by HP delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: HP
Model: HP Omen 16
Category: Laptop
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (45, N'https://images.unsplash.com/photo-1496181130204-755241544e35?w=600&auto=format&fit=crop&q=80&sig=45_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (45, N'https://images.unsplash.com/photo-1588872657578-7efd1f1555ed?w=600&auto=format&fit=crop&q=80&sig=45_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (45, N'https://images.unsplash.com/photo-1603302576837-37561b2e2302?w=600&auto=format&fit=crop&q=80&sig=45_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (45, N'Brand', N'HP');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (45, N'Model', N'HP Omen 16');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (45, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (45, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (45, N'CPU', N'Intel i7 / Apple Silicon M-Series');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (45, N'RAM', N'16GB LPDDR5');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (45, N'Storage', N'512GB NVMe SSD');
INSERT INTO product_features (product_id, feature_text) VALUES (45, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (45, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (45, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (45, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (46, N'The premium Asus ZenBook 14 by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Asus ZenBook 14
Category: Laptop
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (46, N'https://images.unsplash.com/photo-1496181130204-755241544e35?w=600&auto=format&fit=crop&q=80&sig=46_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (46, N'https://images.unsplash.com/photo-1588872657578-7efd1f1555ed?w=600&auto=format&fit=crop&q=80&sig=46_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (46, N'https://images.unsplash.com/photo-1603302576837-37561b2e2302?w=600&auto=format&fit=crop&q=80&sig=46_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (46, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (46, N'Model', N'Asus ZenBook 14');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (46, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (46, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (46, N'CPU', N'Intel i7 / Apple Silicon M-Series');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (46, N'RAM', N'16GB LPDDR5');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (46, N'Storage', N'512GB NVMe SSD');
INSERT INTO product_features (product_id, feature_text) VALUES (46, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (46, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (46, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (46, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (47, N'The premium Lenovo IdeaPad 3 by Lenovo delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Lenovo
Model: Lenovo IdeaPad 3
Category: Laptop
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (47, N'https://images.unsplash.com/photo-1496181130204-755241544e35?w=600&auto=format&fit=crop&q=80&sig=47_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (47, N'https://images.unsplash.com/photo-1588872657578-7efd1f1555ed?w=600&auto=format&fit=crop&q=80&sig=47_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (47, N'https://images.unsplash.com/photo-1603302576837-37561b2e2302?w=600&auto=format&fit=crop&q=80&sig=47_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (47, N'Brand', N'Lenovo');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (47, N'Model', N'Lenovo IdeaPad 3');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (47, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (47, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (47, N'CPU', N'Intel i7 / Apple Silicon M-Series');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (47, N'RAM', N'16GB LPDDR5');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (47, N'Storage', N'512GB NVMe SSD');
INSERT INTO product_features (product_id, feature_text) VALUES (47, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (47, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (47, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (47, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (48, N'The premium Anker Charger 65W by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Anker Charger 65W
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (48, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=48_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (48, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=48_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (48, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=48_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (48, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (48, N'Model', N'Anker Charger 65W');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (48, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (48, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (48, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (48, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (48, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (48, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (48, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (48, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (49, N'The premium Baseus USB Hub by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Baseus USB Hub
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (49, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=49_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (49, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=49_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (49, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=49_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (49, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (49, N'Model', N'Baseus USB Hub');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (49, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (49, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (49, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (49, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (49, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (49, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (49, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (49, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (50, N'The premium Razer Gaming Mouse by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Razer Gaming Mouse
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (50, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=50_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (50, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=50_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (50, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=50_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (50, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (50, N'Model', N'Razer Gaming Mouse');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (50, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (50, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (50, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (50, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (50, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (50, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (50, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (50, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (51, N'The premium SteelSeries Keyboard by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: SteelSeries Keyboard
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (51, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=51_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (51, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=51_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (51, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=51_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (51, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (51, N'Model', N'SteelSeries Keyboard');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (51, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (51, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (51, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (51, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (51, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (51, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (51, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (51, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (52, N'The premium Kingston 32GB RAM by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Kingston 32GB RAM
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (52, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=52_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (52, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=52_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (52, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=52_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (52, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (52, N'Model', N'Kingston 32GB RAM');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (52, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (52, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (52, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (52, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (52, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (52, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (52, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (52, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (53, N'The premium Gaming Monitor 144Hz by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Gaming Monitor 144Hz
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (53, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=53_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (53, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=53_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (53, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=53_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (53, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (53, N'Model', N'Gaming Monitor 144Hz');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (53, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (53, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (53, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (53, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (53, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (53, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (53, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (53, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (54, N'The premium Razer Gaming Headset by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Razer Gaming Headset
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (54, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=54_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (54, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=54_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (54, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=54_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (54, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (54, N'Model', N'Razer Gaming Headset');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (54, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (54, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (54, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (54, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (54, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (54, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (54, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (54, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (55, N'The premium Logitech Steering Wheel by Logitech delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Logitech
Model: Logitech Steering Wheel
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (55, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=55_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (55, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=55_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (55, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=55_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (55, N'Brand', N'Logitech');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (55, N'Model', N'Logitech Steering Wheel');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (55, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (55, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (55, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (55, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (55, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (55, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (55, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (55, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (56, N'The premium VR Headset Meta Quest 2 by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: VR Headset Meta Quest 2
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (56, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=56_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (56, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=56_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (56, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=56_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (56, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (56, N'Model', N'VR Headset Meta Quest 2');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (56, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (56, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (56, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (56, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (56, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (56, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (56, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (56, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (57, N'The premium Gaming Desk RGB by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Gaming Desk RGB
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (57, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=57_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (57, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=57_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (57, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=57_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (57, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (57, N'Model', N'Gaming Desk RGB');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (57, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (57, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (57, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (57, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (57, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (57, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (57, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (57, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (58, N'The premium Beko Dishwasher by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Beko Dishwasher
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (58, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=58_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (58, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=58_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (58, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=58_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (58, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (58, N'Model', N'Beko Dishwasher');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (58, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (58, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (58, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (58, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (58, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (58, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (58, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (58, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (59, N'The premium Panasonic Vacuum Cleaner by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Panasonic Vacuum Cleaner
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (59, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=59_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (59, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=59_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (59, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=59_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (59, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (59, N'Model', N'Panasonic Vacuum Cleaner');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (59, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (59, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (59, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (59, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (59, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (59, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (59, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (59, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (60, N'The premium LG Air Conditioner by LG delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: LG
Model: LG Air Conditioner
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (60, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=60_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (60, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=60_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (60, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=60_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (60, N'Brand', N'LG');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (60, N'Model', N'LG Air Conditioner');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (60, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (60, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (60, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (60, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (60, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (60, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (60, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (60, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (61, N'The premium Samsung Refrigerator by Samsung delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Samsung
Model: Samsung Refrigerator
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (61, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=61_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (61, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=61_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (61, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=61_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (61, N'Brand', N'Samsung');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (61, N'Model', N'Samsung Refrigerator');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (61, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (61, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (61, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (61, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (61, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (61, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (61, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (61, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (62, N'The premium Tefal Coffee Machine by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Tefal Coffee Machine
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (62, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=62_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (62, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=62_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (62, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=62_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (62, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (62, N'Model', N'Tefal Coffee Machine');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (62, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (62, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (62, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (62, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (62, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (62, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (62, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (62, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (63, N'The premium Tablet Samsung S9 by Samsung delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Samsung
Model: Tablet Samsung S9
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (63, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=63_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (63, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=63_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (63, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=63_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (63, N'Brand', N'Samsung');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (63, N'Model', N'Tablet Samsung S9');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (63, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (63, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (63, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (63, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (63, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (63, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (63, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (63, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (64, N'The premium iPad Air 5 by Apple delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Apple
Model: iPad Air 5
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (64, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=64_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (64, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=64_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (64, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=64_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (64, N'Brand', N'Apple');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (64, N'Model', N'iPad Air 5');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (64, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (64, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (64, N'Network', N'5G Enabled');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (64, N'Screen', N'OLED High Refresh Rate');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (64, N'Battery', N'All-day Battery Life');
INSERT INTO product_features (product_id, feature_text) VALUES (64, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (64, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (64, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (64, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (65, N'The premium Smart Light Philips by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Smart Light Philips
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (65, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=65_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (65, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=65_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (65, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=65_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (65, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (65, N'Model', N'Smart Light Philips');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (65, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (65, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (65, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (65, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (65, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (65, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (65, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (65, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (66, N'The premium Router TP-Link AX3000 by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Router TP-Link AX3000
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (66, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=66_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (66, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=66_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (66, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=66_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (66, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (66, N'Model', N'Router TP-Link AX3000');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (66, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (66, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (66, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (66, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (66, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (66, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (66, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (66, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (67, N'The premium External HDD 2TB WD by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: External HDD 2TB WD
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (67, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=67_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (67, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=67_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (67, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=67_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (67, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (67, N'Model', N'External HDD 2TB WD');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (67, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (67, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (67, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (67, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (67, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (67, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (67, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (67, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (68, N'The premium Printer HP LaserJet by HP delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: HP
Model: Printer HP LaserJet
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (68, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=68_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (68, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=68_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (68, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=68_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (68, N'Brand', N'HP');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (68, N'Model', N'Printer HP LaserJet');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (68, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (68, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (68, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (68, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (68, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (68, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (68, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (68, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (69, N'The premium Webcam Logitech HD by Logitech delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Logitech
Model: Webcam Logitech HD
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (69, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=69_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (69, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=69_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (69, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=69_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (69, N'Brand', N'Logitech');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (69, N'Model', N'Webcam Logitech HD');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (69, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (69, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (69, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (69, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (69, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (69, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (69, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (69, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (70, N'The premium Portable Fan USB by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Portable Fan USB
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (70, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=70_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (70, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=70_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (70, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=70_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (70, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (70, N'Model', N'Portable Fan USB');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (70, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (70, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (70, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (70, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (70, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (70, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (70, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (70, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (71, N'The premium Smart Plug Xiaomi by Xiaomi delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Xiaomi
Model: Smart Plug Xiaomi
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (71, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=71_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (71, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=71_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (71, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=71_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (71, N'Brand', N'Xiaomi');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (71, N'Model', N'Smart Plug Xiaomi');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (71, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (71, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (71, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (71, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (71, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (71, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (71, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (71, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (72, N'The premium Electric Kettle Philips by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Electric Kettle Philips
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (72, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=72_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (72, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=72_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (72, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=72_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (72, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (72, N'Model', N'Electric Kettle Philips');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (72, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (72, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (72, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (72, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (72, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (72, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (72, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (72, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (73, N'The premium Mouse Pad XXL by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Mouse Pad XXL
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (73, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=73_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (73, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=73_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (73, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=73_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (73, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (73, N'Model', N'Mouse Pad XXL');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (73, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (73, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (73, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (73, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (73, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (73, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (73, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (73, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (74, N'The premium Bluetooth Keyboard by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Bluetooth Keyboard
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (74, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=74_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (74, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=74_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (74, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=74_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (74, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (74, N'Model', N'Bluetooth Keyboard');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (74, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (74, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (74, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (74, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (74, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (74, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (74, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (74, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (75, N'The premium Wireless Charger by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Wireless Charger
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (75, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=75_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (75, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=75_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (75, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=75_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (75, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (75, N'Model', N'Wireless Charger');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (75, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (75, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (75, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (75, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (75, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (75, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (75, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (75, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (76, N'The premium Power Strip Smart by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Power Strip Smart
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (76, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=76_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (76, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=76_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (76, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=76_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (76, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (76, N'Model', N'Power Strip Smart');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (76, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (76, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (76, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (76, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (76, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (76, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (76, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (76, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (77, N'The premium Dash Cam Car by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Dash Cam Car
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (77, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=77_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (77, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=77_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (77, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=77_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (77, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (77, N'Model', N'Dash Cam Car');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (77, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (77, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (77, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (77, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (77, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (77, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (77, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (77, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (78, N'The premium Car Phone Holder by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Car Phone Holder
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (78, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=78_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (78, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=78_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (78, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=78_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (78, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (78, N'Model', N'Car Phone Holder');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (78, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (78, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (78, N'Network', N'5G Enabled');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (78, N'Screen', N'OLED High Refresh Rate');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (78, N'Battery', N'All-day Battery Life');
INSERT INTO product_features (product_id, feature_text) VALUES (78, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (78, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (78, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (78, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (79, N'The premium Mini Projector by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Mini Projector
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (79, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=79_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (79, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=79_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (79, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=79_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (79, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (79, N'Model', N'Mini Projector');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (79, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (79, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (79, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (79, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (79, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (79, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (79, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (79, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (80, N'The premium Ring Light 18 inch by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Ring Light 18 inch
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (80, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=80_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (80, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=80_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (80, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=80_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (80, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (80, N'Model', N'Ring Light 18 inch');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (80, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (80, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (80, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (80, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (80, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (80, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (80, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (80, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (81, N'The premium Studio Microphone USB by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Studio Microphone USB
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (81, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=81_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (81, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=81_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (81, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=81_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (81, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (81, N'Model', N'Studio Microphone USB');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (81, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (81, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (81, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (81, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (81, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (81, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (81, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (81, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (82, N'The premium Noise Cancelling Earbuds by Samsung delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Samsung
Model: Noise Cancelling Earbuds
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (82, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=82_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (82, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=82_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (82, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=82_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (82, N'Brand', N'Samsung');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (82, N'Model', N'Noise Cancelling Earbuds');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (82, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (82, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (82, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (82, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (82, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (82, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (82, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (82, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (83, N'The premium Fitness Smart Scale by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Fitness Smart Scale
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (83, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=83_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (83, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=83_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (83, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=83_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (83, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (83, N'Model', N'Fitness Smart Scale');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (83, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (83, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (83, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (83, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (83, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (83, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (83, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (83, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (84, N'The premium Massage Gun by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Massage Gun
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (84, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=84_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (84, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=84_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (84, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=84_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (84, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (84, N'Model', N'Massage Gun');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (84, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (84, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (84, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (84, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (84, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (84, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (84, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (84, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (85, N'The premium Hair Dryer Dyson by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Hair Dryer Dyson
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (85, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=85_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (85, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=85_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (85, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=85_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (85, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (85, N'Model', N'Hair Dryer Dyson');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (85, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (85, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (85, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (85, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (85, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (85, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (85, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (85, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (86, N'The premium Electric Toothbrush by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Electric Toothbrush
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (86, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=86_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (86, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=86_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (86, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=86_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (86, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (86, N'Model', N'Electric Toothbrush');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (86, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (86, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (86, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (86, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (86, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (86, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (86, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (86, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (87, N'The premium Smart Door Lock by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Smart Door Lock
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (87, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=87_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (87, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=87_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (87, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=87_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (87, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (87, N'Model', N'Smart Door Lock');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (87, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (87, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (87, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (87, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (87, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (87, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (87, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (87, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (88, N'The premium Nothing Phone 2 by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Nothing Phone 2
Category: Mobile
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (88, N'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=600&auto=format&fit=crop&q=80&sig=88_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (88, N'https://images.unsplash.com/photo-1598327105666-5b89351aff97?w=600&auto=format&fit=crop&q=80&sig=88_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (88, N'https://images.unsplash.com/photo-1565849906461-0e443530e24c?w=600&auto=format&fit=crop&q=80&sig=88_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (88, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (88, N'Model', N'Nothing Phone 2');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (88, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (88, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (88, N'Network', N'5G Enabled');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (88, N'Screen', N'OLED High Refresh Rate');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (88, N'Battery', N'All-day Battery Life');
INSERT INTO product_features (product_id, feature_text) VALUES (88, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (88, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (88, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (88, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (89, N'The premium Motorola Edge 40 by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Motorola Edge 40
Category: Mobile
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (89, N'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=600&auto=format&fit=crop&q=80&sig=89_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (89, N'https://images.unsplash.com/photo-1598327105666-5b89351aff97?w=600&auto=format&fit=crop&q=80&sig=89_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (89, N'https://images.unsplash.com/photo-1565849906461-0e443530e24c?w=600&auto=format&fit=crop&q=80&sig=89_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (89, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (89, N'Model', N'Motorola Edge 40');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (89, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (89, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (89, N'Network', N'5G Enabled');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (89, N'Screen', N'OLED High Refresh Rate');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (89, N'Battery', N'All-day Battery Life');
INSERT INTO product_features (product_id, feature_text) VALUES (89, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (89, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (89, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (89, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (90, N'The premium Gigabyte Aorus 15 by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Gigabyte Aorus 15
Category: Laptop
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (90, N'https://images.unsplash.com/photo-1496181130204-755241544e35?w=600&auto=format&fit=crop&q=80&sig=90_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (90, N'https://images.unsplash.com/photo-1588872657578-7efd1f1555ed?w=600&auto=format&fit=crop&q=80&sig=90_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (90, N'https://images.unsplash.com/photo-1603302576837-37561b2e2302?w=600&auto=format&fit=crop&q=80&sig=90_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (90, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (90, N'Model', N'Gigabyte Aorus 15');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (90, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (90, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (90, N'CPU', N'Intel i7 / Apple Silicon M-Series');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (90, N'RAM', N'16GB LPDDR5');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (90, N'Storage', N'512GB NVMe SSD');
INSERT INTO product_features (product_id, feature_text) VALUES (90, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (90, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (90, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (90, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (91, N'The premium HP EliteBook 840 by HP delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: HP
Model: HP EliteBook 840
Category: Laptop
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (91, N'https://images.unsplash.com/photo-1496181130204-755241544e35?w=600&auto=format&fit=crop&q=80&sig=91_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (91, N'https://images.unsplash.com/photo-1588872657578-7efd1f1555ed?w=600&auto=format&fit=crop&q=80&sig=91_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (91, N'https://images.unsplash.com/photo-1603302576837-37561b2e2302?w=600&auto=format&fit=crop&q=80&sig=91_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (91, N'Brand', N'HP');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (91, N'Model', N'HP EliteBook 840');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (91, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (91, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (91, N'CPU', N'Intel i7 / Apple Silicon M-Series');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (91, N'RAM', N'16GB LPDDR5');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (91, N'Storage', N'512GB NVMe SSD');
INSERT INTO product_features (product_id, feature_text) VALUES (91, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (91, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (91, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (91, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (92, N'The premium UGREEN USB-C Hub 8-in-1 by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: UGREEN USB-C Hub 8-in-1
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (92, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=92_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (92, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=92_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (92, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=92_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (92, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (92, N'Model', N'UGREEN USB-C Hub 8-in-1');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (92, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (92, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (92, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (92, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (92, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (92, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (92, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (92, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (93, N'The premium Belkin 3-in-1 Wireless Charger by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Belkin 3-in-1 Wireless Charger
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (93, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=93_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (93, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=93_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (93, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=93_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (93, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (93, N'Model', N'Belkin 3-in-1 Wireless Charger');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (93, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (93, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (93, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (93, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (93, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (93, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (93, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (93, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (94, N'The premium Seagate External HDD 4TB by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Seagate External HDD 4TB
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (94, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=94_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (94, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=94_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (94, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=94_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (94, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (94, N'Model', N'Seagate External HDD 4TB');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (94, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (94, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (94, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (94, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (94, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (94, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (94, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (94, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (95, N'The premium Corsair 16GB DDR5 RAM by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Corsair 16GB DDR5 RAM
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (95, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=95_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (95, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=95_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (95, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=95_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (95, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (95, N'Model', N'Corsair 16GB DDR5 RAM');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (95, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (95, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (95, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (95, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (95, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (95, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (95, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (95, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (96, N'The premium Xbox Wireless Controller by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Xbox Wireless Controller
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (96, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=96_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (96, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=96_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (96, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=96_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (96, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (96, N'Model', N'Xbox Wireless Controller');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (96, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (96, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (96, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (96, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (96, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (96, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (96, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (96, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (97, N'The premium Elgato Stream Deck by LG delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: LG
Model: Elgato Stream Deck
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (97, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=97_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (97, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=97_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (97, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=97_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (97, N'Brand', N'LG');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (97, N'Model', N'Elgato Stream Deck');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (97, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (97, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (97, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (97, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (97, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (97, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (97, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (97, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (98, N'The premium HyperX Cloud II Headset by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: HyperX Cloud II Headset
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (98, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=98_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (98, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=98_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (98, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=98_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (98, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (98, N'Model', N'HyperX Cloud II Headset');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (98, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (98, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (98, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (98, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (98, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (98, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (98, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (98, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (99, N'The premium Bosch Washing Machine by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Bosch Washing Machine
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (99, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=99_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (99, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=99_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (99, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=99_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (99, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (99, N'Model', N'Bosch Washing Machine');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (99, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (99, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (99, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (99, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (99, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (99, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (99, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (99, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (100, N'The premium Midea Air Conditioner by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Midea Air Conditioner
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (100, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=100_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (100, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=100_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (100, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=100_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (100, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (100, N'Model', N'Midea Air Conditioner');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (100, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (100, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (100, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (100, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (100, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (100, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (100, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (100, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (101, N'The premium Kenwood Stand Mixer by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Kenwood Stand Mixer
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (101, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=101_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (101, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=101_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (101, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=101_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (101, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (101, N'Model', N'Kenwood Stand Mixer');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (101, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (101, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (101, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (101, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (101, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (101, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (101, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (101, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (102, N'The premium Amazon Echo Dot 5 by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: Amazon Echo Dot 5
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (102, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=102_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (102, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=102_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (102, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=102_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (102, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (102, N'Model', N'Amazon Echo Dot 5');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (102, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (102, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (102, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (102, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (102, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (102, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (102, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (102, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (103, N'The premium TP-Link Deco Mesh WiFi by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: TP-Link Deco Mesh WiFi
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (103, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=103_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (103, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=103_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (103, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=103_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (103, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (103, N'Model', N'TP-Link Deco Mesh WiFi');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (103, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (103, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (103, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (103, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (103, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (103, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (103, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (103, N'Includes comprehensive package contents and quick start guide.');
INSERT INTO product_details (product_id, description, full_specs, warranty_info, shipping_info) VALUES (104, N'The premium GoPro HERO11 by Google delivers outstanding performance, elegant design, and cutting-edge features. Perfect for professionals and enthusiasts alike, it is engineered to elevate your daily tech experience.', N'Brand: Google
Model: GoPro HERO11
Category: Electronics
Warranty: 2 Years Manufacturer Warranty
Shipping: Ships in 1-2 business days with express tracking.', N'2 Years Manufacturer Warranty', N'Free Express Shipping worldwide. Dispatched within 24 hours.');
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (104, N'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600&auto=format&fit=crop&q=80&sig=104_0', 1);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (104, N'https://images.unsplash.com/photo-1526738549149-8e07eca6c147?w=600&auto=format&fit=crop&q=80&sig=104_1', 0);
INSERT INTO product_images (product_id, image_url, is_primary) VALUES (104, N'https://images.unsplash.com/photo-1550009158-9ebf6d2d12e4?w=600&auto=format&fit=crop&q=80&sig=104_2', 0);
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (104, N'Brand', N'Google');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (104, N'Model', N'GoPro HERO11');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (104, N'Condition', N'New');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (104, N'Rating', N'Excellent');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (104, N'Connectivity', N'Wireless / Bluetooth');
INSERT INTO product_specs (product_id, spec_key, spec_value) VALUES (104, N'Color', N'Matte Black / Space Gray');
INSERT INTO product_features (product_id, feature_text) VALUES (104, N'Built with high-quality, durable materials for longevity.');
INSERT INTO product_features (product_id, feature_text) VALUES (104, N'Sleek and modern aesthetic that looks premium in any setting.');
INSERT INTO product_features (product_id, feature_text) VALUES (104, N'Optimized for energy efficiency and high performance.');
INSERT INTO product_features (product_id, feature_text) VALUES (104, N'Includes comprehensive package contents and quick start guide.');