-- ========================================================
-- DATABASE MASTERY: SQL FUNCTIONS
-- PRACTICE.SQL
-- ========================================================

-- Setup: Temporary Employees Table
CREATE TABLE staff (
    emp_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    hire_date DATE,
    salary DECIMAL(10,2),
    bonus DECIMAL(10,2) -- Can be NULL
);

INSERT INTO staff (first_name, last_name, hire_date, salary, bonus) VALUES
(' john ', 'doe', '2020-01-15', 60000, 5000),
('JANE', 'SMITH', '2021-06-01', 75000, NULL),
('Alice', NULL, '2022-11-20', 50000, 2000),
('Bob', 'Brown', '2023-03-10', 45000, NULL);


-- 1. String Functions
-- Cleaning up messy data (trimming spaces, standardizing casing)
SELECT 
    TRIM(first_name) AS clean_first_name,
    UPPER(last_name) AS upper_last_name,
    LENGTH(TRIM(first_name)) AS name_length
FROM staff;

-- Concatenating strings safely
SELECT 
    CONCAT(TRIM(first_name), ' ', last_name) AS full_name 
FROM staff;

-- 2. Date and Time Functions
-- Finding out how many years someone has worked here
SELECT 
    first_name,
    hire_date,
    CURRENT_DATE AS today,
    EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM hire_date) AS years_worked
FROM staff;

-- 3. Mathematical Functions
-- Rounding salaries
SELECT 
    salary,
    ROUND(salary / 12, 2) AS monthly_salary,
    CEIL(salary / 12) AS monthly_salary_rounded_up
FROM staff;

-- 4. Control Flow: COALESCE (Handling NULLs)
-- If we just add salary + bonus, Jane and Bob will get NULL total_compensation!
-- BAD:
SELECT first_name, salary + bonus AS bad_total FROM staff;

-- GOOD:
SELECT 
    first_name, 
    salary + COALESCE(bonus, 0) AS actual_total_compensation 
FROM staff;

-- 5. Control Flow: CASE Statements
-- Creating dynamic categories based on data
SELECT 
    first_name,
    salary,
    CASE
        WHEN salary >= 70000 THEN 'Senior Tier'
        WHEN salary >= 55000 THEN 'Mid Tier'
        ELSE 'Junior Tier'
    END AS pay_grade
FROM staff;

-- 6. Debugging Exercise
-- BUG: Why does this return NULL for Alice?
-- SELECT first_name || ' ' || last_name AS full_name FROM staff WHERE emp_id = 3;
-- FIX: Standard concatenation operator (||) yields NULL if any operand is NULL.
SELECT COALESCE(first_name, '') || ' ' || COALESCE(last_name, '') AS fixed_full_name 
FROM staff WHERE emp_id = 3;

-- 7. Output Prediction
-- What will NULLIF(10, 10) return?
SELECT NULLIF(10, 10); 
-- Answer: NULL. If the two arguments are equal, it returns NULL. Useful for preventing division by zero!
-- Example: SELECT 100 / NULLIF(divisor_column, 0);

-- 8. Interview-style Problem
-- Write a query to format the names so the first letter is capitalized and the rest is lowercase.
-- (Assuming clean trimmed data for simplicity)
SELECT 
    UPPER(SUBSTRING(TRIM(first_name), 1, 1)) || LOWER(SUBSTRING(TRIM(first_name), 2)) AS formatted_name
FROM staff;
