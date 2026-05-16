# Grouping & Aggregation: Quiz

## Multiple Choice Questions (MCQs)

**1. Which clause is evaluated FIRST by the database engine?**
A) GROUP BY
B) HAVING
C) WHERE
D) SELECT

**2. You want to filter the results of a query based on the result of the `SUM()` function. Which clause must you use?**
A) WHERE
B) HAVING
C) ORDER BY
D) FILTER

**3. What will happen if you run `SELECT department, role, AVG(salary) FROM employees GROUP BY department;`?**
A) It will return the average salary per department and pick a random role.
B) It will throw a syntax error in most strict relational databases (like PostgreSQL).
C) It will group by both department and role automatically.
D) It will ignore the role column.

## True/False Questions

**4. True or False:** You cannot use `WHERE` and `HAVING` in the same SQL query.

**5. True or False:** An aggregate function like `MAX()` can be used on textual/string columns, not just numeric columns.

## Output Prediction

**6. Consider a table `votes` with data `[Team A, Team A, Team B]`. What is the output of:**
```sql
SELECT team_name, COUNT(*) 
FROM votes 
WHERE team_name = 'Team C' 
GROUP BY team_name;
```

## Debugging Questions

**7. Look at this query:**
`SELECT author_id, COUNT(book_id) FROM books WHERE COUNT(book_id) > 5 GROUP BY author_id;`
**Why will this query fail, and how do you fix it?**

---

## Answers

**1.** C (WHERE filters the raw rows before grouping begins).
**2.** B (HAVING is specifically designed to filter on aggregated values).
**3.** B (Standard SQL requires all non-aggregated columns in the SELECT list to be included in the GROUP BY clause).
**4.** False. They are frequently used together. `WHERE` filters rows, `HAVING` filters groups.
**5.** True. `MAX()` on a string column will return the value that is last alphabetically (e.g., 'Zebra' > 'Apple').
**6.** Zero rows returned. The `WHERE` clause filters out Team A and Team B immediately. No rows are left to group.
**7.** It fails because `COUNT()` is an aggregate function and cannot be used in the `WHERE` clause. Fix it by moving the condition to a `HAVING` clause after the `GROUP BY`: 
`... GROUP BY author_id HAVING COUNT(book_id) > 5;`
