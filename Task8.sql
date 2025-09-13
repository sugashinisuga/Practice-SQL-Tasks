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
