# SQL Operators: Quiz

## Multiple Choice Questions (MCQs)

**1. Which operator is used to evaluate if a value is present within a list of values?**
A) BETWEEN
B) EXISTS
C) IN
D) LIKE

**2. What is the correct way to filter out rows where the `email` column has no data (is empty/null)?**
A) `WHERE email = NULL`
B) `WHERE email IS NULL`
C) `WHERE email IS NOT NULL`
D) `WHERE email <> NULL`

**3. In the context of the `LIKE` operator, what does the underscore `_` character represent?**
A) Any string of zero or more characters
B) Exactly one character
C) An escaped literal underscore
D) A whitespace character

## True/False Questions

**4. True or False:** The query `SELECT * FROM users WHERE age BETWEEN 10 AND 20;` will *exclude* users who are exactly 10 or 20 years old.

**5. True or False:** Applying an arithmetic function directly to a column in the `WHERE` clause (e.g., `WHERE salary * 1.1 > 100000`) can prevent the database from using an index on that column.

## Output Prediction

**6. Consider the data for column `score`: [NULL, 50, 100].**
**What will be the output of `SELECT score FROM test_results WHERE score <> 100;`?**

## Debugging Questions

**7. A developer writes:**
`SELECT * FROM products WHERE category = 'Books' OR category = 'Electronics' AND price > 100;`
**The developer wants Books and Electronics that are BOTH over $100. Why is this query returning $10 Books?**

---

## Answers

**1.** C (IN)
**2.** C (IS NOT NULL) - *Wait, the question asks to filter OUT (exclude) empty rows, meaning we want rows that HAVE data.*
**3.** B (Exactly one character)
**4.** False (`BETWEEN` is inclusive in standard SQL).
**5.** True (This makes the query non-sargable).
**6.** The output will only be `50`. The `NULL` value is excluded because `NULL <> 100` evaluates to `UNKNOWN`, not `TRUE`.
**7.** Because `AND` has higher precedence than `OR`. The database evaluates `(category = 'Electronics' AND price > 100)` first, and then `OR category = 'Books'`. It returns all books regardless of price. To fix: `WHERE (category = 'Books' OR category = 'Electronics') AND price > 100;` or `WHERE category IN ('Books', 'Electronics') AND price > 100;`.
