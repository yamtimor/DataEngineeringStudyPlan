WITH RECURSIVE subordinates AS (
    -- Anchor member
    SELECT id, name, manager_id
    FROM employees
    WHERE manager_id = 1  -- The ID of the manager
    UNION ALL
    -- Recursive member
    SELECT e.id, e.name, e.manager_id
    FROM employees e
    INNER JOIN subordinates s ON e.manager_id = s.id
)
-- Final query
SELECT * FROM subordinates;
