-- ======================================================================
-- Lab Experiment – GROUP BY, HAVING, ORDER BY and INDEXING
-- ======================================================================

-- Objective:
-- 1. To understand and apply the SQL GROUP BY clause to group rows based on column values and perform aggregate operations.
-- 2. To explore the HAVING clause for filtering grouped data post aggregation.
-- 3. To use the ORDER BY clause to sort query results in ascending or descending order.
-- 4. To implement Indexing in SQL for improving query performance.

-- ======================================================================
-- Step 1: Create Database
DROP DATABASE IF EXISTS HospitalDB;
CREATE DATABASE HospitalDB;
USE HospitalDB;

-- ======================================================================
-- Step 2: Create Tables
-- Create the relational schema for Patients and Visits.

CREATE TABLE Patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_name VARCHAR(50),
    age INT,
    gender VARCHAR(10)
);

CREATE TABLE Visits (
    visit_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    visit_date DATE,
    doctor_id INT,
    diagnosis VARCHAR(100),
    treatment_cost DECIMAL(10,2),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

-- OUTPUT:
-- (After creating tables, run DESC Patients; and DESC Visits; to verify structure.)
-- WRITE YOUR OUTPUT BELOW
DESC Patients;
DESC Visits;

-- ======================================================================
-- Step 3: Insert Sample Data
-- Insert sample records into both tables.
-- Add at least 5 patients and 8–10 visit records with varying diagnoses and treatment costs.
-- WRITE YOUR QUERIES BELOW
INSERT INTO Patients (patient_name, age, gender) VALUES
('Amit Kumar', 32, 'Male'),
('Priya Sharma', 28, 'Female'),
('Ravi Patel', 45, 'Male'),
('Sneha Rao', 36, 'Female'),
('Arjun Mehta', 50, 'Male');

INSERT INTO Visits (patient_id, visit_date, doctor_id, diagnosis, treatment_cost) VALUES
(1, '2025-10-01', 101, 'Flu', 150.00),
(2, '2025-10-03', 102, 'Diabetes', 400.00),
(3, '2025-10-05', 103, 'Flu', 180.00),
(4, '2025-10-06', 101, 'Hypertension', 500.00),
(5, '2025-10-07', 104, 'Flu', 220.00),
(1, '2025-10-09', 102, 'Migraine', 250.00),
(2, '2025-10-10', 101, 'Diabetes', 450.00),
(3, '2025-10-11', 103, 'Cold', 100.00),
(4, '2025-10-12', 104, 'Hypertension', 600.00),
(5, '2025-10-13', 101, 'Cold', 120.00);


-- OUTPUT:
-- (Run SELECT * FROM Patients; and SELECT * FROM Visits; to verify inserted data.)
-- WRITE YOUR OUTPUT BELOW
SELECT * FROM Patients;
SELECT * FROM Visits;

-- ======================================================================
-- QUICK INTRODUCTION (for notes)
-- GROUP BY: Groups rows sharing a value and performs aggregate functions like SUM(), COUNT(), AVG().
-- HAVING: Filters grouped data after aggregation.
-- ORDER BY: Sorts query results (ASC by default, DESC for descending order).
-- INDEXING: Improves query performance by creating a quick lookup on key columns.

-- ======================================================================
-- STUDENT ACTIVITY TASKS
-- ======================================================================

-- Task 1: Grouping Data by Diagnosis
-- Group the data based on diagnosis and calculate the average treatment cost for each diagnosis.
-- WRITE YOUR QUERY BELOW
SELECT 
    diagnosis,
    AVG(treatment_cost) AS avg_cost
FROM Visits
GROUP BY diagnosis;


-- OUTPUT:
-- WRITE YOUR OUTPUT BELOW
--  diagnosis     avg_cost 
--  Cold          110.00   
--  Diabetes      425.00   
--  Flu           183.33   
--  Hypertension  550.00   
--  Migraine      250.00   


-- ======================================================================
-- Task 2: Filtering with HAVING Clause
-- Filter the grouped data to show only diagnoses where the average treatment cost is greater than 200.
-- WRITE YOUR QUERY BELOW
SELECT 
    diagnosis,
    AVG(treatment_cost) AS avg_cost
FROM Visits
GROUP BY diagnosis
HAVING AVG(treatment_cost) > 200;


-- OUTPUT:
-- WRITE YOUR OUTPUT BELOW

--  diagnosis     avg_cost 
--  Diabetes      425.00   
--  Hypertension  550.00   
--  Migraine      250.00   

-- ======================================================================
-- Task 3: Sorting the Results
-- Sort the results from Task 1 in descending order of average treatment cost.
-- WRITE YOUR QUERY BELOW
SELECT 
    diagnosis,
    AVG(treatment_cost) AS avg_cost
FROM Visits
GROUP BY diagnosis
ORDER BY avg_cost DESC;


-- OUTPUT:
-- WRITE YOUR OUTPUT BELOW
--  diagnosis     avg_cost 
--  Hypertension  550.00   
--  Diabetes      425.00   
--  Migraine      250.00   
--  Flu           183.33   
--  Cold          110.00   


-- ======================================================================
-- Task 4: Optimizing with Indexes
-- Create an index on the patient_id column in the Visits table to improve performance.
-- Then run a query that retrieves all visits for a particular patient.
-- WRITE YOUR QUERIES BELOW
CREATE INDEX idx_patient_id ON Visits(patient_id);



-- OUTPUT:
-- (Verify index creation using SHOW INDEX FROM Visits;)
-- WRITE YOUR OUTPUT BELOW
SHOW INDEX FROM Visits;

SELECT * FROM Visits
WHERE patient_id = 2;

--  visit_id  patient_id  visit_date  doctor_id  diagnosis  treatment_cost 
--     2          2       2025-10-03     102     Diabetes   400.00         
--     7          2       2025-10-10     101     Diabetes   450.00         
-- ======================================================================
-- END OF EXPERIMENT
-- ======================================================================