# customer_behavior-analysis
Designed a fully normalized relational database for a real-time customer behavior analytics system including users, products, events, transactions, payments, and recommendation engine with enforced business constraints and weak entity modeling.

# Customer Behavior Database – ERD Overview
# ERD Diagram
![ERD Diagram](Database/ERD%20Design.png)

# Overview

Entity-Relationship Diagram (ERD) for a customer behavior tracking system, designed to model user interactions, transactions, products, and shopping sessions in an e-commerce environment.

## 🗺️ ERD Diagram
![Full ERD Diagram](Database/ERD.png)

---

## Legend & Notation

### Attribute Types
| Symbol | Meaning |
|--------|---------|
| **PK** | Primary Key (Underlined in diagram) |
| **FK** | Foreign Key |
| **U** | Unique Attribute |
| **O** | Simple Attribute |
| **O O** | Composite Attribute (e.g., full name = first + last) |
| **{ }** | Multi-valued Attribute (e.g., multiple phone numbers) |
| **[ ]** | Derived Attribute (e.g., age calculated from birthdate) |

### Cardinality Notation `(min, max)`
| Notation | Meaning |
|----------|---------|
| `(0,1)` | Optional (Zero or One) |
| `(1,1)` | Exactly One (Mandatory) |
| `(1,N)` | One or Many |
| `(0,N)` | Zero or Many |

### Relationship Participation
- **Double Line**: Total Participation (Every entity in the set must participate).
- **Single Line**: Partial Participation (Some entities may not participate).

---

##  Entity Descriptions & Attributes

### USERS
Stores core account information for registered customers.
| Attribute | Type | Description |
|-----------|------|-------------|
| `user_id` | PK | Unique identifier |
| `email` | U | User's login email |
| `first_name`, `last_name` | | Composite name components |
| `phone`, `phone_alt` | { } | Contact numbers (Multi-valued) |
| `address_line1`, `address_line2`, `city`, `state`, `postal_code`, `country` | | Composite address structure |
| `password_hash` | | Secure authentication hash |
| `is_active`, `is_deleted` | | Account status flags |
| `created_at`, `updated_at` | | Tracking timestamps |

#  SESSIONS
Tracks user or guest browsing activity and marketing attribution.

**Relationship:** `USERS (0,N) ─── (1,1) SESSIONS`

| Attribute | Type | Description |
|-----------|------|-------------|
| `session_id` | PK | Unique session identifier |
| `user_id` | FK | Links to registered user (NULL if guest) |
| `guest_id` | | Anonymous identifier |
| `start_time` | | Session start timestamp |
| `end_time` | | Session end timestamp |
| `device_type` | | e.g., mobile, desktop, tablet |
| `user_agent` | | Browser/device fingerprint |
| `source` | | Traffic source (e.g., google, direct) |
| `campaign` | | Marketing campaign identifier |
| `referrer_url` | | Previous page URL |
| `ip_address` | | Network address |
| `created_at` | | Record creation timestamp |

---

# 🛒 CART_SESSIONS & CART_ITEMS
Models the shopping cart lifecycle and abandonment tracking.

**Relationships:**
- `SESSIONS (1,1) ─── (0,1) CART_SESSIONS`
- `CART_SESSIONS (1,1) ─── (1,N) CART_ITEMS`

## CART_SESSIONS
| Attribute | Type | Description |
|-----------|------|-------------|
| `cart_id` | PK | Unique cart identifier |
| `session_id` | FK | Associated browsing session |
| `user_id` | FK | Cart owner (if logged in) |
| `is_abandoned` | | Boolean flag for abandonment tracking |
| `created_at` | | Cart creation timestamp |

## CART_ITEMS
| Attribute | Type | Description |
|-----------|------|-------------|
| `cart_item_id` | PK | Unique line item identifier |
| `cart_id` | FK | Parent cart reference |
| `product_id` | FK | Product added to cart |
| `quantity` | | Number of units |
| `added_at` | | Timestamp when item was added |

### TRANSACTIONS
Records completed purchases and shipping details.
| Attribute | Type | Description |
|-----------|------|-------------|
| `transaction_id` | PK | Unique order number |
| `user_id`, `session_id` | FK | Links to user and originating session |
| `payment_method_id` | FK | Payment instrument used |
| `transaction_date`, `total_amount` | | Financial summary |
| `payment_status` | | Current state (Enum: pending, completed, refunded) |
| `shipping_address`, `shipping_city`, `shipping_postal_code` | | Delivery location snapshot |

### PAYMENT_METHODS
Lookup table for payment options.
| Attribute | Type |
|-----------|------|
| `payment_method_id` | PK |
| `name`, `description` | |

### PRODUCTS
Catalog information with snapshot pricing via separate history table.
| Attribute | Type | Description |
|-----------|------|-------------|
| `product_id` | PK | Unique product code |
| `name`, `description` | | Product details |
| `category_id` | FK | Product classification |
| `stock_quantity`, `avg_rating`, `total_reviews` | | Inventory and aggregated social proof |

### PRODUCT_PRICES
Slowly Changing Dimension (SCD) Type 2 for tracking price changes over time.
| Attribute | Type | Description |
|-----------|------|-------------|
| `product_price_id` | PK | Surrogate key for price record |
| `product_id` | FK | Reference to product |
| `price` | | Price at point in time |
| `start_date`, `end_date` | | Effective date range |
| `location_id` | FK | Regional pricing variant (if applicable) |

### REVIEWS
Post-purchase feedback from customers.
| Attribute | Type | Description |
|-----------|------|-------------|
| `review_id` | PK | |
| `user_id`, `product_id` | FK | Who wrote it and for what |
| `rating` | | Numeric score |
| `reviews` | | Text feedback content |
| `is_reviewed` | | Moderation flag |
| `created_at` | | |

### RECOMMENDATIONS
Stores output of ML/Analytics systems for personalized product suggestions.
| Attribute | Type |
|-----------|------|
| `rec_id` | PK |
| `user_id`, `product_id` | FK |
| `score` | |
| `created_at` | |

### LOCATIONS
Geographic reference data for addresses and regional analysis.
| Attribute | Type |
|-----------|------|
| `location_id` | PK |
| `city`, `state`, `country_code`, `postal_code` | |
| `latitude`, `longitude` | |

---

## Technical Implementation Notes
- **Surrogate Keys**: All primary keys utilize `SERIAL` (auto-incrementing integer) for optimal indexing performance.
- **Timestamps**: `created_at` and `updated_at` default to `CURRENT_TIMESTAMP`.
- **Integrity**: Referential integrity is strictly enforced via **Foreign Key Constraints**. Business logic (e.g., updating `stock_quantity` on purchase) is handled via **Database Triggers**.
- **Derived Attributes**: Fields like `avg_rating` in `PRODUCTS` are calculated based on inserts/updates to the `REVIEWS` table.

### Customer Behavior Analytics E-Commerce Platform

A production-ready e-commerce platform designed to analyze customer behavior through real-time event processing, advanced analytics, and AI-powered product recommendations. The platform combines a complete online shopping experience with a scalable data analytics architecture to provide personalized recommendations and business insights.

#### **Features**
Secure user authentication (Sign Up, Login, Logout)
Product catalog with detailed product pages
Shopping cart and checkout system
Wishlist functionality
User profile and order history
Responsive and modern user interface
Customer behavior tracking and analytics
AI-powered recommendation engine
Real-time analytics dashboard
Admin dashboard with business intelligence metrics

#### **Technology Stack**
Frontend
Next.js
React
TypeScript
HTML5
CSS3
Tailwind CSS
Backend
Node.js
Express.js
RESTful APIs
Database
Microsoft SQL Server
Real-Time Data Processing
Apache Kafka
Apache Spark Streaming
Redis

#### AI & Analytics
Content-Based Filtering
Collaborative Filtering
Hybrid Recommendation System
Customer Behavior Analytics
Real-Time Event Processing
Customer Behavior Tracking

### The platform continuously captures and processes user interactions, including:

User Registration and Login
Product Views
Product Searches
Add to Cart
Wishlist Actions
Purchases
Product Ratings
Recommendation Clicks

These events are streamed through Apache Kafka, processed in real time using Apache Spark Streaming, stored in SQL Server, and utilized by the recommendation engine to generate personalized product suggestions.

### Analytics Dashboard

The admin dashboard provides comprehensive business insights, including:

Revenue Analytics
Sales Trends
Active Users
Customer Behavior Analysis
Product Performance
Most Viewed Products
Most Purchased Products
Recommendation Performance
Click-Through Rate (CTR)
Conversion Rate
Trending Products
System Monitoring
Real-Time Streaming Metrics
Recommendation System

### The platform includes an intelligent recommendation engine capable of:

Personalized Product Recommendations
Similar Products
Customers Also Bought
Recently Viewed Products
Trending Products
Cold-Start Recommendations
Real-Time Recommendation Updates

## System Architecture

![System Architecture](https://raw.githubusercontent.com/MohamedMostafa114/customer_behavior-analysis/main/website/AR.png)

## Real-Time Analytics with Apache Kafka & Apache Spark

This project uses **Apache Kafka** and **Apache Spark Streaming** to process customer interactions in real time. Every user action on the e-commerce platform is captured as an event, streamed through Kafka, analyzed by Spark Streaming, and stored in **SQL Server** for visualization in the admin dashboard.

### Apache Kafka
Apache Kafka serves as the event streaming platform, enabling reliable and scalable communication between the website and the analytics engine.

**Events Captured**
- User registration and login
- Product searches
- Product views
- Add to cart / Remove from cart
- Wishlist actions
- Product ratings
- Purchases
- Recommendation clicks

### Apache Spark Streaming
Apache Spark Streaming consumes Kafka events and performs real-time data processing to generate business insights.

**Analytics Generated**
- Most viewed products
- Top searched keywords
- Total sales and orders
- Cart conversion rate
- Customer activity monitoring
- Recommendation performance

![Data Pipeline](https://raw.githubusercontent.com/MohamedMostafa114/customer_behavior-analysis/main/website/ks.png)

### Key Features
- Real-time event streaming using Apache Kafka
- Distributed stream processing with Apache Spark Streaming
- SQL Server integration for data storage
- Live analytics dashboard
- Event-driven and scalable architecture
- Customer behavior tracking and business intelligence
  
## Website Preview

The home page of the platform provides a modern shopping experience with a responsive interface, product search, category filtering, and interactive product cards. Users can browse products, view detailed information, add items to their cart, and access authentication features through a clean and intuitive design.

![Website Home Page](https://raw.githubusercontent.com/MohamedMostafa114/customer_behavior-analysis/main/website/one.png)

### User Registration

New users can create an account by providing their personal information and credentials. The registration process includes form validation and securely stores user data in the database.

![User Registration](https://raw.githubusercontent.com/MohamedMostafa114/customer_behavior-analysis/main/website/three.png)

### User Login

Registered users can securely log in to access their personalized shopping experience, including their cart, order history, wishlist, and AI-powered product recommendations.

![User Login](https://raw.githubusercontent.com/MohamedMostafa114/customer_behavior-analysis/main/website/two.png)

## Product Catalog

The Products page displays all available products in a clean, responsive grid layout. Each product card includes essential information such as the product name, brand, price, stock availability, and customer rating. Users can quickly browse products, view detailed information, and add items directly to their shopping cart.

### Features

- Responsive product grid
- Product brand labels
- Product ratings
- Stock availability
- Product pricing
- View product details
- Add to Cart functionality
- Modern and user-friendly interface

![Products Page](https://raw.githubusercontent.com/MohamedMostafa114/customer_behavior-analysis/main/website/four.png)

## Authenticated User Experience

After logging in, the platform provides a personalized shopping experience with secure access to user-specific features. The navigation bar dynamically updates to display the authenticated user's profile, wishlist, order history, shopping cart, and administrative dashboard (for authorized users). This creates a seamless and realistic e-commerce experience.

### Features

- Secure user authentication
- Personalized navigation bar
- User profile management
- Shopping cart access
- Wishlist management
- Order history
- Admin dashboard access (role-based)
- Logout functionality
- Session management

![Authenticated User Dashboard](https://raw.githubusercontent.com/MohamedMostafa114/customer_behavior-analysis/main/website/five.png)

### 📊 Admin Dashboard

The Admin Dashboard provides real-time business analytics and customer behavior insights. It displays key performance indicators (KPIs), including total users, sales, orders, average session duration, and cart conversion rate. The dashboard also highlights the most searched terms and the most viewed products, helping administrators monitor platform performance and understand customer trends.

![Admin Dashboard](https://raw.githubusercontent.com/MohamedMostafa114/customer_behavior-analysis/main/website/s.png)

### Product Details Page
Displays complete product information, including images, description, pricing, rating, stock status, and purchase options. Users can select quantities, add products to their cart or wishlist, and purchase items directly.

![Product Details](https://raw.githubusercontent.com/MohamedMostafa114/customer_behavior-analysis/main/website/seven.png)

### Checkout Page
Allows users to review their order before completing the purchase. The page displays the selected products, quantities, total price, shipping address, and payment method. After confirming the payment, the system processes the order, updates the inventory in real time, records the transaction, and displays a successful order confirmation.

![Checkout Page](https://raw.githubusercontent.com/MohamedMostafa114/customer_behavior-analysis/main/website/eigth.png)

### User Profile Page
Provides a centralized dashboard for managing personal account information and shopping activities. Users can view their profile details, manage shipping addresses, maintain a wishlist, and track order history and delivery status. The page also allows users to add new addresses, set default shipping locations, and monitor previous purchases from a single interface.

![User Profile Page](https://raw.githubusercontent.com/MohamedMostafa114/customer_behavior-analysis/main/website/nine.png)

### Admin Dashboard & Customer Behavior Analytics
Provides administrators with a comprehensive dashboard to monitor platform performance and customer behavior in real time. The dashboard displays key business metrics such as registered users, total revenue, completed orders, average session time, and conversion rate. It also includes interactive analytics for top searched terms and the most viewed products, helping administrators understand customer interests, optimize inventory, and make data-driven business decisions.

![Admin Dashboard](https://raw.githubusercontent.com/MohamedMostafa114/customer_behavior-analysis/main/website/ten.png)

![Customer Behavior Analytics](https://raw.githubusercontent.com/MohamedMostafa114/customer_behavior-analysis/main/website/eleven.png)

### Advanced Business Analytics Dashboard
Provides advanced business intelligence and customer behavior analytics through interactive visualizations. The dashboard tracks customer event activity, top searched terms, product popularity, cart-to-purchase conversion rates, and revenue trends. These insights help administrators analyze user engagement, evaluate sales performance, monitor purchasing behavior, and make data-driven decisions to optimize the e-commerce platform.

![Advanced Business Analytics](https://raw.githubusercontent.com/MohamedMostafa114/customer_behavior-analysis/main/website/13s.png)

![Revenue & Conversion Analytics](https://raw.githubusercontent.com/MohamedMostafa114/customer_behavior-analysis/main/website/14f.png)

### Order Management
Provides a comprehensive order management interface that enables users and administrators to view and monitor order history. The page displays recent orders with their order ID, placement date, total amount, and current order status. It allows efficient tracking of completed purchases while providing a clear overview of transaction history and order progress.

![Order Management](https://raw.githubusercontent.com/MohamedMostafa114/customer_behavior-analysis/main/website/15f.png)

![Recent Orders](https://raw.githubusercontent.com/MohamedMostafa114/customer_behavior-analysis/main/website/16s.png)
