-- Basic Self Join
SELECT A.EmployeeName AS Employee, B.EmployeeName AS Manager
FROM Employees A, Employees B
WHERE A.ManagerID = B.EmployeeID;


-- More explicit way to do a self join
SELECT A.EmployeeName AS Employee, B.EmployeeName AS Manager
FROM Employees A
INNER JOIN Employees B ON A.ManagerID = B.EmployeeID;
