-- ========================================================
-- DATABASE MASTERY: INTRODUCTION TO DATABASES
-- PRACTICE.SQL
-- ========================================================

-- 1. Beginner SQL Examples
-- Setting up a basic structural foundation to demonstrate how data is stored.
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY, -- SERIAL acts as an auto-incrementing integer in PostgreSQL
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users (username, email) VALUES
('alice_engineer', 'alice@tech.com'),
('bob_backend', 'bob@servers.com');

SELECT * FROM users;

-- 2. Intermediate SQL Queries
-- Demonstrating relationships and data constraints.
CREATE TABLE user_profiles (
    profile_id SERIAL PRIMARY KEY,
    user_id INT UNIQUE REFERENCES users(user_id) ON DELETE CASCADE,
    bio TEXT,
    reputation_score INT DEFAULT 0 CHECK (reputation_score >= 0)
);

INSERT INTO user_profiles (user_id, bio, reputation_score) VALUES
(1, 'Senior Database Architect', 1500),
(2, 'Backend Developer focusing on performance', 850);

-- 3. Advanced SQL Challenges (Glimpse)
-- Combining data from multiple tables to build a meaningful report.
SELECT 
    u.username, 
    u.email, 
    p.reputation_score
FROM users u
JOIN user_profiles p ON u.user_id = p.user_id
WHERE p.reputation_score > 1000;

-- 4. Real-world Business Problems
-- Scenario: We need to soft-delete a user instead of permanently removing them (common industry practice).
ALTER TABLE users ADD COLUMN is_active BOOLEAN DEFAULT TRUE;

UPDATE users SET is_active = FALSE WHERE username = 'bob_backend';

-- 5. Debugging Exercises
-- BAD QUERY: Will fail because of missing data type on age.
-- CREATE TABLE employees ( emp_id INT, name VARCHAR, age ); 
-- FIX:
CREATE TABLE employees ( emp_id INT, name VARCHAR(100), age INT );

-- 6. Output Prediction Questions
-- Question: What happens if we insert a duplicate username into the 'users' table?
-- INSERT INTO users (username, email) VALUES ('alice_engineer', 'alice2@tech.com');
-- Answer: It will throw a unique constraint violation error because username is marked UNIQUE.

-- 7. TODO Exercises
-- TODO: Create a 'departments' table with department_id and department_name.
-- TODO: Add a foreign key 'department_id' to the 'employees' table.

-- 8. Interview-style Problems
-- Problem: How do you retrieve only the top 1 user with the highest reputation score?
SELECT u.username, p.reputation_score 
FROM users u 
JOIN user_profiles p ON u.user_id = p.user_id 
ORDER BY p.reputation_score DESC 
LIMIT 1;

-- 9. Performance Optimization Examples (Preview)
-- Without an index, searching by email does a full table scan.
-- EXPLAIN ANALYZE SELECT * FROM users WHERE email = 'alice@tech.com';

-- Creating an index speeds up the search from O(N) to O(log N).
CREATE INDEX idx_users_email ON users(email);

-- EXPLAIN ANALYZE SELECT * FROM users WHERE email = 'alice@tech.com';
-- Now uses an Index Scan!
