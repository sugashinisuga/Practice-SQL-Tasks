CREATE TABLE Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    City VARCHAR(50),
    JoinDate DATE
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);

CREATE TABLE Enrollments (
    EnrollID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    CourseID INT,
    EnrollDate DATE,
    Status VARCHAR(20),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    Amount DECIMAL(10,2),
    PayDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

-- Archive Table for Deleted Students
CREATE TABLE Archive_Students (
    StudentID INT,
    Name VARCHAR(100),
    Email VARCHAR(100),
    City VARCHAR(50),
    JoinDate DATE,
    DeletedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- 1. Add a new student who joined today
INSERT INTO Students (Name, Email, City, JoinDate)
VALUES ('Rahul Sharma', 'rahul@example.com', 'Chennai', CURDATE());

-- 2. Insert 3 new courses
INSERT INTO Courses (Title, Category, Price) VALUES
('SQL Basics', 'Database', 2000),
('Python Programming', 'Programming', 3000),
('Web Development', 'Programming', 4000);

-- 3. A student enrolls in 2 courses
INSERT INTO Enrollments (StudentID, CourseID, EnrollDate, Status)
VALUES (1, 1, CURDATE(), 'Active'),
       (1, 2, CURDATE(), 'Active');

-- 4. Record a payment
INSERT INTO Payments (StudentID, Amount, PayDate)
VALUES (1, 3000, CURDATE());

-- 5. Insert multiple students
INSERT INTO Students (Name, Email, City, JoinDate) VALUES
('Priya Singh', 'priya@example.com', 'Delhi', CURDATE()),
('Arun Kumar', 'arun@example.com', 'Bangalore', CURDATE()),
('Neha Verma', 'neha@example.com', 'Mumbai', CURDATE());

-- 6. Update a student’s city
UPDATE Students SET City = 'Bangalore'
WHERE City = 'Chennai';

-- 7. Increase Programming course prices by 10%
UPDATE Courses SET Price = Price * 1.10
WHERE Category = 'Programming';

-- 8. Update enrollment status to Completed
UPDATE Enrollments SET Status = 'Completed'
WHERE StudentID = 1 AND CourseID = 1;

-- 9. Correct a wrongly typed email
UPDATE Students SET Email = 'rahul.sharma@example.com'
WHERE StudentID = 1;

-- 10. Delete a student
DELETE FROM Students WHERE StudentID = 3;

-- 11. Delete all enrollments for a specific course
DELETE FROM Enrollments WHERE CourseID = 2;

-- 12. Truncate payments table
TRUNCATE TABLE Payments;
-- 13. Add PhoneNumber column
ALTER TABLE Students ADD PhoneNumber VARCHAR(15);

-- 14. Drop Payments table
DROP TABLE Payments;
-- 15. Total number of students enrolled
SELECT COUNT(DISTINCT StudentID) AS Total_Students
FROM Enrollments;

-- 16. Average course price by category
SELECT Category, AVG(Price) AS Avg_Price
FROM Courses
GROUP BY Category;

-- 17. Highest payment
SELECT MAX(Amount) AS Highest_Payment
FROM Payments;
-- 18. Students with more than 2 enrollments
SELECT StudentID, COUNT(*) AS Total_Enrollments
FROM Enrollments
GROUP BY StudentID
HAVING COUNT(*) > 2;

-- 19. Courses with no enrollments
SELECT CourseID, Title
FROM Courses
WHERE CourseID NOT IN (SELECT DISTINCT CourseID FROM Enrollments);

-- 20. Student who paid max amount
SELECT StudentID, Name
FROM Students
WHERE StudentID = (
    SELECT StudentID
    FROM Payments
    WHERE Amount = (SELECT MAX(Amount) FROM Payments)
);
-- 21. Procedure to add student
DELIMITER //
CREATE PROCEDURE AddStudent(IN pName VARCHAR(100), IN pEmail VARCHAR(100), IN pCity VARCHAR(50))
BEGIN
    INSERT INTO Students (Name, Email, City, JoinDate)
    VALUES (pName, pEmail, pCity, CURDATE());
END //
DELIMITER ;

-- Call example:
CALL AddStudent('Karan Patel', 'karan@example.com', 'Hyderabad');

-- 22. Procedure to get courses for a student
DELIMITER //
CREATE PROCEDURE GetStudentCourses(IN pStudentID INT)
BEGIN
    SELECT c.CourseID, c.Title, c.Category
    FROM Enrollments e
    JOIN Courses c ON e.CourseID = c.CourseID
    WHERE e.StudentID = pStudentID;
END //
DELIMITER ;

-- Call example:
CALL GetStudentCourses(1);
