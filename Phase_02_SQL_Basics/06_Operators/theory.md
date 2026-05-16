# Topic Name: SQL Operators

# Introduction
Operators in SQL are reserved words or characters used primarily in a `WHERE` clause to perform operations, such as comparisons and arithmetic. They are the fundamental building blocks for filtering, calculating, and manipulating data within your queries.

# Why This Matters
In any real-world application, you rarely retrieve *all* data from a database. You need to find users over 18, products that cost less than $50, or transactions that occurred between specific dates. Operators allow you to translate these business logic conditions into SQL logic that the database engine can execute efficiently.

# Core Concepts
- **Arithmetic Operators:** Perform mathematical operations (`+`, `-`, `*`, `/`, `%`).
- **Comparison Operators:** Compare two values (`=`, `>`, `<`, `>=`, `<=`, `<>`, `!=`).
- **Logical Operators:** Combine multiple conditions (`AND`, `OR`, `NOT`, `IN`, `BETWEEN`, `LIKE`, `IS NULL`).
- **Bitwise Operators:** Perform bit manipulations (rarely used in basic web apps, but important for performance optimizations in specific cases).

# Database Internals
When the Parser reads an operator, it builds an Abstract Syntax Tree (AST). The Query Optimizer then looks at this tree. For example, if you use `col = 5`, the optimizer checks if `col` has an index. If you use a function or arithmetic on the column like `col + 1 = 6`, the optimizer might *not* be able to use the index (this is called non-sargable), forcing a full table scan.

# SQL Syntax
```sql
SELECT column_name
FROM table_name
WHERE column_name operator value;
```

# Step-by-Step Examples

**Arithmetic:**
```sql
SELECT product_name, price, price * 0.9 AS discounted_price 
FROM products;
```

**Comparison:**
```sql
SELECT * FROM users WHERE age >= 18;
SELECT * FROM orders WHERE status != 'Cancelled';
```

**Logical:**
```sql
-- AND: Both must be true
SELECT * FROM products WHERE price > 50 AND stock > 0;

-- OR: One must be true
SELECT * FROM users WHERE country = 'USA' OR country = 'Canada';

-- IN: Matches any in a list (better than multiple ORs)
SELECT * FROM users WHERE country IN ('USA', 'Canada', 'UK');

-- BETWEEN: Inclusive range
SELECT * FROM orders WHERE order_date BETWEEN '2023-01-01' AND '2023-12-31';

-- LIKE: Pattern matching (% represents zero/multiple characters, _ represents one)
SELECT * FROM users WHERE email LIKE '%@gmail.com';

-- IS NULL: Checking for missing data
SELECT * FROM users WHERE phone_number IS NULL;
```

# Data Flow Visualization
```ascii
Data Table: [10, 20, 30, 40, 50]
Query: WHERE value > 25 AND value < 45
                     |
                 [Filter]
               /          \
     (value > 25)  AND  (value < 45)
          |                  |
    [30, 40, 50]         [10, 20, 30, 40]
             \            /
          Intersection: [30, 40]
                     |
               [Result Set]
```

# Query Execution Explanation
Consider `SELECT * FROM users WHERE age > 21 AND status = 'active';`
1. The **Optimizer** checks indexes on `age` and `status`.
2. If `status` has a low cardinality (e.g., only 'active' or 'inactive'), and `age` is highly selective, it might use the index on `age` first to narrow down the rows, then filter the remaining rows by `status` in memory.
3. This step is a "Filter" operation in the execution plan.

# Performance Notes
- **Sargable Queries:** Search Argument Able. Queries that can utilize indexes. 
  - *Sargable:* `WHERE date >= '2023-01-01'` (Uses index)
  - *Non-Sargable:* `WHERE YEAR(date) = 2023` (Ignores index, full table scan)
- **LIKE Operator:** `LIKE 'john%'` can use an index. `LIKE '%john'` *cannot* use a standard B-tree index and forces a full table scan.

# Common Mistakes
- Using `=` to check for NULL. `WHERE col = NULL` is wrong. Always use `WHERE col IS NULL`.
- Confusing `=` (assignment/equality in SQL) with `==` (equality in programming languages). SQL uses single `=`.
- Not understanding short-circuit evaluation. In `A AND B`, if A is false, B is not evaluated. Put the most restrictive or fastest condition first.

# Debugging Queries
- **Symptom:** Query returns zero rows when it shouldn't.
- **Troubleshooting:** Check for `NULL` comparisons. If you do `WHERE col <> 'value'`, rows where `col` is `NULL` are *excluded*. You must do `WHERE col <> 'value' OR col IS NULL`.

# Best Practices
- Use `IN` instead of multiple `OR`s for readability and sometimes better optimizer execution.
- Avoid leading wildcards (`%text`) in `LIKE` clauses if possible for performance.
- Use `EXISTS` instead of `IN` when dealing with subqueries returning large datasets.

# Security Notes
- Using operators directly with concatenated string inputs leads to SQL injection. 
- Example: `SELECT * FROM users WHERE name = '` + userInput + `'`. If userInput is `admin' --`, it bypasses checks. Always parameterize.

# Real-World Usage
E-commerce filtering. When you go to Amazon and filter: "Price $50 - $100", "Brand = Sony OR Samsung", "Rating > 4 Stars", the backend translates this into a massive SQL query using `BETWEEN`, `IN`, and `>` operators.

# Backend Integration
In Python/Django ORM:
`Product.objects.filter(price__gte=50, price__lte=100, brand__in=['Sony', 'Samsung'])` translates directly to the SQL operators `BETWEEN` and `IN`.

# Interview Questions
1. **Q: Why does `WHERE name LIKE '%smith'` perform poorly?**
   *A: Because of the leading wildcard, the database engine cannot use a standard B-Tree index and must perform a full table scan.*
2. **Q: Explain the difference between `IN` and `BETWEEN`.**
   *A: `IN` checks against a discrete list of values, while `BETWEEN` checks within a continuous range (inclusive).*
3. **Q: What is the result of `NULL = NULL` in SQL?**
   *A: The result is `UNKNOWN` (or essentially False in a WHERE clause). To check for NULL, you must use `IS NULL`.*

# Mini Challenges
1. Write a query to find all users whose email domain is *not* 'yahoo.com'.
2. Write a query to find products priced between 10 and 20, but exclude exactly 15.

# Summary
Operators are the fundamental vocabulary for asking specific questions of your data. Understanding how to combine logical operators efficiently and how they interact with indexes is the first major step toward writing high-performance SQL.
