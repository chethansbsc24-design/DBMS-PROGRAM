-- ======================================================================
-- Lab Experiment 04 – Implementation of Different Types of Operators in SQL
-- ======================================================================

-- Step 1: Create Database
DROP DATABASE IF EXISTS OperatorLab;
CREATE DATABASE OperatorLab;
USE OperatorLab;

-- Step 2: Create Tables
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Salary DECIMAL(10, 2),
    Department VARCHAR(50),
    HireDate DATE,
    Address VARCHAR(100)
);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50),
    EmployeeID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE Employees2022 (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(50)
);

CREATE TABLE Employees2023 (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(50)
);

-- Step 3: Insert Sample Data
INSERT INTO Employees (EmployeeID, Name, Age, Salary, Department, HireDate, Address) VALUES
(1001, 'Ashish', 28, 60000, 'IT', '2024-05-01', '123 Main St, New York'),
(1002, 'Binay', 45, 80000, 'HR', '2020-07-15', '456 Elm St, Chicago'),
(1003, 'Charlie', 32, 55000, 'Finance', '2022-01-10', '789 Oak St, Los Angeles'),
(1004, 'Dhruv', 38, 75000, 'HR', '2021-10-30', '101 Pine St, New York');

INSERT INTO Departments (DepartmentID, DepartmentName, EmployeeID) VALUES
(1, 'IT', 1001),
(2, 'HR', 1002),
(3, 'Finance', 1003);

INSERT INTO Employees2022 VALUES
(1001, 'Ashish', 'IT'),
(1002, 'Binay', 'HR'),
(1003, 'Charlie', 'Finance');

INSERT INTO Employees2023 VALUES
(1001, 'Ashish', 'IT'),
(1002, 'Binay', 'HR'),
(1004, 'Dhruv', 'HR');


-- ======================================================================
-- PRACTICE TASKS
-- ======================================================================

-- ========================
-- Exercise 1: Arithmetic Operators
-- ========================

-- a. Add a bonus (10% of Salary) to each employee's salary.
-- WRITE YOUR QUERY BELOW
SELECT EmployeeID, Name, Salary, Salary * 0.10 AS Bonus, Salary + (Salary * 0.10) AS BONUS FROM Employees;

-- output

-- '1001', 'Ashish', '60000.00', '6000.0000', '66000.0000'
-- '1002', 'Binay',  '80000.00', '8000.0000', '88000.0000'
-- '1003', 'Charlie','55000.00', '5500.0000', '60500.0000'
-- '1004', 'Dhruv',  '75000.00', '7500.0000', '82500.0000'


-- b. Subtract tax (15% of Salary) from each employee's salary.
-- WRITE YOUR QUERY BELOW
SELECT EmployeeID, Name, Salary, Salary * 0.15 AS Tax, Salary - (Salary * 0.15) AS SalaryAfterTax FROM Employees;

-- output

-- '1001', 'Ashish', '60000.00', '9000.0000', '51000.0000'
-- '1002', 'Binay', ' 80000.00', '12000.0000', '68000.0000'
-- '1003', 'Charlie', 55000.00', '8250.0000', '46750.0000'
-- '1004', 'Dhruv', ' 75000.00', '11250.0000', '63750.0000'


-- c. Calculate the yearly salary from the monthly salary (Salary * 12).
-- WRITE YOUR QUERY BELOW

SELECT EmployeeID, Name, Salary, Salary * 12 AS YearlySalary FROM Employees; 

-- output

-- '1001', 'Ashish', '60000.00', '720000.00'
-- '1002', 'Binay',  '80000.00', '960000.00'
-- '1003', 'Charlie','55000.00', '660000.00'
-- '1004', 'Dhruv',  '75000.00', '900000.00'



-- d. Find the remainder when employees' ages are divided by 5.
-- WRITE YOUR QUERY BELOW

SELECT EmployeeID, Name, Age, Age % 5 AS RemainderWhenDividedBy5 FROM Employees;

-- output

-- '1001', 'Ashish', '28', '3'
-- '1002', 'Binay',  '45', '0'
-- '1003', 'Charlie','32', '2'
-- '1004', 'Dhruv',  '38', '3'

-- ========================
-- Exercise 2: Logical Operators
-- ========================

-- a. Employees older than 30 and salary greater than 50000.
-- WRITE YOUR QUERY BELOW

SELECT EmployeeID, Name, Age, Salary FROM Employees WHERE Age > 30 AND Salary > 50000;

-- output


-- '1002', 'Binay',  '45', '80000.00'
-- '1003', 'Charlie','32', '55000.00'
-- '1004', 'Dhruv',  '38', '75000.00'


-- b. Employees either in 'HR' department OR salary > 70000.
-- WRITE YOUR QUERY BELOW

SELECT EmployeeID, Name, Department, Salary FROM Employees WHERE Department = 'HR' OR Salary > 70000;

-- output

-- '1002', 'Binay', 'HR', '80000.00'
-- '1004', 'Dhruv', 'HR', '75000.00'


-- c. Employees who do NOT live in 'New York'.
-- WRITE YOUR QUERY BELOW

SELECT EmployeeID, Name, Address FROM Employees WHERE Address NOT LIKE '%New York%';

-- output

-- '1002'	'Binay'	    '456 Elm St,'  'Chicago'
-- '1003'	'Charlie'	 '789 Oak St,' 'Los Angeles'


-- ========================
-- Exercise 3: Comparison Operators
-- ========================

-- a. Find employees with salary = 60000.
-- WRITE YOUR QUERY BELOW

SELECT EmployeeID, Name, Salary FROM Employees WHERE Salary = 60000;

-- output 

-- '1001', 'Ashish', '60000.00'


-- b. List employees not in the 'IT' department.
-- WRITE YOUR QUERY BELOW

SELECT EmployeeID, Name, Department FROM Employees WHERE Department != 'IT';

-- output 

-- '1002', 'Binay', 'HR'
-- '1003', 'Charlie', 'Finance'
-- '1004', 'Dhruv', 'HR'



-- c. Retrieve employees younger than 25 with salary > 50000.
-- WRITE YOUR QUERY BELOW

SELECT EmployeeID, Name, Age, Salary FROM Employees WHERE Age < 25 AND Salary > 50000;

-- output 

-- 'NULL' 'NULL' 'NULL' 'NULL'

-- ========================
-- Exercise 4: Special Operators
-- ========================

-- a. BETWEEN → List employees with age between 25 and 35.
-- WRITE YOUR QUERY BELOW

SELECT EmployeeID, Name, Age FROM Employees WHERE Age BETWEEN 25 AND 35;

-- output

-- '1001', 'Ashish', '28'
-- '1003', 'Charlie', '32'


-- b. IN → Find employees working in 'HR', 'IT', or 'Finance'.
-- WRITE YOUR QUERY BELOW

SELECT EmployeeID, Name, Department FROM Employees WHERE Department IN ('HR', 'IT', 'Finance');

-- output

-- '1001', 'Ashish', 'IT'
-- '1002', 'Binay', 'HR'
-- '1003', 'Charlie', 'Finance'
-- '1004', 'Dhruv', 'HR'



-- c. LIKE → Find employees whose names start with 'A'.
-- WRITE YOUR QUERY BELOW

SELECT EmployeeID, Name FROM Employees WHERE Name LIKE 'A%';

-- output

-- '1001', 'Ashish'

-- d. IS NULL → List employees whose address is not available.
-- WRITE YOUR QUERY BELOW

SELECT EmployeeID, Name, Address FROM Employees WHERE Address IS NULL;

-- output

-- 'NULL' 'NULL' 'NULL'

-- ========================
-- Exercise 5: Set Operators
-- ========================

-- NOTE: For these, assume you have two Employee tables (Employees2022 and Employees2023).

-- a. UNION → Retrieve employees from 'HR' department in 2023 and 2022.
-- WRITE YOUR QUERY BELOW
SELECT Name, Department 
FROM Employees2022 
WHERE Department = 'HR'
UNION
SELECT Name, Department 
FROM Employees2023 
WHERE Department = 'HR';

-- output 


-- b. INTERSECT → Find common employees in 'IT' department across 2022 & 2023.
-- (MySQL doesn’t have INTERSECT directly – use INNER JOIN / EXISTS workaround)
-- WRITE YOUR QUERY BELOW

SELECT e22.Name, e22.Department
FROM Employees2022 e22
INNER JOIN Employees2023 e23
ON e22.Name = e23.Name AND e22.Department = e23.Department
WHERE e22.Department = 'IT';

-- output


-- c. EXCEPT → Find employees who worked in 2023 but not in 2022.
-- (MySQL doesn’t have EXCEPT directly – use LEFT JOIN / NOT EXISTS workaround)
-- WRITE YOUR QUERY BELOW

SELECT e23.Name, e23.Department
FROM Employees2023 e23
LEFT JOIN Employees2022 e22
ON e23.Name = e22.Name AND e23.Department = e22.Department
WHERE e22.Name IS NULL;

-- output


-- ======================================================================
-- END OF EXPERIMENT 04
-- ======================================================================