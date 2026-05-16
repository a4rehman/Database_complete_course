# SQL Functions: Cheatsheet

## String Functions
| Function | Description | Example | Output |
| :--- | :--- | :--- | :--- |
| `UPPER(s)` / `LOWER(s)` | Changes casing | `UPPER('sql')` | `'SQL'` |
| `TRIM(s)` | Removes leading/trailing spaces | `TRIM('  hi  ')` | `'hi'` |
| `LENGTH(s)` / `LEN(s)` | Number of characters | `LENGTH('code')` | `4` |
| `SUBSTRING(s, pos, len)`| Extracts part of a string | `SUBSTRING('abcde', 2, 3)`| `'bcd'` |
| `CONCAT(a, b)` | Joins strings (ignores NULLs) | `CONCAT('a', 'b')` | `'ab'` |

## Math Functions
| Function | Description | Example | Output |
| :--- | :--- | :--- | :--- |
| `ROUND(n, d)` | Rounds to `d` decimal places | `ROUND(3.1415, 2)` | `3.14` |
| `CEIL(n)` | Rounds up to nearest integer | `CEIL(3.1)` | `4` |
| `FLOOR(n)` | Rounds down to nearest integer| `FLOOR(3.9)` | `3` |
| `ABS(n)` | Absolute value | `ABS(-10)` | `10` |

## Date/Time Functions *(Note: Varies slightly by DBMS)*
| Function (PostgreSQL) | Description |
| :--- | :--- |
| `CURRENT_DATE` | Returns today's date (`YYYY-MM-DD`). |
| `CURRENT_TIMESTAMP` / `NOW()`| Returns date and time with timezone. |
| `EXTRACT(part FROM date)` | Gets specific part (e.g., `EXTRACT(YEAR FROM date)`).|
| `AGE(timestamp)` | Calculates interval between now and timestamp. |

## Control Flow (Crucial for Logic)
**`COALESCE(val1, val2, ...)`**
Returns the first non-NULL value. 
*Usage:* `COALESCE(bonus, 0)` ensures math doesn't break if bonus is missing.

**`NULLIF(val1, val2)`**
Returns NULL if val1 == val2. Otherwise returns val1.
*Usage:* `100 / NULLIF(total, 0)` prevents Division by Zero errors.

**`CASE` Statement**
The `IF/ELSE` of SQL.
```sql
CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    ELSE default_result
END
```
*Note:* Evaluates sequentially. The first `TRUE` condition wins. If no `ELSE` is provided, it defaults to `NULL`.
