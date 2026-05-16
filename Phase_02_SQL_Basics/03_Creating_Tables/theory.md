# 03: Creating Tables & Constraints

## Introduction
Tables are the core of a relational database. To create a table, you must define its columns, data types, and constraints.

## Basic Syntax
```sql
CREATE TABLE table_name (
    column1 datatype constraint,
    column2 datatype constraint
);
```

## Common Data Types
- `INT` / `INTEGER`: Whole numbers.
- `VARCHAR(size)`: Text with a max length.
- `TEXT`: Long text.
- `FLOAT` / `DECIMAL`: Numbers with decimals.
- `DATE` / `DATETIME`: Dates and times.

## SQL Constraints (The Rules)
Constraints are used to limit the type of data that can go into a table.
1. **NOT NULL**: Column cannot have a NULL value.
2. **UNIQUE**: All values in a column must be different.
3. **PRIMARY KEY**: Uniquely identifies each row (Not Null + Unique).
4. **FOREIGN KEY**: Links one table to another.
5. **DEFAULT**: Sets a default value if none is specified.
6. **CHECK**: Ensures the value meets a specific condition (e.g., `age >= 18`).

---

## Example: Creating a User Table
```sql
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL,
    age INT CHECK (age >= 13),
    joined_at DATE DEFAULT CURRENT_DATE
);
```

> [!IMPORTANT]
> **Best Practice:** Always name your primary key something clear, like `id` or `table_name_id`.
