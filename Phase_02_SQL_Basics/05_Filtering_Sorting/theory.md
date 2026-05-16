# 05: Filtering & Sorting

## Introduction
When a table has millions of rows, you rarely want to see all of them. `WHERE` and `ORDER BY` allow you to find exactly what you need.

## 1. Filtering with WHERE
The `WHERE` clause is used to filter records.
```sql
-- Find students with a grade of 'A'
SELECT * FROM Students 
WHERE grade = 'A';

-- Find products cheaper than $50
SELECT * FROM Products 
WHERE price < 50;
```

## 2. Sorting with ORDER BY
The `ORDER BY` keyword is used to sort the result-set in ascending (ASC) or descending (DESC) order.
```sql
-- Sort users by name (A-Z)
SELECT * FROM Users 
ORDER BY username ASC;

-- Sort by age (Oldest first)
SELECT * FROM Users 
ORDER BY age DESC;
```

## 3. Limiting Results with LIMIT
Used to specify the number of records to return.
```sql
-- Get the top 5 highest paid employees
SELECT * FROM Employees 
ORDER BY salary DESC 
LIMIT 5;
```

## 4. DISTINCT (Removing Duplicates)
Returns only unique values in a column.
```sql
-- See all unique countries where customers live
SELECT DISTINCT country FROM Customers;
```

---

## Real World Scenario: Amazon Search
- **Filter**: You check "Electronics" and "Under $100" (`WHERE category = 'Electronics' AND price < 100`).
- **Sort**: You select "Price: Low to High" (`ORDER BY price ASC`).

> [!TIP]
> **Pro Tip:** Filtering happens **before** sorting. The database finds the rows first, then arranges them.
