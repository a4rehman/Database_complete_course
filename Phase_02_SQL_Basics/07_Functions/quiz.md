# SQL Functions: Quiz

## Multiple Choice Questions (MCQs)

**1. Which function is used to return the first non-null expression among its arguments?**
A) NULLIF()
B) COALESCE()
C) NVL()
D) Both B and C (depending on the DBMS)

**2. What does `NULLIF(A, B)` do?**
A) Returns A if A is NULL, otherwise B.
B) Returns NULL if A equals B, otherwise returns A.
C) Returns NULL if A is not equal to B.
D) Throws an error if either A or B is NULL.

**3. Which of the following is considered an Aggregate Function?**
A) UPPER()
B) LENGTH()
C) SUM()
D) SUBSTRING()

## True/False Questions

**4. True or False:** A `CASE` statement must always include an `ELSE` clause, otherwise the query will throw a syntax error.

**5. True or False:** Using `CONCAT(A, B, C)` will usually return the combined string even if B is NULL (in modern DBs like MySQL/Postgres), whereas `A || B || C` will return NULL if B is NULL.

## Output Prediction

**6. Consider the data `points = 5`. What is the result of the following query?**
```sql
SELECT 
  CASE 
    WHEN points > 0 THEN 'Positive'
    WHEN points > 4 THEN 'High'
    ELSE 'Other'
  END
FROM scores;
```

## Debugging Questions

**7. A data analyst writes:**
`SELECT order_id, COALESCE(discount, 'No Discount') FROM orders;`
**The `discount` column is of type `DECIMAL`. Why will this query fail to run in most strictly-typed databases (like PostgreSQL)?**

---

## Answers

**1.** D (COALESCE is standard SQL; NVL is Oracle's specific implementation).
**2.** B
**3.** C (SUM operates across multiple rows; the others operate on a single row).
**4.** False. If `ELSE` is omitted and no conditions are met, the `CASE` statement implicitly returns `NULL`.
**5.** True. `CONCAT` is generally safer for handling NULLs in string concatenation.
**6.** 'Positive'. The `CASE` statement evaluates sequentially and stops at the *first* true condition. Even though `5 > 4` is true, the first condition (`5 > 0`) is met first.
**7.** Data type mismatch. `COALESCE` requires all arguments to be of the same (or implicitly castable) data type. You cannot mix a `DECIMAL` column with a `VARCHAR` ('No Discount') in the same column output. You must cast the discount to a string first.
