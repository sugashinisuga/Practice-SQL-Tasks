use practice;
create table employee(
empid int auto_increment primary key,
empname varchar(20),
deptid int,
deptname varchar(10),
salary decimal(10,2),
status varchar(500),
contact bigint);
drop table employee;

insert into employee(empname,deptid,deptname,salary,contact)
values('sugashini',10,'HR',55000,7896541230),('sivaranjani',20,'Dev',50000,3578964120),('Agathiya',30,'Test',60000,1598742635),('shubham',20,'Dev',65000,1596324780),('vetha',10,'HR',45000,1452369870);

select *from employee;
delimiter $$
create procedure updatesalary(in p_empid int,in p_increment decimal(10,2))
begin
update employee
set salary=salary+p_increment
where empid =p_empid;
end $$
delimiter ;

drop procedure updatesalary;

call updatesalary(1,10000);

create table update_employeedetails(
empid int,
empname varchar(20),
contact bigint,
old_salary decimal(10,2),
new_salary decimal(10,2));

drop table update_employeedetails;
select*from update_employeedetails;

delimiter $$
create trigger salaryupdate_trigger
before update on employee
for each row
begin
insert update_employeedetails(empid,empname,contact,old_salary,new_salary)
values(old.empid,old.empname,old.contact,old.salary,new.salary);

if new.salary>old.salary then
set new.status =concat('salary updated for employee ID;',new.empid);
end if;
end $$
delimiter ;
drop trigger salaryupdate_trigger;
  set @msg ='';
CALL updatesalary(3,5000);


SELECT * FROM employee;
SELECT * FROM update_employeedetails;
