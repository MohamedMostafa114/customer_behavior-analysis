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
