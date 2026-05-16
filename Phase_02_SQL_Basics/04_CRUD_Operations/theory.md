# 04: CRUD Operations

## Introduction
CRUD stands for **Create, Read, Update, and Delete**. These are the four basic operations you will perform on any database.

## 1. CREATE (INSERT)
Used to add new rows to a table.
```sql
INSERT INTO Students (id, name, grade) 
VALUES (1, 'Alice', 'A');
```

## 2. READ (SELECT)
Used to retrieve data from a table.
```sql
-- Read everything
SELECT * FROM Students;

-- Read specific columns
SELECT name, grade FROM Students;
```

## 3. UPDATE
Used to modify existing data.
```sql
UPDATE Students 
SET grade = 'A+' 
WHERE id = 1;
```

## 4. DELETE
Used to remove data.
```sql
DELETE FROM Students 
WHERE id = 1;
```

---
## Real World Analogy: Social Media Post
- **Create**: You hit "Post" and a new entry is added.
- **Read**: Your friends see the post in their feed.
- **Update**: You edit the caption of your post.
- **Delete**: You delete the post entirely.

> [!CAUTION]
> **Warning:** Always use a `WHERE` clause with `UPDATE` and `DELETE`. If you forget it, you will update or delete **every single row** in the table!
