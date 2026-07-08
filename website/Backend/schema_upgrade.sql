-- schema_upgrade.sql
-- Create additional/extended tables for e-commerce features

-- 1. Brands table
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[brands]') AND type in (N'U'))
BEGIN
    CREATE TABLE brands (
        brand_id INT IDENTITY(1,1) PRIMARY KEY,
        name NVARCHAR(150) NOT NULL,
        description NVARCHAR(MAX) NULL,
        logo_url NVARCHAR(500) NULL,
        created_at DATETIME DEFAULT GETDATE(),
        updated_at DATETIME DEFAULT GETDATE()
    );
END
GO

-- 2. Add brand_id to products if not exists
IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[products]') AND name = 'brand_id')
BEGIN
    ALTER TABLE products ADD brand_id INT NULL FOREIGN KEY REFERENCES brands(brand_id);
END
GO

-- 3. Product details table
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[product_details]') AND type in (N'U'))
BEGIN
    CREATE TABLE product_details (
        product_id INT PRIMARY KEY FOREIGN KEY REFERENCES products(product_id) ON DELETE CASCADE,
        description NVARCHAR(MAX) NULL,
        full_specs NVARCHAR(MAX) NULL,
        warranty_info NVARCHAR(500) NULL,
        shipping_info NVARCHAR(500) NULL,
        created_at DATETIME DEFAULT GETDATE(),
        updated_at DATETIME DEFAULT GETDATE()
    );
END
GO

-- 4. Product images table
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[product_images]') AND type in (N'U'))
BEGIN
    CREATE TABLE product_images (
        image_id INT IDENTITY(1,1) PRIMARY KEY,
        product_id INT NOT NULL FOREIGN KEY REFERENCES products(product_id) ON DELETE CASCADE,
        image_url NVARCHAR(500) NOT NULL,
        is_primary BIT DEFAULT 0,
        created_at DATETIME DEFAULT GETDATE()
    );
END
GO

-- 5. Product specs table
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[product_specs]') AND type in (N'U'))
BEGIN
    CREATE TABLE product_specs (
        spec_id INT IDENTITY(1,1) PRIMARY KEY,
        product_id INT NOT NULL FOREIGN KEY REFERENCES products(product_id) ON DELETE CASCADE,
        spec_key NVARCHAR(150) NOT NULL,
        spec_value NVARCHAR(500) NOT NULL,
        created_at DATETIME DEFAULT GETDATE()
    );
END
GO

-- 6. Product features table
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[product_features]') AND type in (N'U'))
BEGIN
    CREATE TABLE product_features (
        feature_id INT IDENTITY(1,1) PRIMARY KEY,
        product_id INT NOT NULL FOREIGN KEY REFERENCES products(product_id) ON DELETE CASCADE,
        feature_text NVARCHAR(1000) NOT NULL,
        created_at DATETIME DEFAULT GETDATE()
    );
END
GO

-- 7. Wishlist table
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[wishlist]') AND type in (N'U'))
BEGIN
    CREATE TABLE wishlist (
        wishlist_id INT IDENTITY(1,1) PRIMARY KEY,
        user_id INT NOT NULL FOREIGN KEY REFERENCES users(user_id) ON DELETE CASCADE,
        product_id INT NOT NULL FOREIGN KEY REFERENCES products(product_id) ON DELETE CASCADE,
        created_at DATETIME DEFAULT GETDATE(),
        CONSTRAINT UQ_user_product UNIQUE (user_id, product_id)
    );
END
GO

-- 8. Addresses table
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[addresses]') AND type in (N'U'))
BEGIN
    CREATE TABLE addresses (
        address_id INT IDENTITY(1,1) PRIMARY KEY,
        user_id INT NOT NULL FOREIGN KEY REFERENCES users(user_id) ON DELETE CASCADE,
        address_type NVARCHAR(50) DEFAULT 'Shipping',
        recipient_name NVARCHAR(200) NOT NULL,
        street_address NVARCHAR(500) NOT NULL,
        city NVARCHAR(100) NOT NULL,
        state NVARCHAR(100) NOT NULL,
        postal_code NVARCHAR(50) NOT NULL,
        country NVARCHAR(100) NOT NULL,
        is_default BIT DEFAULT 0,
        created_at DATETIME DEFAULT GETDATE(),
        updated_at DATETIME DEFAULT GETDATE()
    );
END
GO

-- 9. Payment records table
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[payment_records]') AND type in (N'U'))
BEGIN
    CREATE TABLE payment_records (
        payment_record_id INT IDENTITY(1,1) PRIMARY KEY,
        transaction_id INT NOT NULL FOREIGN KEY REFERENCES transactions(transaction_id) ON DELETE CASCADE,
        amount DECIMAL(18,2) NOT NULL,
        payment_method_id INT NOT NULL FOREIGN KEY REFERENCES payment_methods(payment_method_id),
        transaction_reference NVARCHAR(255) NULL,
        status NVARCHAR(100) NOT NULL DEFAULT 'Pending',
        payment_date DATETIME DEFAULT GETDATE(),
        created_at DATETIME DEFAULT GETDATE()
    );
END
GO

-- 10. Order status tracking table
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[order_status_tracking]') AND type in (N'U'))
BEGIN
    CREATE TABLE order_status_tracking (
        tracking_id INT IDENTITY(1,1) PRIMARY KEY,
        transaction_id INT NOT NULL FOREIGN KEY REFERENCES transactions(transaction_id) ON DELETE CASCADE,
        status NVARCHAR(100) NOT NULL DEFAULT 'Ordered',
        notes NVARCHAR(1000) NULL,
        updated_at DATETIME DEFAULT GETDATE()
    );
END
GO

-- Seed Brands if empty
IF NOT EXISTS (SELECT * FROM brands)
BEGIN
    INSERT INTO brands (name, description) VALUES
    ('Apple', 'Apple Inc. is an American multinational technology company.'),
    ('Samsung', 'Samsung Electronics is a South Korean multinational electronics corporation.'),
    ('Dell', 'Dell Technologies Inc. is an American multinational technology company.'),
    ('HP', 'HP Inc. is an American multinational information technology company.'),
    ('Lenovo', 'Lenovo Group Limited is a Chinese-American multinational technology company.'),
    ('Sony', 'Sony Group Corporation is a Japanese multinational conglomerate corporation.'),
    ('Logitech', 'Logitech International S.A. is a Swiss-American manufacturer of computer peripherals.'),
    ('Nintendo', 'Nintendo Co., Ltd. is a Japanese multinational video game company.'),
    ('LG', 'LG Electronics Inc. is a South Korean multinational electronics company.'),
    ('Xiaomi', 'Xiaomi Corporation is a Chinese multinational electronics company.'),
    ('Google', 'Google LLC is an American multinational technology company.');
END
GO

-- Update products with brand_id matching brand name
UPDATE products SET brand_id = (SELECT brand_id FROM brands WHERE name = 'Apple') WHERE product_name LIKE '%iPhone%' OR product_name LIKE '%iPad%' OR product_name LIKE '%AirPods%' OR product_name LIKE '%MacBook%' OR product_name LIKE '%Apple%';
UPDATE products SET brand_id = (SELECT brand_id FROM brands WHERE name = 'Samsung') WHERE product_name LIKE '%Samsung%' OR product_name LIKE '%Galaxy%' OR product_name LIKE '%Buds%';
UPDATE products SET brand_id = (SELECT brand_id FROM brands WHERE name = 'Dell') WHERE product_name LIKE '%Dell%' OR product_name LIKE '%XPS%';
UPDATE products SET brand_id = (SELECT brand_id FROM brands WHERE name = 'HP') WHERE product_name LIKE '%HP%' OR product_name LIKE '%Omen%';
UPDATE products SET brand_id = (SELECT brand_id FROM brands WHERE name = 'Lenovo') WHERE product_name LIKE '%Lenovo%' OR product_name LIKE '%Legion%';
UPDATE products SET brand_id = (SELECT brand_id FROM brands WHERE name = 'Sony') WHERE product_name LIKE '%Sony%';
UPDATE products SET brand_id = (SELECT brand_id FROM brands WHERE name = 'Logitech') WHERE product_name LIKE '%Logitech%';
UPDATE products SET brand_id = (SELECT brand_id FROM brands WHERE name = 'Nintendo') WHERE product_name LIKE '%Nintendo%';
UPDATE products SET brand_id = (SELECT brand_id FROM brands WHERE name = 'LG') WHERE product_name LIKE '%LG%';
UPDATE products SET brand_id = (SELECT brand_id FROM brands WHERE name = 'Xiaomi') WHERE product_name LIKE '%Xiaomi%';
UPDATE products SET brand_id = (SELECT brand_id FROM brands WHERE name = 'Google') WHERE product_name LIKE '%Google%' OR product_name LIKE '%Pixel%';
GO

-- Assign remaining products to Google or Samsung or Apple randomly or general
UPDATE products SET brand_id = (SELECT brand_id FROM brands WHERE name = 'Google') WHERE brand_id IS NULL;
GO

-- Seed behavior event types if not exist
IF NOT EXISTS (SELECT * FROM event_types WHERE name = 'click_product')
    INSERT INTO event_types (name, description, created_at) VALUES ('click_product', 'User clicked on a product', GETDATE());
IF NOT EXISTS (SELECT * FROM event_types WHERE name = 'search')
    INSERT INTO event_types (name, description, created_at) VALUES ('search', 'User performed a search query', GETDATE());
IF NOT EXISTS (SELECT * FROM event_types WHERE name = 'add_to_wishlist')
    INSERT INTO event_types (name, description, created_at) VALUES ('add_to_wishlist', 'User added product to wishlist', GETDATE());
IF NOT EXISTS (SELECT * FROM event_types WHERE name = 'time_spent')
    INSERT INTO event_types (name, description, created_at) VALUES ('time_spent', 'User spent time on page', GETDATE());
GO

-- Columns for real-time inventory and analytics
IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[products]') AND name = 'views_count')
BEGIN
    ALTER TABLE products ADD views_count INT NOT NULL DEFAULT 0;
END
GO

IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[products]') AND name = 'sold_count')
BEGIN
    ALTER TABLE products ADD sold_count INT NOT NULL DEFAULT 0;
END
GO

IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[transactions]') AND name = 'order_status')
BEGIN
    ALTER TABLE transactions ADD order_status NVARCHAR(100) NOT NULL DEFAULT 'Ordered';
END
GO

IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[transactions]') AND name = 'payment_status')
BEGIN
    ALTER TABLE transactions ADD payment_status NVARCHAR(100) NOT NULL DEFAULT 'Completed';
END
GO

