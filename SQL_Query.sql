----------------------SQL Database----------------------
--Create DataBase
CREATE DATABASE testDB;

--Drop DataBase
USE master
Go

ALTER DATABASE testDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO

DROP DATABASE IF EXISTS testDB;

--Create DataBase
USE master
GO
CREATE DATABASE testDB;

--Rename DataBase
ALTER DATABASE testDB MODIFY NAME = TestDB;

--Select DataBase
USE TestDB;
GO

----------------------SQL Tables----------------------

--Create Table

CREATE TABLE customer(
customerID INT PRIMARY KEY,
customerName NVARCHAR(50),
customerLastName NVARCHAR(50),
customerCountry NVARCHAR(60),
customerAge INT CHECK (customerAge>=0 AND customerAge<=99),
customerPhone CHAR(11)
);

CREATE TABLE customer_with_identity(
customerID INT PRIMARY KEY IDENTITY(1,1),
customerName NVARCHAR(50),
customerLastName NVARCHAR(50),
customerCountry NVARCHAR(60),
customerAge INT CHECK (customerAge>=0 AND customerAge<=99),
customerPhone CHAR(11)
);

INSERT INTO customer(customerID,customerName,customerLastName,customerCountry,customerAge,
customerPhone)
VALUES  (1,N'حمید',N'قباخلو',N'ایران',21,'09121234567'),
		(2,N'محمد',N'حیدری',N'ایران',21,'09121234567'),
		(3, 'Naveen', 'Tulasi', 'Sri lanka',21,'09121234567'),
        (4, 'Aditya', 'Arpan', 'Austria',21,'09121234567'),
        (5, 'Nishant. Salchichas S.A.', 'Jain', 'Spain',21,'09121234567');

---Create Table from Existing Table
--Copying a Table
SELECT customerID,customerName
INTO coustomer_INTO_newTable
FROM customer
WHERE customerID = 1;

--Drop Table
DROP TABLE [dbo].[coustomer_INTO_newTable];

---DROP TABLE IF EXISTS
DROP TABLE IF EXISTS categories;


/*
1-Renaming a table.
2-Changing a column name.
3-Adding or deleting columns.
4-Modifying the data type of a column.
*/
CREATE TABLE Student (
  id INT PRIMARY KEY,
  name VARCHAR(50),
  age INT,
  email VARCHAR(50),
  phone VARCHAR(20)
);

INSERT INTO Student (id, name, age, email, phone) 
VALUES 
(1, 'Amit', 20, 'amit@gmail.com', '9999999999'),
(2, 'Rahul', 22, 'rahul@yahoo.com', '8888888888'),
(3, 'Priya', 21, 'priya@hotmail.com', '7777777777'),
(4, 'Sonia', 23, 'sonia@gmail.com', '6666666666'),
(5, 'Kiran', 19, 'kiran@yahoo.com', '5555555555');

--1-Renaming a table.
EXEC sp_rename 'Student', 'Students';
 
--2-Changing a column name.
EXEC sp_rename 'Student.name', 'newName', 'COLUMN';

--3-Adding a columns.
ALTER TABLE Students 
ADD country NVARCHAR(100);

--4-Modifying the data type of a column.
ALTER TABLE Students
ALTER COLUMN Phone BIGINT;

--5-Deleting a column
ALTER TABLE Students
DROP COLUMN Phone;

--TRUNCATE TABLE 
TRUNCATE TABLE Students;

----------------------SQL Queries----------------------

--SELECT Query
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    LastName VARCHAR(50),
    Country VARCHAR(50),
    Age INT,
    Phone VARCHAR(10) );

INSERT INTO Customers (CustomerID, CustomerName, LastName, Country, Age, Phone)
VALUES   (1, 'Liam', 'Smith', 'USA', 23, 'xxxxxxxxxx'),
                (2, 'Sophia', 'Miller', 'USA', 21, 'xxxxxxxxxx'),
                (3, 'Akira', 'Tanaka', 'Japan', 24, 'xxxxxxxxxx'),
                (4, 'Carlos', 'Hernandez', 'USA', 21, 'xxxxxxxxxx'),
                (5, 'Isabella', 'Rossi', 'Italy', 22, 'xxxxxxxxxx');

---1:SELECT Specific Columns
SELECT Cu.customerID , cu.customerName
FROM Customers as cu;

---2:SELECT All Columns
SELECT *
FROM Customers;

---3:SELECT Statement with WHERE Clause
SELECT CU.customerName
FROM customers AS CU
WHERE CU.Age = '21';

---4:SELECT with GROUP BY Clause
SELECT cu.Country,COUNT(*) AS customer_count
FROM customers AS cu
GROUP BY cu.Country;

---5:SELECT with DISTINCT Clause
SELECT DISTINCT cu.Country
From Customers AS cu;

---6:SELECT Statement with HAVING Clause
SELECT cu.Country,COUNT(*) AS Customer_count
FROM customer AS cu
GROUP BY cu.Country
HAVING COUNT(*)>=2;

---7:SELECT Statement with ORDER BY clause
SELECT *
FROM Customers AS cu
ORDER BY cu.Age DESC --or ASC

--SQL INSERT INTO Statement
CREATE DATABASE StudentDB;

USE StudentDB;

CREATE TABLE Student (
    ROLL_NO INT PRIMARY KEY,
    NAME VARCHAR(50),
    ADDRESS VARCHAR(100),
    PHONE VARCHAR(15),
    AGE INT );

INSERT INTO Student (ROLL_NO, NAME, ADDRESS, PHONE, AGE) 
VALUES  (1, 'Liam', 'New York', 'xxxxxxxxxx', 18),
               (2, 'Sophia', 'Berlin', 'xxxxxxxxxx', 18),
               (3, 'Akira', 'Tokyo', 'xxxxxxxxxx', 20),
               (4, 'Carlos', 'Tokyo', 'xxxxxxxxxx', 18);


---1.Inserting Data into All Columns
INSERT INTO Student 
VALUES (5, 'Isabella', 'Rome', 'xxxxxxxxxx', 19);

---2.Inserting Data into Specific Columns
INSERT INTO Student (ROLL_NO, NAME, AGE) 
VALUES (6, 'Hiroshi', 19);

---3.Inserting Multiple Rows at Once
INSERT INTO Student (ROLL_NO, NAME, ADDRESS, PHONE, AGE) 
VALUES
(7, 'Mateo Garcia', 'Madrid', 'xxxxxxxxxx', 15),
(8, 'Hana Suzuki', 'Osaka', 'xxxxxxxxxx', 18),
(9, 'Oliver Jensen', 'Copenhagen', 'xxxxxxxxxx', 17),
(10, 'Amelia Brown', 'London', 'xxxxxxxxxx', 17);

---4.Inserting Data from One Table into Another Table
CREATE TABLE Student1 (
    ROLL_NO INT PRIMARY KEY,
    NAME VARCHAR(50),
    ADDRESS VARCHAR(100),
    PHONE VARCHAR(15),
    AGE INT );

INSERT INTO Student1
SELECT * FROM Student;

---5.Insert Specific Columns from Another Table
CREATE TABLE Student2 (
    ROLL_NO INT PRIMARY KEY,
    NAME VARCHAR(50),
    ADDRESS VARCHAR(100),
    PHONE VARCHAR(15),
    AGE INT );

INSERT INTO Student2(s.ROLL_NO,s.Name)
SELECT s.ROLL_NO,s.Name
FROM Student AS s;

---3:Insert Specific Rows Based on Condition
CREATE TABLE Student3 (
    ROLL_NO INT PRIMARY KEY,
    NAME VARCHAR(50),
    ADDRESS VARCHAR(100),
    PHONE VARCHAR(15),
    AGE INT );

INSERT INTO Student3
SELECT * 
FROM Student
WHERE AGE >=20;

---4:Inserting Data Using Transactions

CREATE TABLE Customer1 (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    LastName VARCHAR(50),
    Country VARCHAR(50),
    Age INT,
    Phone VARCHAR(10));


BEGIN TRANSACTION;

    INSERT INTO Customer1 (CustomerID, CustomerName, LastName, Country)
    VALUES (5, 'Sarah White', 'John White', 'Canada');
    
    INSERT INTO Customer1 (CustomerID, CustomerName, LastName, Country)
    VALUES (7, 'Mohamed Ibrahim', 'Ahmed Ibrahim', 'UAE');
    
    -- If any error occurs, the transaction will be rolled back
COMMIT;

--SQL UPDATE Statement

CREATE TABLE Customer3 (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    LastName VARCHAR(50),
    Country VARCHAR(50),
    Age INT,
    Phone VARCHAR(15)
);

-- Insert sample data
INSERT INTO Customer3 (CustomerID, CustomerName, LastName, Country, Age, Phone)
VALUES 
(1, 'Shubham', 'Thakur', 'India', 23, '9415536635'),
(2, 'Aman', 'Chopra', 'Australia', 21, '9812345678'),
(3, 'Naveen', 'Tulasi', 'Sri Lanka', 24, '9123456789'),
(4, 'Aditya', 'Arpan', 'Austria', 21, '9876543210'),
(5, 'Nishant', 'Jain', 'Spain', 22, '7012345678');

---1:Update Single Column Using UPDATE Statement
UPDATE Customer3
SET CustomerName = 'Hamid'
WHERE Age >=22;

---2:Updating Multiple Columns using UPDATE Statement
UPDATE Customer3
SET	CustomerName = 'Ali',Country = 'Iran'
WHERE CustomerID = 1;

---3:Omitting WHERE Clause in UPDATE Statement
UPDATE Customer3
SET CustomerName = 'Hamid';

--SQL DELETE Statement
USE TestDB
GO

CREATE TABLE GFG_Employees (
   id INT PRIMARY KEY,
   name VARCHAR (20) ,
   email VARCHAR (25),
   department VARCHAR(20)
);

INSERT INTO GFG_Employees (id, name, email, department) VALUES 
(1, 'Jessie', 'jessie23@gmail.com', 'Development'),
(2, 'Praveen', 'praveen_dagger@yahoo.com', 'HR'),
(3, 'Bisa', 'dragonBall@gmail.com', 'Sales'),
(4, 'Rithvik', 'msvv@hotmail.com', 'IT'),
(5, 'Suraj', 'srjsunny@gmail.com', 'Quality Assurance'),
(6, 'Om', 'OmShukla@yahoo.com', 'IT'),
(7, 'Naruto', 'uzumaki@konoha.com', 'Development');

Select * From GFG_Employees

---1:Deleting Single Record
DELETE FROM GFG_Employees
WHERE name = 'Rithvik';

---2:Deleting Multiple Records
DELETE FROM GFG_Employees
WHERE department = 'Development';

---3:Delete All Records from a Table
DELETE FROM GFG_Employees;

--SQL Query to Delete Duplicate Rows
CREATE TABLE DETAILS (
    SN INT IDENTITY(1,1) PRIMARY KEY,
    EMPNAME VARCHAR(25) NOT NULL,
    DEPT VARCHAR(20) NOT NULL,
    CONTACTNO BIGINT NOT NULL,
    CITY VARCHAR(15) NOT NULL
);

-- Insert sample data
INSERT INTO DETAILS (EMPNAME, DEPT, CONTACTNO, CITY)
VALUES 
    ('VISHAL', 'SALES', 9193458625, 'GAZIABAD'),
    ('VIPIN', 'MANAGER', 7352158944, 'BAREILLY'),
    ('ROHIT', 'IT', 7830246946, 'KANPUR'),
    ('RAHUL', 'MARKETING', 9635688441, 'MEERUT'),
    ('SANJAY', 'SALES', 9149335694, 'MORADABAD'),
    ('VIPIN', 'MANAGER', 7352158944, 'BAREILLY'),
    ('VISHAL', 'SALES', 9193458625, 'GAZIABAD'),
    ('AMAN', 'IT', 78359941265, 'RAMPUR');

---How to Identify Duplicate Rows
SELECT EMPNAME,DEPT,CONTACTNO,CITY,COUNT(*) AS [Duplicate Rows]
FROM DETAILS
GROUP BY EMPNAME,DEPT,CONTACTNO,CITY
HAVING COUNT(*)>1;

----------------------Data Constraints----------------------
--SQL NOT NULL Constraint Syntax
---1:Applying NOT NULL in Table Creation

CREATE TABLE Emp (
    EmpID INT NOT NULL PRIMARY KEY,
    Name VARCHAR(50),
    Country VARCHAR(50),
    Age INT,
    Salary INT
);

---2:Adding NOT NULL to an Existing Table
ALTER TABLE Emp
ALTER COLUMN Name VARCHAR(50) NOT NULL;

--SQL PRIMARY KEY Constraint
---Create PRIMARY KEY in SQL Example
CREATE TABLE Persons (
  PersonID int NOT NULL PRIMARY KEY,
  LastName varchar(255) NOT NULL,
  FirstName varchar(255),
  Age int
);
----Verify SQL Primary key creation
INSERT INTO Persons VALUES
  (1,'Thakur', 'Aditya', 22),
  (1, 'Kumar', 'Shubham', 21);

---Add PRIMARY KEY to a Table Example
CREATE TABLE Person1 ( 
  PersonID int,
  LastName varchar(255) NOT NULL,
  FirstName varchar(255),  Age int);

ALTER TABLE Person1
ALTER COLUMN PersonID int NOT NULL;

ALTER TABLE Person1
ADD CONSTRAINT PK_Person PRIMARY KEY (PersonID);

--SQL FOREIGN KEY Constraint
CREATE DATABASE GEEKS;

USE GEEKS
GO

CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY,
  CustomerName VARCHAR(50) NOT NULL
);

CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  OrderNumber INT NOT NULL,
  CustomerID INT,
  CONSTRAINT FK_CUSTOMERID FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Customers (CustomerID, CustomerName)
VALUES (1, 'John'), (2, 'Jane'), (3, 'Bob');

INSERT INTO Orders (OrderID, OrderNumber, CustomerID)
VALUES (1, 101, 1), (2, 102, 2), (3, 103, 3);

---1:Insert Value in Foreign Key Table
INSERT INTO Orders (OrderID, OrderNumber, CustomerID)
VALUES (4, 104, 4);

---2:Delete a value in Foreign Key Table
DELETE FROM Customers 
WHERE CustomerID = '3';

--Composite Key in SQL Constraint
CREATE DATABASE School;

USE School
GO

---Creating a table with a composite key:
CREATE TABLE student
(rollNumber INT, 
name VARCHAR(30), 
class VARCHAR(30), 
section VARCHAR(1), 
mobile VARCHAR(10),
PRIMARY KEY (rollNumber, mobile));

INSERT INTO student (rollNumber, name, class, section, mobile) 
VALUES (1, 'AMAN', 'FOURTH', 'B', '9988774455');

INSERT INTO student (rollNumber, name, class, section, mobile) 
VALUES (2, 'JOHN', 'FIRST', 'A', '9988112233');

INSERT INTO student (rollNumber, name, class, section, mobile) 
VALUES (3, 'TOM', 'FOURTH', 'B', '9988777755');

INSERT INTO student (rollNumber, name, class, section, mobile) 
VALUES (4, 'RICHARD', 'SECOND', 'C', '9955663322');

SELECT * FROM student;

--SQL UNIQUE Constraint
---1:Creating a Table with UNIQUE Constraints
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Country VARCHAR(50)
);

INSERT INTO Customers (CustomerID, Name, Email, Country)
VALUES (1, 'John Doe', 'john.doe@example.com', 'USA');

INSERT INTO Customers (CustomerID, Name, Email, Country)
VALUES (2, 'Jane Smith', 'jane.smith@example.com', 'Canada');

INSERT INTO Customers (CustomerID, Name, Email, Country)
VALUES (3, 'Jane Smith', '', 'Canada');

INSERT INTO Customers (CustomerID, Name, Email, Country)
VALUES ('', 'Hamid Ghobakhlo', 'hamidghobakhlo@gmail.com', 'Iran');
select * from Customers

----ERROR:Cannot insert duplicate key
INSERT INTO Customers (CustomerID, Name, Email, Country)
VALUES ('', 'Hamid Ghobakhlo', 'hamidghob@gmail.com', 'Iran');

---- This will fail because 'john.doe@example.com' already exists
INSERT INTO Customers (CustomerID, Name, Email, Country)
VALUES (3, 'Alice Johnson', 'john.doe@example.com', 'UK');

---2:Using UNIQUE with Multiple Columns
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    OrderDate DATE,
    UNIQUE (CustomerID, ProductID)
);

--SQL ALTERNATE KEY Constraint
/*
UNIQUE ≠ Alternate Key
UNIQUE NOT NULL ≈ Alternate Key
*/
CREATE TABLE users (
    id INT PRIMARY KEY,               -- Primary Key
    email VARCHAR(100) UNIQUE NOT NULL,   -- Alternate Key!
    national_id VARCHAR(20) UNIQUE NOT NULL  -- Alternate Key دیگر!
);

--SQL CHECK Constraint
---1:Applying CHECK on a Single Column
CREATE TABLE Customers5 (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT CHECK (Age >= 18 AND Age <= 120)
);

-- Valid insert
INSERT INTO Customers5 (CustomerID, Name, Age)
VALUES (1, 'John Doe', 25);

-- Invalid insert
INSERT INTO Customers5 (CustomerID, Name, Age)
VALUES (2, 'Jane Smith', 15);  -- This will fail due to the CHECK constraint

---2:CHECK Constraint with Multiple Columns
CREATE TABLE Employee2 (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Salary DECIMAL(10, 2),
    CHECK (Age >= 18 AND Salary > 0)
);

-- Valid insert
INSERT INTO Employee2 (EmployeeID, Name, Age, Salary)
VALUES (1, 'Alice Johnson', 30, 50000);

-- Invalid insert (age < 18)
INSERT INTO Employee2 (EmployeeID, Name, Age, Salary)
VALUES (2, 'Bob Lee', 16, 45000);  -- This will fail due to the CHECK constraint

---3:Adding a CHECK Constraint with ALTER TABLE
ALTER TABLE Employee2
ADD CONSTRAINT CHK_SALARY CHECK (Salary>=30000);

---SQL DEFAULT Constraint
CREATE TABLE Geeks2 (
    ID INT NOT NULL,
    Name VARCHAR(255),
    Age INT,
    Location VARCHAR(255) DEFAULT 'Iran'
);

INSERT INTO Geeks2 (ID, Name, Age, Location) 
VALUES (4, 'Mira', 23, 'Delhi');

INSERT INTO Geeks2 (ID, Name, Age, Location) 
VALUES (6, 'Neha', 25, 'Delhi');

----ERROR
INSERT INTO Geeks2 (ID, Name, Age, Location)
VALUES (5, 'Hema', 27);

INSERT INTO Geeks2 (ID, Name, Age, Location) 
VALUES (7, 'Khushi', 26, DEFAULT);

---Dropping the DEFAULT Constraint
SELECT name
FROM sys.default_constraints
WHERE parent_object_id = OBJECT_ID('Geeks2')
  AND parent_column_id = COLUMNPROPERTY(OBJECT_ID('Geeks2'), 'Location', 'ColumnId');

ALTER TABLE Geeks2
DROP CONSTRAINT [DF__Geeks2__Location__4BAC3F29];

----------------------SQL Indexes----------------------
USE GEEKS
GO

CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    quantity INT,
    customer_id INT );

INSERT INTO Sales (sale_id, product_id, quantity, customer_id) 
VALUES ( 1, 101, 5, 201),
		(2, 102, 2, 202),
		(3, 101, 3, 203),
		(4, 103, 1, 204),
		(5, 104, 7, 205);

---1.Creating an Index
CREATE INDEX idx_product_id ON Sales (product_id);

---2.Multi Column Indexes
CREATE INDEX idx_product_quantity ON Sales (product_id, quantity);

---3.Unique Indexes
CREATE UNIQUE INDEX idx_unique_employee_id ON Sales (customer_id);

----If we try inserting a duplicate:
INSERT INTO Sales (sale_id, product_id, quantity, customer_id)
VALUES (6, 105, 4, 201);

---4.Removing an Index
DROP INDEX sales.idx_product_quantity;

---5.Altering an Index
ALTER INDEX idx_product_id ON Sales REBUILD;

---6.Show Indexes on the Table
EXEC sp_helpindex 'sales';

---7.Renaming an Index
EXEC sp_rename 
    @objname = 'sales.idx_product_id', 
    @newname = 'NewIndexName1', 
    @objtype = 'INDEX';

