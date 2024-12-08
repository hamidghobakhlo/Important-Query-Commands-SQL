--1. Basic Commands
SELECT
Retrieve specific columns from a table.


SELECT Name, Age FROM Employees;
INSERT
Add a new record to a table.


INSERT INTO Employees (Name, Age, Department) 
VALUES ('John Doe', 30, 'HR');
UPDATE
Modify existing records in a table.


UPDATE Employees 
SET Age = 31 
WHERE Name = 'John Doe';
DELETE
Remove specific records from a table.


DELETE FROM Employees 
WHERE Name = 'John Doe';
--2. Table Management
CREATE TABLE
Define a new table structure.


CREATE TABLE Employees (
    ID INT PRIMARY KEY,
    Name NVARCHAR(50),
    Age INT,
    Department NVARCHAR(50)
);
ALTER TABLE
Modify the structure of an existing table.


ALTER TABLE Employees 
ADD Salary DECIMAL(10, 2);
DROP TABLE
Delete a table permanently.


DROP TABLE Employees;
--3. Constraints
PRIMARY KEY
Ensure a unique identifier for each record.


CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName NVARCHAR(50)
);
FOREIGN KEY
Establish relationships between tables.


ALTER TABLE Employees 
ADD CONSTRAINT FK_Department 
FOREIGN KEY (Department) REFERENCES Departments(DeptName);
UNIQUE
Guarantee unique values in a column.


ALTER TABLE Employees 
ADD CONSTRAINT UQ_Email UNIQUE (Email);
CHECK
Impose conditions on data in a column.


ALTER TABLE Employees 
ADD CONSTRAINT CK_Age CHECK (Age > 18);
--4. Advanced Queries
JOIN
Combine rows from multiple tables.


SELECT e.Name, d.DeptName 
FROM Employees e
INNER JOIN Departments d ON e.Department = d.DeptName;
GROUP BY
Aggregate data based on column values.


SELECT Department, COUNT(*) AS EmployeeCount 
FROM Employees
GROUP BY Department;
HAVING
Filter aggregated data.


SELECT Department, COUNT(*) AS EmployeeCount 
FROM Employees
GROUP BY Department
HAVING COUNT(*) > 5;
DISTINCT
Fetch unique column values.


SELECT DISTINCT Department 
FROM Employees;
ORDER BY
Sort the result set.


SELECT Name, Age 
FROM Employees
ORDER BY Age DESC;
5. Subqueries
Inline Subquery
Retrieve results based on a nested query.


SELECT Name 
FROM Employees
WHERE Age = (SELECT MAX(Age) FROM Employees);
EXISTS
Check for the existence of a condition.


SELECT Name 
FROM Employees 
WHERE EXISTS (SELECT 1 FROM Departments WHERE DeptName = 'HR');
6. Index Management
CREATE INDEX
Improve query performance by indexing a column.


CREATE INDEX IX_Employees_Name ON Employees(Name);
DROP INDEX
Remove an index.


DROP INDEX IX_Employees_Name ON Employees;
--7. Views
CREATE VIEW
Create a virtual table.


CREATE VIEW vw_EmployeeDetails AS
SELECT Name, Age, Department 
FROM Employees
WHERE Age > 30;
DROP VIEW
Delete a view.


DROP VIEW vw_EmployeeDetails;
--8. Stored Procedures
CREATE PROCEDURE
Encapsulate SQL logic in reusable procedures.


CREATE PROCEDURE usp_GetEmployeesByDept
    @DeptName NVARCHAR(50)
AS
BEGIN
    SELECT * 
    FROM Employees
    WHERE Department = @DeptName;
END;
EXEC
Execute a stored procedure.



EXEC usp_GetEmployeesByDept @DeptName = 'HR';
--9. Transactions
BEGIN TRANSACTION / ROLLBACK / COMMIT
Manage atomic operations.


BEGIN TRANSACTION;

UPDATE Employees 
SET Age = 29 
WHERE Name = 'Jane Doe';

ROLLBACK; -- Undo the changes.

COMMIT; -- Save the changes permanently.
--10. Triggers
CREATE TRIGGER
Define actions that execute automatically.


CREATE TRIGGER trg_AfterInsert 
ON Employees
AFTER INSERT
AS
BEGIN
    PRINT 'A new employee has been added.';
END;
--11. Functions
Scalar Function
Create reusable logic for scalar values.


CREATE FUNCTION dbo.CalculateBonus(@Salary DECIMAL(10, 2))
RETURNS DECIMAL(10, 2)
AS
BEGIN
    RETURN (@Salary * 0.1);
END;
Calling the Function
Use the function in queries.


SELECT dbo.CalculateBonus(50000);
--12. Security
GRANT
Provide permissions to a user.


GRANT SELECT ON Employees TO [Username];
REVOKE
Revoke permissions from a user.


REVOKE SELECT ON Employees FROM [Username];