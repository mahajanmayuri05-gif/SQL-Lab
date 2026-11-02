Create database xyz;

use xyz;

-- self join.

Create table Manger(
id int,
Name varchar(100),
M_ID int);

insert into Manger values( 1,"abc",1),(2,"xyz",null),(3,"kgf",2),(4,"mno",1),(5,"pqr",1);
Select m1.name, m2.name as Manger_name from Manger M1
left join Manger M2
on M1.M_ID = M2.M_ID;


