-- Step 1: Create a table
CREATE TABLE Products (
    id INTEGER PRIMARY KEY,
    name TEXT,
    price REAL
);

-- Step 2: Insert data
INSERT INTO Products (name, price) VALUES ('Laptop', 1200.00);
INSERT INTO Products (name, price) VALUES ('Mouse', 25.50);
INSERT INTO Products (name, price) VALUES ('Keyboard', 45.00);

-- Step 3: Read data
SELECT * FROM Products;

-- Challenge: Update the price of the 'Mouse' to 30.00
-- UPDATE Products SET price = 30.00 WHERE name = 'Mouse';
