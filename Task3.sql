create database SLA;
use SLA;
create table employee(
empid int ,
name varchar(30),
dept varchar(10),
salary decimal(10.20),
city varchar(30));

insert into employee
values(101,'ram','HR',45000,'chennai'),(102,'sam','Dev',50000,'coimbatore'),(103,'Suga','Test',60000,'chennai'),(104,'Deva','Test',35000,'villupuram'),(105,'siva','Dev',50000,'bangalor'),(106,'Devi','HR',40000,'coimbatore');
select*from employee;

select count(dept) from employee;

select count(dept) from employee where dept='Hr';

select avg(salary) from employee;

select *from employee order by salary;

SELECT emp_id, emp_name, dept, salary
FROM employee
ORDER BY dept ASC, salary ASC;

select * from employee order by dept asc, salary asc;
