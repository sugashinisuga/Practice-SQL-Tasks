create database task;
use task;
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100)
);

CREATE TABLE subjects (
    subject_id INT PRIMARY KEY,
    subject_name VARCHAR(100)
);

CREATE TABLE enrollments (
    student_id INT,
    subject_id INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
);

INSERT INTO students (student_id, student_name) VALUES
(1, 'Alice'),(2, 'Bob'),(3, 'Carol');

INSERT INTO subjects (subject_id, subject_name) VALUES
(101, 'Math'),(102, 'Science'),(103, 'English'),(104, 'History');

INSERT INTO enrollments (student_id, subject_id) VALUES
(1, 101),(1, 102),(1, 103),(2, 103),(2, 104),(3, 101);

SELECT s.student_name,
       sub.subject_name
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN subjects sub ON sub.subject_id = e.subject_id
ORDER BY s.student_name, sub.subject_name;


