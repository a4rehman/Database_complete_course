-- Setup: Create a sample data table
CREATE TABLE Employees (
    id INTEGER PRIMARY KEY,
    name TEXT,
    department TEXT,
    salary REAL
);

INSERT INTO Employees (name, department, salary) VALUES 
('John Doe', 'IT', 75000),
('Jane Smith', 'HR', 60000),
('Mike Ross', 'Sales', 55000),
('Rachel Zane', 'Legal', 90000),
('Harvey Specter', 'Legal', 150000),
('Louis Litt', 'Finance', 95000);

-- 1. Select all employees in 'Legal' department
SELECT * FROM Employees WHERE department = 'Legal';

-- 2. Select employees with salary > 80000, sorted by salary high to low
SELECT * FROM Employees WHERE salary > 80000 ORDER BY salary DESC;

-- 3. Select the 3 lowest paid employees
SELECT * FROM Employees ORDER BY salary ASC LIMIT 3;

-- 4. Get a list of unique departments
SELECT DISTINCT department FROM Employees;
