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
