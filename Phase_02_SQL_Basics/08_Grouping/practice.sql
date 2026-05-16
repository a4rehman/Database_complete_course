-- ========================================================
-- DATABASE MASTERY: GROUPING & AGGREGATION
-- PRACTICE.SQL
-- ========================================================

-- Setup: Temporary Sales Table
CREATE TABLE sales (
    sale_id SERIAL PRIMARY KEY,
    employee_id INT,
    region VARCHAR(50),
    product_category VARCHAR(50),
    amount DECIMAL(10,2),
    sale_date DATE
);

INSERT INTO sales (employee_id, region, product_category, amount, sale_date) VALUES
(1, 'North', 'Electronics', 1500.00, '2023-10-01'),
(1, 'North', 'Clothing', 200.00, '2023-10-02'),
(2, 'South', 'Electronics', 1200.00, '2023-10-01'),
(2, 'South', 'Electronics', 800.00, '2023-10-03'),
(3, 'North', 'Furniture', 500.00, '2023-10-04'),
(3, 'North', 'Electronics', 300.00, '2023-10-05'),
(4, 'West', 'Clothing', 100.00, '2023-10-05'),
(4, 'West', 'Clothing', 150.00, '2023-10-06');

-- 1. Global Aggregation (No Grouping)
-- Get the total grand summary of the company
SELECT 
    COUNT(*) AS total_transactions,
    SUM(amount) AS total_revenue,
    AVG(amount) AS average_order_value,
    MAX(amount) AS highest_sale,
    MIN(amount) AS lowest_sale
FROM sales;

-- 2. Basic Grouping
-- See total revenue per region
SELECT 
    region,
    SUM(amount) AS regional_revenue
FROM sales
GROUP BY region;

-- 3. Multi-Column Grouping
-- Drill down into region AND product category
SELECT 
    region,
    product_category,
    SUM(amount) AS category_revenue,
    COUNT(*) AS number_of_sales
FROM sales
GROUP BY region, product_category
ORDER BY region;

-- 4. Using WHERE before GROUP BY
-- Calculate revenue per employee ONLY for Electronics
SELECT 
    employee_id,
    SUM(amount) AS electronics_revenue
FROM sales
WHERE product_category = 'Electronics'
GROUP BY employee_id;

-- 5. Using HAVING after GROUP BY
-- Find employees who have generated more than $1000 in TOTAL revenue
SELECT 
    employee_id,
    SUM(amount) AS total_revenue
FROM sales
GROUP BY employee_id
HAVING SUM(amount) > 1000;

-- 6. Combining WHERE and HAVING (Real-world scenario)
-- Get total revenue per region for October, but only show regions that made > $1000
SELECT 
    region,
    SUM(amount) AS oct_revenue
FROM sales
WHERE sale_date >= '2023-10-01' AND sale_date < '2023-11-01' -- Row-level filter
GROUP BY region                                              -- Bucket creation
HAVING SUM(amount) > 1000;                                   -- Bucket-level filter

-- 7. Debugging Exercise
-- BUG: "column must appear in the GROUP BY clause"
-- UNCOMMENT TO SEE ERROR:
-- SELECT region, product_category, SUM(amount) FROM sales GROUP BY region;
-- FIX: You must group by product_category as well.
SELECT region, product_category, SUM(amount) 
FROM sales 
GROUP BY region, product_category;

-- 8. Interview-style Problem
-- Which region had the highest average sale value?
SELECT 
    region, 
    AVG(amount) as avg_sale 
FROM sales 
GROUP BY region 
ORDER BY avg_sale DESC 
LIMIT 1;
