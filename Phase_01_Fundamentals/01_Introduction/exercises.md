# Database Fundamentals: Exercises

## Easy Exercises

### Exercise 1: Information vs. Data
**Objective:** Understand the difference between raw data and processed information.
**Task:** Given the following list `[25, 30, "Alice", "Bob", "HR", "Engineering"]`, organize it conceptually into a structured table format. 
**Expected Output:** A conceptual layout of a table with columns `EmployeeName`, `Age`, and `Department`.
**Hints:** What constitutes a row in this context?

### Exercise 2: Identify DBMS Types
**Objective:** Differentiate between DBMS types.
**Task:** Which of the following is an RDBMS, and which is a NoSQL database? 
- PostgreSQL
- MongoDB
- MySQL
- Redis
**Expected Output:** RDBMS: PostgreSQL, MySQL. NoSQL: MongoDB, Redis.

## Medium Exercises

### Exercise 3: Architectural Flow
**Objective:** Visualize the query execution pipeline.
**Task:** Write down the ordered steps a query takes from the moment you hit "Run" in your SQL client until the data is displayed on your screen.
**Expected Output:** Client -> Connection Manager -> Parser -> Optimizer -> Execution Engine -> Storage Engine/Buffer Pool -> Results to Client.
**Hints:** Remember the "brain" of the database comes before the execution.

### Exercise 4: Syntax Categorization
**Objective:** Categorize SQL statements.
**Task:** Categorize the following commands into DDL, DML, DQL, DCL, and TCL: `SELECT`, `INSERT`, `GRANT`, `CREATE`, `COMMIT`, `DROP`, `UPDATE`.
**Expected Output:** 
- DDL: CREATE, DROP
- DML: INSERT, UPDATE
- DQL: SELECT
- DCL: GRANT
- TCL: COMMIT

## Hard Exercises

### Exercise 5: Conceptual Schema Design
**Objective:** Translate a real-world scenario into a basic database schema.
**Task:** A school needs a database to store students and the courses they are enrolled in. Describe the tables you would create, the columns they should have, and the relationships between them.
**Expected Output:** 
- `Students` table (student_id, name, email)
- `Courses` table (course_id, course_name, credits)
- `Enrollments` table (enrollment_id, student_id, course_id) to handle the Many-to-Many relationship.
**Hints:** Can a student take multiple courses? Can a course have multiple students? 

## Scenario-Based Problems

### Exercise 6: The Slow Query
**Scenario:** The backend engineering team complains that fetching user profiles is taking 5 seconds instead of 50 milliseconds.
**Objective:** Propose an immediate troubleshooting step at the database layer.
**Task:** Explain what tool or SQL keyword you would use to diagnose *why* the database is slow to fetch the data.
**Expected Output:** Use `EXPLAIN` or `EXPLAIN ANALYZE` before the `SELECT` query to view the query execution plan and check if a full table scan is happening instead of an index scan.

## Interview Tasks

### Exercise 7: ACID Properties Definition
**Objective:** Prepare for a standard database interview question.
**Task:** Define the 'A' and 'C' in ACID properties conceptually. Why are they important for a banking application?
**Expected Output:** Atomicity (all or nothing transactions) and Consistency (data always moves from one valid state to another). Critical in banking so that if money is deducted from Account A, it *must* be added to Account B; if the addition fails, the deduction must roll back.
