# Grouping & Aggregation: Exercises

## Easy Exercises

### Exercise 1: The Basic Count
**Objective:** Use `GROUP BY` with `COUNT()`.
**Task:** Write a query that returns the number of users in each `country` from the `users` table.
**Expected Output:** Columns: `country`, `user_count`.

### Exercise 2: Average by Category
**Objective:** Use `AVG()` with `GROUP BY`.
**Task:** Calculate the average `price` of products for each `category` in the `products` table.
**Expected Output:** Columns: `category`, `avg_price`.

## Medium Exercises

### Exercise 3: The Filtered Group
**Objective:** Differentiate `WHERE` and `HAVING`.
**Task:** You need to find all `departments` that have more than 5 employees, but you should completely ignore any employees whose `status` is 'Intern'. 
**Expected Output:** A query using `WHERE status != 'Intern'`, then `GROUP BY department`, and finally `HAVING COUNT(*) > 5`.

### Exercise 4: Multi-Level Grouping
**Objective:** Group by multiple columns.
**Task:** A manager wants to know the total `sales_amount` broken down by `year` and then by `quarter`. Write the query assuming you have `year`, `quarter`, and `sales_amount` columns in a `financials` table.
**Expected Output:** `GROUP BY year, quarter`.

## Hard Exercises

### Exercise 5: The Analytics Dashboard
**Objective:** Combine aggregates, math, and filtering.
**Task:** From an `orders` table (columns: `customer_id`, `order_total`, `status`), write a query to find the top 3 customers who have the highest *average* order total, but only consider 'Completed' orders, and only include customers who have placed at least 10 'Completed' orders.
**Expected Output:** 
- `WHERE status = 'Completed'`
- `GROUP BY customer_id`
- `HAVING COUNT(*) >= 10`
- `ORDER BY AVG(order_total) DESC`
- `LIMIT 3`

## Scenario-Based Problems

### Exercise 6: Performance Optimization Mistake
**Scenario:** A junior dev writes:
`SELECT department, SUM(salary) FROM employees GROUP BY department HAVING department != 'HR';`
**Task:** While this works, it is mathematically and computationally inefficient. Explain why, and rewrite it correctly.
**Expected Output:** It's inefficient because the DB groups *all* HR employees, sums up their salaries, and *then* throws the result away. It should be filtered *before* grouping using `WHERE department != 'HR'`.

## Interview Tasks

### Exercise 7: The Duplicate Finder
**Task:** This is a classic interview question. Given a table `emails` with a column `email_address`, write a query to find all email addresses that appear more than once in the table (i.e., find the duplicates).
**Expected Output:** 
```sql
SELECT email_address, COUNT(*) 
FROM emails 
GROUP BY email_address 
HAVING COUNT(*) > 1;
```
