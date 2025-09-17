create database task;
use task;
 -- Students table
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50)
);

CREATE TABLE Subjects (
    subject_id INT PRIMARY KEY,
    subject_name VARCHAR(50)
);

CREATE TABLE Enrollments (
    student_id INT,
    subject_id INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id)
);

-- Employees table
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

-- Products table
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    description VARCHAR(200)
);

-- Students
INSERT INTO Students VALUES (1,'Alice'),(2,'Bob'),(3,'Charlie');
INSERT INTO Subjects VALUES (101,'Math'),(102,'Science'),(103,'History');
INSERT INTO Enrollments VALUES (1,101),(1,102),(2,101),(3,103);

-- Employees
INSERT INTO Employees VALUES 
(1,'John','HR',50000),
(2,'Jane','HR',60000),
(3,'Mike','IT',70000),
(4,'Sara','IT',75000),
(5,'Tom','Finance',65000);

-- Products
INSERT INTO Products VALUES 
(1,'Laptop','This is a loptop with hihg performnce'),
(2,'Phone','Smart pnone with goood camera');

-- 1.A teacher wants a list of all subjects each student has enrolled in.
SELECT s.student_name, sub.subject_name
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Subjects sub ON e.subject_id = sub.subject_id;

-- 2.Cleaning up user input (removing extra spaces).

SELECT TRIM('   Hello SQL   ') AS CleanedText;

-- Example: cleaning student names
SELECT student_id, TRIM(student_name) AS CleanedName
FROM Students;

-- 3: Ranking employees within each department.
SELECT emp_name, department, salary,
       RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS RankInDept
FROM Employees;

-- 4: Create a view for reusable queries (high salary employees)

CREATE VIEW HighSalaryEmployees AS
SELECT emp_name, department, salary
FROM Employees
WHERE salary > 65000;

-- Use the view
SELECT * FROM HighSalaryEmployees;

-- 5: Divide students into 3 groups based on marks

ALTER TABLE Students ADD marks INT;

UPDATE Students SET marks = 85 WHERE student_id=1;
UPDATE Students SET marks = 60 WHERE student_id=2;
UPDATE Students SET marks = 40 WHERE student_id=3;

SELECT student_name, marks,
       CASE 
            WHEN marks >= 75 THEN 'Group A'
            WHEN marks >= 50 THEN 'Group B'
            ELSE 'Group C'
       END AS StudentGroup
FROM Students;

-- 6: Correct misspelled words in a product description.

SELECT product_id, 
       REPLACE(REPLACE(REPLACE(description,'loptop','laptop'),
                        'hihg','high'),
                        'pnone','phone') AS CorrectedDescription
FROM Products;

-- 7: Format employee IDs with leading zeros (LPAD) and right padding with stars (RPAD)

SELECT emp_id,
       LPAD(emp_id, 5, '0') AS ID_with_LeadingZeros,
       RPAD(emp_id, 5, '*') AS ID_with_Stars
FROM Employees;

-- 8: Extract first 3 letters of employee names

SELECT emp_name, SUBSTRING(emp_name, 1, 3) AS First3Letters
FROM Employees;




