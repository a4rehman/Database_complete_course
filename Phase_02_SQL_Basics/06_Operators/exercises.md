# SQL Operators: Exercises

## Easy Exercises

### Exercise 1: The Basic Filter
**Objective:** Use comparison operators.
**Task:** Write a query to select all employees from the `employees` table whose salary is strictly greater than 50,000.
**Expected Output:** A SQL query using the `>` operator.

### Exercise 2: The Missing Data
**Objective:** Handle NULL values properly.
**Task:** Write a query to find all users in the `users` table who have NOT provided a phone number.
**Expected Output:** A SQL query using `IS NULL`.

## Medium Exercises

### Exercise 3: Range Selection
**Objective:** Use logical range operators.
**Task:** Write a query to find all orders in the `orders` table placed between January 1, 2023, and January 31, 2023 (inclusive), using the `BETWEEN` operator.
**Expected Output:** A SQL query using `BETWEEN '2023-01-01' AND '2023-01-31'`.

### Exercise 4: Pattern Matching
**Objective:** Use the `LIKE` operator efficiently.
**Task:** Find all customers whose `last_name` starts with 'S' and is exactly 5 characters long. 
**Hints:** Remember that `%` is any number of characters, and `_` is exactly one character.
**Expected Output:** `LIKE 'S____'`

## Hard Exercises

### Exercise 5: Complex Logic Gate
**Objective:** Combine `AND`, `OR`, and parentheses correctly.
**Task:** An e-commerce store is running a promotion. Select all products that are either in the 'Electronics' category and cost less than $100, OR are in the 'Clothing' category and have a stock greater than 50. Exclude any product that is out of stock (stock = 0), regardless of category.
**Expected Output:** A query demonstrating strict use of parentheses to enforce operator precedence.
**Hints:** `WHERE ( (cond1 AND cond2) OR (cond3 AND cond4) ) AND stock > 0`

## Scenario-Based Problems

### Exercise 6: The "Not Equal" Trap
**Scenario:** You need to send a reminder email to all users who have *not* verified their email. The `status` column contains 'verified', 'pending', or `NULL` (if they haven't reached the verification step yet).
**Task:** Write a query that accurately captures both 'pending' and `NULL` users without accidentally dropping the `NULL` ones.
**Expected Output:** `WHERE status = 'pending' OR status IS NULL` (or `WHERE status IS DISTINCT FROM 'verified'` in PostgreSQL).

## Interview Tasks

### Exercise 7: Optimization Rewrite
**Task:** You are presented with this query in an interview:
`SELECT * FROM transactions WHERE YEAR(transaction_date) = 2022;`
Explain why this is bad for performance, and rewrite it using operators so that it becomes *sargable* (can use an index).
**Expected Output:** Explanation of function-wrapping the column. Rewrite: `WHERE transaction_date >= '2022-01-01' AND transaction_date < '2023-01-01'`.
