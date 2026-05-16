# SQL Functions: Exercises

## Easy Exercises

### Exercise 1: Clean Up the Data
**Objective:** Use string functions.
**Task:** The `users` table has a `city` column where users accidentally added spaces (e.g., `'  New York  '`). Write a query to return the cleaned city names and convert them all to uppercase.
**Expected Output:** `SELECT UPPER(TRIM(city)) FROM users;`

### Exercise 2: Mathematical Rounding
**Objective:** Use math functions.
**Task:** Calculate the exact 15% tax on an `order_amount`, but return it rounded to exactly 2 decimal places.
**Expected Output:** `SELECT ROUND(order_amount * 0.15, 2) ...`

## Medium Exercises

### Exercise 3: Safe Math with NULLs
**Objective:** Prevent NULL propagation.
**Task:** Calculate total revenue for a product by multiplying `price` by `units_sold`. However, if `units_sold` is NULL, treat it as 0.
**Expected Output:** `SELECT price * COALESCE(units_sold, 0) AS revenue ...`

### Exercise 4: Division by Zero Prevention
**Objective:** Use `NULLIF`.
**Task:** You are calculating a conversion rate (`successful_purchases / total_visits`). To prevent a "Division by Zero" error when `total_visits` is 0, rewrite the calculation using `NULLIF`.
**Expected Output:** `SELECT successful_purchases / NULLIF(total_visits, 0) ...` (This will return NULL instead of crashing the query).

## Hard Exercises

### Exercise 5: The Analytics Bucket
**Objective:** Master the `CASE` statement.
**Task:** Write a query that selects user IDs and creates a new column called `activity_level`.
- If `logins` > 100, return 'Power User'.
- If `logins` between 50 and 100, return 'Regular User'.
- If `logins` < 50 but > 0, return 'Casual User'.
- If `logins` is 0 or NULL, return 'Inactive'.
**Expected Output:** A properly structured `CASE` statement handling all 4 conditions, including the NULL check.

## Scenario-Based Problems

### Exercise 6: The Missing Middle Name
**Scenario:** You need to print mailing labels. The columns are `first_name`, `middle_name`, and `last_name`. Many users have no middle name (NULL). 
**Task:** Write a query that outputs the full name. If they have a middle name, it should be "First Middle Last". If they don't, it must be exactly "First Last" (with only one space between them, no double spaces).
**Expected Output:** You can use a `CASE` statement checking `IS NULL` on the middle name, or clever use of `CONCAT` with `COALESCE(middle_name || ' ', '')`.

## Interview Tasks

### Exercise 7: Function Optimization
**Task:** During an interview, the technical lead shows you this query: 
`SELECT * FROM users WHERE YEAR(registration_date) = 2023;`
They ask: "Why is this slow on our 10-million row table, and how do you fix it?"
**Expected Output:** Explain that wrapping the column in a function (`YEAR()`) makes the query non-sargable (indexes are ignored). Fix it by rewriting the logic: `WHERE registration_date >= '2023-01-01' AND registration_date < '2024-01-01'`.
