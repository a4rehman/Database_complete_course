-- ========================================================
-- DATABASE MASTERY: SQL OPERATORS
-- PRACTICE.SQL
-- ========================================================

-- Setup: Create a temporary products table for practice
CREATE TABLE inventory (
    item_id SERIAL PRIMARY KEY,
    item_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock INT,
    last_restock DATE
);

INSERT INTO inventory (item_name, category, price, stock, last_restock) VALUES
('Laptop Pro', 'Electronics', 1200.00, 50, '2023-01-15'),
('Wireless Mouse', 'Electronics', 25.50, 200, '2023-02-10'),
('Desk Chair', 'Furniture', 150.00, 0, '2022-11-05'),
('Coffee Mug', 'Kitchen', 12.99, 500, '2023-03-01'),
('Mechanical Keyboard', 'Electronics', 85.00, 30, '2023-01-20'),
('Standing Desk', 'Furniture', 350.00, 10, NULL);

-- 1. Arithmetic Operators
-- Calculate a 10% tax on electronics
SELECT item_name, price, price * 0.10 AS tax_amount, price * 1.10 AS total_price 
FROM inventory 
WHERE category = 'Electronics';

-- 2. Comparison Operators
-- Find expensive items
SELECT * FROM inventory WHERE price >= 100.00;

-- 3. Logical Operators (AND, OR)
-- Find electronics that cost less than $100 OR any kitchen items
SELECT * FROM inventory 
WHERE (category = 'Electronics' AND price < 100.00) 
   OR category = 'Kitchen';

-- 4. IN Operator
-- Find specific categories
SELECT * FROM inventory WHERE category IN ('Furniture', 'Kitchen');

-- 5. BETWEEN Operator
-- Find items priced between $50 and $200
SELECT * FROM inventory WHERE price BETWEEN 50.00 AND 200.00;

-- 6. LIKE Operator
-- Find items containing 'Desk' anywhere in the name
SELECT * FROM inventory WHERE item_name LIKE '%Desk%';

-- Find items starting with 'L'
SELECT * FROM inventory WHERE item_name LIKE 'L%';

-- 7. IS NULL / IS NOT NULL Operator
-- Find items that have never been restocked (NULL date)
SELECT * FROM inventory WHERE last_restock IS NULL;

-- 8. Real-world Business Problem: Restock Alert
-- Find items that are low in stock (less than 20) but are not discontinued (category is not null)
SELECT item_name, stock 
FROM inventory 
WHERE stock < 20 AND category IS NOT NULL;

-- 9. Debugging Exercise
-- BUG: Looking for items that are NOT Furniture. Note the NULL handling trap.
-- If category was NULL, it wouldn't show up here either.
SELECT * FROM inventory WHERE category != 'Furniture'; 

-- 10. Performance Optimization (Sargable vs Non-Sargable)
-- NON-SARGABLE (Bad: prevents index usage on price):
-- SELECT * FROM inventory WHERE price * 0.9 < 100;

-- SARGABLE (Good: allows index usage on price):
-- SELECT * FROM inventory WHERE price < 100 / 0.9;
