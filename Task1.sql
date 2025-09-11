create database vegtableshop;
use vegtableshop;
create table shop1(
veg_name varchar(20),
veg_id int ,
sal_id int,
price int);

insert into shop1(veg_name,veg_id,sal_id,price)
values('onion',0001,2030,35);
insert into shop1(veg_name,veg_id,sal_id,price)
values('tomato',0002,2031,50);
insert into shop1(veg_name,veg_id,sal_id,price)
values('beans',0003,2032,90);
insert into shop1(veg_name,veg_id,sal_id,price)
values('carot',0004,2033,70);
 insert into shop1(veg_name,veg_id,sal_id,price)
values('drumpstick',0005,2034,100);

SET SQL_SAFE_UPDATES = 0;

alter table shop1 add cus_name varchar(30);
update  shop1 set cus_name='suga' where sal_id =2030;
update  shop1 set cus_name='siva' where sal_id =2031;
update  shop1 set cus_name='agathiya' where sal_id =2032;
update  shop1 set cus_name='devi' where sal_id =2033;
update  shop1 set cus_name='vetha' where sal_id =2034;

select*from shop1;

create table shop2(
veg_name varchar(20),
price int,
veg_id int ,
sal_id int,
cus_name varchar(20));

insert into shop2(veg_name,price,veg_id,sal_id,cus_name)
values('drumpstick',100,0001,101,'durga');
insert into shop2(veg_name,price,veg_id,sal_id,cus_name)
values('onion',30,0002,102,'sathish');

insert into shop2(veg_name,price,veg_id,sal_id,cus_name)
values('tomato',50,0003,103,'shubham');

insert into shop2(veg_name,price,veg_id,sal_id,cus_name)
values('potato',35,0004,104,'nishi');

insert into shop2(veg_name,price,veg_id,sal_id,cus_name)
values('beans',90,0005,105,'siva');

insert into shop2(veg_name,price,veg_id,sal_id,cus_name)
values('carot',70,0006,106,'suga');

select *from shop1;
select *from shop2;

select veg_name as vegtablename from shop1;

select s1.veg_name,s1.veg_id,s1.price,s1.veg_id,s1.sal_id,s1.cus_name,s2.veg_name,s2.price,s2.veg_id,s2.sal_id,s2.cus_name 
from shop1 s1 inner join shop2 s2
on s1.veg_id = s2.veg_id


select s1.veg_name,s1.veg_id,s1.cus_name,s2.veg_name,s2.price,s2.veg_id,s2.cus_name 
from shop1 s1 left join shop2 s2
on s1.veg_name = s2.veg_name

select s1.veg_name,s1.veg_id,s1.price,s1.veg_id,s1.sal_id,s1.cus_name,s2.veg_name,s2.price,s2.veg_id,s2.sal_id,s2.cus_name 
from shop1 s1 right join shop2 s2
on s1.veg_id = s2.veg_id
