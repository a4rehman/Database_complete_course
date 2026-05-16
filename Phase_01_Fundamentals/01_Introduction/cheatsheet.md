# Database Fundamentals: Cheatsheet

## The Core DBMS Pipeline
1. **Parser:** Validates syntax (grammar check).
2. **Optimizer:** Creates execution plan (chooses index vs. table scan).
3. **Execution Engine:** Runs the plan.
4. **Buffer Pool:** Memory cache (RAM) for fast data access.
5. **Storage Engine:** Writes/reads to physical disk.

## SQL Language Categories
| Category | Meaning | Commands | Purpose |
| :--- | :--- | :--- | :--- |
| **DDL** | Data Definition Lang. | `CREATE`, `ALTER`, `DROP` | Defines schema/structures. |
| **DML** | Data Manipulation Lang. | `INSERT`, `UPDATE`, `DELETE` | Modifies the actual data. |
| **DQL** | Data Query Lang. | `SELECT` | Reads/Retrieves data. |
| **DCL** | Data Control Lang. | `GRANT`, `REVOKE` | Permissions/Security. |
| **TCL** | Transaction Control Lang.| `COMMIT`, `ROLLBACK` | Manages ACID transactions. |

## Fundamental Terminology
- **Table (Relation):** A collection of related data entries consisting of columns and rows.
- **Row (Tuple/Record):** A single, implicitly structured data item in a table.
- **Column (Attribute):** A set of data values of a particular simple type, one value for each row.
- **Primary Key (PK):** A unique identifier for a row. (Implicitly NOT NULL and UNIQUE).
- **Foreign Key (FK):** A column that creates a link between two tables, referencing the PK of another table.

## Crucial Best Practices
1. **Always use Primary Keys:** Every table should have a uniquely identifiable column.
2. **Enforce Constraints:** Use `NOT NULL`, `CHECK`, and `UNIQUE` to let the database protect data integrity.
3. **Never trust user input:** Always use parameterized queries in your application code to prevent SQL injection.
4. **Index Foreign Keys:** By default, foreign keys are not indexed. If you JOIN on them often (you will), index them to avoid performance bottlenecks.
5. **Soft Deletes:** Use an `is_active` boolean or `deleted_at` timestamp rather than running `DELETE FROM` to preserve historical data.

## Performance Basics
- **Full Table Scan (O(N)):** The DB reads every row to find a match. Very slow on large tables.
- **Index Scan (O(log N)):** The DB uses an index (B-Tree) to jump directly to the data. Very fast.
- **EXPLAIN:** The command used to look under the hood and see *how* the database plans to execute a query.

## Quick Syntax Reference
```sql
-- Create Table
CREATE TABLE users ( id SERIAL PRIMARY KEY, name VARCHAR(50) );

-- Insert Data
INSERT INTO users (name) VALUES ('Alice');

-- Query Data
SELECT * FROM users WHERE name = 'Alice';

-- Check Execution Plan
EXPLAIN ANALYZE SELECT * FROM users WHERE name = 'Alice';
```
