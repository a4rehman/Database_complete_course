# Grouping & Aggregation: Cheatsheet

## The Core Aggregates
| Function | Description | Handles NULLs? |
| :--- | :--- | :--- |
| `COUNT(*)` | Counts all rows in the group | N/A (counts the row itself) |
| `COUNT(col)` | Counts non-null values in `col` | Ignores NULLs |
| `SUM(col)` | Adds all values together | Ignores NULLs |
| `AVG(col)` | Calculates the mean | Ignores NULLs (Sum / Count(col)) |
| `MAX(col)` | Finds the highest value | Ignores NULLs |
| `MIN(col)` | Finds the lowest value | Ignores NULLs |

## The Golden Rule of `GROUP BY`
If you have a `GROUP BY` clause, **EVERY** column in your `SELECT` list must either be:
1. Wrapped in an aggregate function (like `SUM(price)`)
2. Explicitly listed in the `GROUP BY` clause.
*You cannot select raw row data alongside aggregated data without using Window Functions.*

## `WHERE` vs `HAVING`
This is the most common point of confusion. 

| Feature | `WHERE` | `HAVING` |
| :--- | :--- | :--- |
| **When it runs** | **BEFORE** grouping occurs | **AFTER** grouping occurs |
| **What it filters**| Raw, individual rows | Summarized, bucketed groups |
| **Performance** | Extremely Fast (uses indexes) | Slower (requires data to be grouped first)|
| **Use with Aggregates**| ❌ NEVER (`WHERE SUM(x) > 1` = Error) | ✅ ALWAYS (`HAVING SUM(x) > 1`) |

## The SQL Order of Execution
When writing complex queries, it's vital to know how the engine reads them, not just how you write them.

1. **`FROM`** (Gather the tables/data)
2. **`JOIN`** (Combine tables)
3. **`WHERE`** (Filter the raw data)
4. **`GROUP BY`** (Bucket the data)
5. **`HAVING`** (Filter the buckets)
6. **`SELECT`** (Perform math/formatting on the output)
7. **`ORDER BY`** (Sort the final output)
8. **`LIMIT`** (Truncate the output)

## Quick Example Syntax
```sql
SELECT 
    department, 
    COUNT(*) AS head_count, 
    AVG(salary) AS avg_pay
FROM employees
WHERE status = 'Full-Time'     -- 1. Filter rows
GROUP BY department            -- 2. Create buckets
HAVING AVG(salary) > 50000     -- 3. Filter buckets
ORDER BY avg_pay DESC;         -- 4. Sort results
```
