# 04: Installation & Setup

## Introduction
Before we dive into SQL, you need a playground. While we use SQLite in our dashboard, professional developers use robust systems like MySQL or PostgreSQL.

## 1. Install MySQL (The Industry Standard)
MySQL is the world's most popular open-source database.
- **Windows:** Use the "MySQL Installer".
- **MacOS:** Use `brew install mysql`.
- **Linux:** `sudo apt install mysql-server`.

## 2. PostgreSQL (The Developer's Favorite)
Known for being powerful and handling complex data types.
- **Tool:** Use "pgAdmin" as a GUI to manage it.

## 3. SQLite (The Lightest)
Zero configuration. The database is just a file.
- **Usage:** Perfect for mobile apps and small projects.

## 4. GUI Tools (The Visual Way)
Instead of typing everything in a black terminal, you can use:
1. **DBeaver**: The "Universal" database tool.
2. **TablePlus**: Clean and modern.
3. **MySQL Workbench**: Official tool for MySQL.
4. **VS Code Extensions**: "SQLTools" is excellent.

---

## Your First Setup (Practice)
In this course, you can use the **Dashboard's built-in SQL runner** to practice immediately without installing anything!

### Steps to start locally:
1. Open your terminal.
2. Type `sqlite3 mastery.db`.
3. You are now inside a database!

> [!TIP]
> **Best Practice:** Always use a GUI tool like **DBeaver** when starting out. It helps you "see" the tables while you write the queries.
