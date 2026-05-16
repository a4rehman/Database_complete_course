# 01: SQL Introduction

## Introduction
SQL stands for **Structured Query Language**. It is the standard language used to communicate with relational databases.

## Why SQL?
SQL is declarative. This means you tell the database **WHAT** you want, and the database figures out **HOW** to get it.

- **Analogy:** Ordering pizza. You say "I want a large Pepperoni" (SQL). You don't tell the chef how to knead the dough or at what temperature to set the oven.

## SQL Categories
SQL commands are divided into 5 main categories:

1. **DDL (Data Definition Language)**: Define the structure.
   - `CREATE`, `ALTER`, `DROP`, `TRUNCATE`.
2. **DML (Data Manipulation Language)**: Manage the data.
   - `INSERT`, `UPDATE`, `DELETE`.
3. **DQL (Data Query Language)**: Fetch the data.
   - `SELECT`.
4. **DCL (Data Control Language)**: Control access.
   - `GRANT`, `REVOKE`.
5. **TCL (Transaction Control Language)**: Manage transactions.
   - `COMMIT`, `ROLLBACK`.

---

## SQL Syntax Rules
- SQL is **not case-sensitive** for keywords (SELECT is same as select).
- However, it is best practice to write keywords in **UPPERCASE**.
- Statements usually end with a semicolon `;`.

```sql
SELECT name FROM employees;
```

> [!NOTE]
> **Interview Tip:** When asked what SQL is, emphasize that it is the "Standard language for Relational Databases."
