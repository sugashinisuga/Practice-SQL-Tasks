Table Setup
Imagine a small database for an Online Course Platform with tables:
•	Students(StudentID, Name, Email, City, JoinDate)
•	Courses(CourseID, Title, Category, Price)
•	Enrollments(EnrollID, StudentID, CourseID, EnrollDate, Status)
•	Payments(PaymentID, StudentID, Amount, PayDate)

use practice;
create table student(
studentid int,
name varchar(20),
Email varchar(30),
city varchar(25),
joindate varchar(70));

create table coures(
courseid int primary key,
title varchar(30),
category varchar(20),
price decimal(10,2));

create table payment(
paymentid int,
studentid int primary key,
amount decimal(10,2),
paydate datetime);

create table entrollments(
enrollid  int,
studentid int primary key,
courseid int,
enrolldate varchar(30),
status varchar(20));
