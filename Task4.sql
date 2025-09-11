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

select * from employee
where name like 'S%';

select* from employee
where name like '%cni%';

select*from employee
where name like '%a';

select*from employee
where city like '%i';

select dept,count(dept) AS employee_count,avg(salary) AS avg_salary
from employee group by dept
HAVING count(dept) > 2
order by avg_salary desc;
