-- Practice: Creating Databases
-- Run these statements one by one in the Streamlit SQL practice tab.

CREATE TABLE learning_topics (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    status TEXT NOT NULL
);

INSERT INTO learning_topics (title, status) VALUES
('Creating Databases', 'in progress'),
('SQL fundamentals', 'review');

SELECT id, title, status
FROM learning_topics
ORDER BY id;
