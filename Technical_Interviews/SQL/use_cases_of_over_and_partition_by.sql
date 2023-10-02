
-- SQL File: Use-cases of OVER and PARTITION BY

/*
  OVER() Without PARTITION BY
  ---------------------------
  The OVER() clause without PARTITION BY operates over the entire result set.
  Useful for calculations that apply to all rows.
*/

-- Example: Row Number Without Partition
SELECT id, name, salary,
       ROW_NUMBER() OVER (ORDER BY salary DESC) as rank
FROM employees;

/*
  OVER() With PARTITION BY
  ------------------------
  The OVER() clause with PARTITION BY divides the result set into partitions.
  Useful for calculations within specific groups of data.
*/

-- Example: Row Number With Partition
SELECT id, name, department, salary,
       ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary DESC) as rank_within_department
FROM employees;

/*
  OVER() Without Window Function
  ------------------------------
  Using the OVER() clause without a window function is rare.
  It can act as a placeholder for partitioning or ordering, without any window-based calculation.
*/

-- Example: Count Without Window Function
SELECT customer_id, 
       amount,
       COUNT(*) OVER (PARTITION BY customer_id) AS customer_order_count
FROM orders;

/*
  Comparison: SUM(amount) OVER () vs GROUP BY SUM(amount)
  -------------------------------------------------------
  SUM(amount) OVER () calculates the sum for the entire result set and adds a new column to each row.
  GROUP BY with SUM(amount) aggregates data and reduces the result set to one row per group.
*/

-- Example: SUM(amount) OVER ()
SELECT customer_id, 
       amount,
       SUM(amount) OVER () AS total_amount
FROM orders;

-- Example: GROUP BY with SUM(amount)
SELECT customer_id,
       SUM(amount) AS total_amount
FROM orders
GROUP BY customer_id;
