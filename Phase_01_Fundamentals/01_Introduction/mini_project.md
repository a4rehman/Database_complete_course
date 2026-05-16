# Mini Project: Conceptual E-Commerce Database Architecture

## Project Overview
Before we dive deep into complex SQL queries, we must understand the "blueprint" of a database. In this mini-project, you will design the conceptual architecture for a simplified E-commerce Database (like a miniature Amazon). 

**Goal:** Identify the core entities, define their attributes, establish relationships, and write the foundational SQL to create this structure.

## Requirements
The system must support the following functionality:
1. **Users:** Customers can register with their name, email, and a secure password.
2. **Products:** The store sells various items, each with a name, description, price, and stock quantity.
3. **Orders:** Customers can place orders. We need to track when the order was placed and its status (e.g., Pending, Shipped, Delivered).
4. **Order Items:** An order can contain multiple products, and we must record the quantity of each product purchased in that specific order.

## Schema Design

### Entities and Attributes
- **Users**: `user_id` (PK), `first_name`, `last_name`, `email` (Unique), `created_at`
- **Products**: `product_id` (PK), `name`, `price`, `stock_quantity`
- **Orders**: `order_id` (PK), `user_id` (FK), `order_date`, `status`
- **Order_Items**: `order_item_id` (PK), `order_id` (FK), `product_id` (FK), `quantity`, `price_at_purchase`

### Relationships
- **User to Orders**: One-to-Many (One user can have many orders, but an order belongs to only one user).
- **Order to Order_Items**: One-to-Many (An order has multiple items).
- **Product to Order_Items**: One-to-Many (A specific product can appear in many different order items across different orders).
- *(Conceptually, Orders and Products have a Many-to-Many relationship, which is resolved by the `Order_Items` join table).*

## Tables (Foundational SQL)

```sql
-- 1. Create Users Table
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Create Products Table
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL CHECK (price >= 0),
    stock_quantity INT NOT NULL DEFAULT 0 CHECK (stock_quantity >= 0)
);

-- 3. Create Orders Table
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id) ON DELETE RESTRICT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) DEFAULT 'Pending'
);

-- 4. Create Order_Items (The Join Table)
CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id) ON DELETE CASCADE,
    product_id INT REFERENCES products(product_id) ON DELETE RESTRICT,
    quantity INT NOT NULL CHECK (quantity > 0),
    price_at_purchase DECIMAL(10, 2) NOT NULL
);
```

## Sample Queries (Preview)

**Find all orders for a specific user:**
```sql
SELECT o.order_id, o.order_date, o.status 
FROM orders o 
WHERE o.user_id = 1;
```

**Find out what products are in Order #100:**
```sql
SELECT p.name, oi.quantity, oi.price_at_purchase 
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
WHERE oi.order_id = 100;
```

## Optimization Ideas (Thinking like an Engineer)
- **Indexing:** We will frequently look up users by email (during login). We should add an index: `CREATE INDEX idx_user_email ON users(email);`
- **Indexing Foreign Keys:** Queries looking up items for a specific order will hit `order_items.order_id`. We must index foreign keys to prevent slow table scans during joins.

## Advanced Extensions (For the Future)
- Add a `categories` table and establish a Many-to-Many relationship between products and categories.
- Add a `reviews` table so users can leave 1-5 star ratings on products.
- Implement soft deletes for users and products instead of permanently dropping records.
