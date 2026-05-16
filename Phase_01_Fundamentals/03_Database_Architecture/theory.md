# 03: Database Architecture

## Introduction
Database architecture refers to the internal organizational structure of a DBMS. It dictates how data is stored, managed, and accessed by users.

## 1-Tier Architecture
The database is directly available to the user. The user sits on the same machine where the database is running.
- **Example:** Working on an SQLite file on your laptop.

## 2-Tier Architecture (Client-Server)
The user (Client) communicates with the server (Database) directly.
- **Example:** A desktop application connecting to a MySQL server on the local network.

## 3-Tier Architecture (Modern Web)
The most common architecture for web applications.
1. **Client Tier**: The Browser (User Interface).
2. **Application Tier**: The Server (Python, Node.js, PHP) where business logic lives.
3. **Database Tier**: The DBMS (MySQL, PostgreSQL) which stores the data.

### Why 3-Tier?
- **Security**: The client never touches the database directly. The application server acts as a guard.
- **Scalability**: You can scale the web server and the database server separately.

## Database Engine vs. Storage Engine
- **Database Engine**: The core service that processes SQL commands and manages transactions.
- **Storage Engine**: The component that actually writes the data to the disk. (e.g., InnoDB for MySQL).

---
### Real World Analogy: A Restaurant
- **Client Tier**: The Customer at the table.
- **Application Tier**: The Waiter who takes the order and talks to the kitchen.
- **Database Tier**: The Kitchen where the food (data) is stored and prepared.
