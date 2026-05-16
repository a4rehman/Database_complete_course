# SQL Operators: Cheatsheet

## Arithmetic Operators
| Operator | Description | Example |
| :--- | :--- | :--- |
| `+` | Addition | `price + tax` |
| `-` | Subtraction | `price - discount` |
| `*` | Multiplication | `quantity * price` |
| `/` | Division | `total / count` |
| `%` | Modulo (Remainder) | `id % 2 = 0` (Evens) |

## Comparison Operators
| Operator | Description | Example |
| :--- | :--- | :--- |
| `=` | Equal to | `status = 'Active'` |
| `<>` or `!=` | Not equal to | `status != 'Cancelled'` |
| `>` / `<` | Greater / Less than | `age > 18` |
| `>=` / `<=` | Greater/Less than or equal | `price <= 100.00` |

## Logical Operators
| Operator | Description | Usage/Notes |
| :--- | :--- | :--- |
| `AND` | True if all conditions are true | Use parentheses if mixing with OR |
| `OR` | True if any condition is true | `(A OR B) AND C` |
| `NOT` | Reverses the result | `NOT IN (...)` |
| `IN` | Matches any value in a list | Faster/Cleaner than many ORs. |
| `BETWEEN`| Between a range | **Inclusive** (`BETWEEN 1 AND 5` includes 1 and 5) |
| `LIKE` | Pattern matching | `%` = multi-char, `_` = single-char |
| `IS NULL`| Checks for missing values | Never use `= NULL` |

## Precedence (Order of Operations)
When mixing operators, the database evaluates them in this general order:
1. Arithmetic (`*`, `/`, `%` then `+`, `-`)
2. Comparison (`=`, `<`, `>`, etc.)
3. `NOT`
4. `AND`
5. `OR`

*Golden Rule:* Always use `()` parentheses to explicitly define your logic gate order. `WHERE (A AND B) OR C` is completely different from `WHERE A AND (B OR C)`.

## Sargability Rules (Performance Check)
- **SARGABLE (Uses Index):**
  - `WHERE name = 'Alice'`
  - `WHERE age > 20`
  - `WHERE created_at >= '2023-01-01'`
  - `WHERE name LIKE 'A%'` (Trailing wildcard only)
- **NON-SARGABLE (Forces Full Table Scan - BAD):**
  - `WHERE UPPER(name) = 'ALICE'` (Function wraps column)
  - `WHERE age + 5 > 25` (Math wraps column)
  - `WHERE YEAR(created_at) = 2023` (Function wraps column)
  - `WHERE name LIKE '%A'` (Leading wildcard)
