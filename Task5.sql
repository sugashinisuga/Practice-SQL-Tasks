create database sugashini;
 use sugashini;
 create table employee(
 emp_id int,
 emp_name varchar(20),
 salary decimal(10.2),
 dept varchar(15),
 depi_id int);
 
 alter table employee  change depi_id departid int;
 
 insert into employee
 values (101,'suga',50000,'hr',10),(102,'deva',45000,'test',20),(103,'vetha',35000,'hr',10),(104,'siva',55000,'dev',30),(105,'agathiya',60000,'dev',30);
  select* from employee;

 delimiter $$
  create procedure updatedept(in dept_id int, in newdept varchar(10),out message varchar(400))
  begin
  declare currentdept varchar(10);
  select dept into currentdept from employee where dept_id = 10;
  
  if newdept != currentdept then
  update employee set dept = newdept where dept_id =10;
  set message ='new dept is updated';
  
  else 
  set message ='new dept is not updated';
  end if;
  end $$
  delimiter ;
   drop procedure updatedept;
  
  set @msg ='';
  call updatedept(20,'hr',@msg);
  select @msg;
  
  select *from employee;
