create database emp;
use emp;

Create table emp(
id int,
name varchar(200),
dep_id int,
Salary int);

insert into emp value (1,"a",101,500),(2,"b",101,200),(3,"c",102,300),(4,"d",102,200);
 Select * from emp;
 
 insert into emp value(1,"a",101,100);
 
 Select * from emp e1
 where salary <=(
 Select min(Salary) from emp e2
 where e1.dep_id  = e2.dep_id);
 

 