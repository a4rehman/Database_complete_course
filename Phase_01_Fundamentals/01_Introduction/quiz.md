# Database Fundamentals: Quiz

## Multiple Choice Questions (MCQs)

**1. Which component of the database engine is responsible for finding the most efficient way to execute a SQL query?**
A) The Parser
B) The Query Optimizer
C) The Storage Engine
D) The Buffer Pool

**2. Which of the following commands belongs to DML (Data Manipulation Language)?**
A) CREATE TABLE
B) GRANT
C) UPDATE
D) DROP

**3. What is the primary purpose of the Buffer Pool in a database?**
A) To authenticate users
B) To parse SQL syntax
C) To cache frequently accessed data pages in memory (RAM) to avoid slow disk I/O
D) To permanently store backups

## True/False Questions

**4. True or False:** A Full Table Scan is generally faster than an Index Scan when searching for a single specific user in a table with 10 million rows.

**5. True or False:** An RDBMS organizes data into tables consisting of rows and columns.

## Output Prediction

**6. Consider the following sequence of commands:**
```sql
CREATE TABLE test_table (id INT PRIMARY KEY);
INSERT INTO test_table (id) VALUES (1);
INSERT INTO test_table (id) VALUES (1);
```
**What will be the result of the second INSERT statement?**

## Debugging Questions

**7. A junior developer runs the following query and gets a syntax error:**
`SELCT * FORM users WHERE id = 1;`
**Which component of the database engine catches this error first?**

---

## Answers

**1.** B (The Query Optimizer)
**2.** C (UPDATE - it manipulates existing data)
**3.** C (To cache frequently accessed data pages)
**4.** False (A Full Table Scan requires reading all 10 million rows, whereas an Index Scan operates in logarithmic time, making it significantly faster).
**5.** True
**6.** The database will throw a Primary Key constraint violation error because `id` must be unique, and `1` already exists.
**7.** The Parser (It checks the query for correct SQL grammar and syntax before doing anything else).
