
-- Create a sample table called 'scores'
CREATE TABLE scores (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    score INT
);

-- Insert some data into the 'scores' table
INSERT INTO scores (id, name, score)
VALUES
(1, 'Alice', 90),
(2, 'Bob', 80),
(3, 'Catherine', 90),
(4, 'Daniel', 85),
(5, 'Eva', 92),
(6, 'Frank', 80);

-- Query using RANK() and DENSE_RANK()
 SELECT
    id,
    name,
    score,
    RANK() OVER (ORDER BY score DESC) AS rank,
    DENSE_RANK() OVER (ORDER BY score DESC) AS dense_rank
FROM scores
ORDER BY score DESC;
