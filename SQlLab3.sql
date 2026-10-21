create database bank;
use bank;

create table accounts(
AccountID int,
Accounttype varchar(20),
balance float);

create table transactions(
TransactionID int,
TransactionDate date,
Amount float,
Transactiontype varchar(20));

create table branches(
BranchId int,
BranchName varchar(100),
Branchaddress varchar(200),
BranchPhone varchar(15));

create table accountbranches(
AssignmentDate date);

create table loans(
LoanId int,
LoanAmount float,
InterestRate float,
StartDate date,
EndDate date);

create table customers(
CustomerId int,
FirstName varchar(20),
LastName varchar(20),
Email varchar(100),
Phone varchar(20),
DateofBirth date);

select * from accounts;
select * from transactions;
select * from branches;
select * from accountbranches;
select * from loans;
select * from customers;

alter table accounts add constraint ck check(balance >= 1000);

drop table accountbranches;

alter table customers add constraint p primary key(CustomerId);
alter table customers modify FirstName varchar(20) not null;
alter table customers add constraint u unique(Email);

alter table accounts add customerid int;
alter table accounts drop customerid;
alter table accounts add constraint fk_a foreign key (customerid) references customers(CustomerId);

insert into customers value(101,"Rahul","Sharma","rahul.sharma@gmail.com","9999999999","1998-04-15");
insert into customers value(102,"Priya","Patil","priya@gmail.com","9988776655","200-09-20");
insert into customers value(103,"Amit","Patel","amit.patel@gmail.com","9876500001","1995-06-18");
insert into customers value(104,"Sneha","Joshi","Sneha.joshi@gmail.com","9876500002","1997-09-12");
insert into customers value(105,"Rohan","Kulkarni","rohan.k@gmail.com","9876500003","1993-11-25");

insert into loans value(301,500000.00,8.50,"2025-01-15","2030-01-15",101);
insert into loans value(302,300000.00,9.25,"2025-02-10","2028-02-10",102);
insert into loans value(303,750000.00,8.75,"2025-03-20","2032-03-20",103);
insert into loans value(304,250000.00,10.00,"2025-04-05","2029-04-05",104);
insert into loans value(305,1000000.00,7.95,"2025-05-12","2035-05-12",105);

insert into accounts value(201,"Savings",25000.00,101,default);
insert into accounts value(202,"Current",40000.00,102,default);
insert into accounts value(203,"Savings",35000.00,103,default);
insert into accounts value(204,"Current",60000.00,104,default);
insert into accounts value(205,"Savings",45000.00,105,default);

insert into transactions value(301,"2025-05-10",5000.00,"Deposit",201);
insert into transactions value(302,"2025-05-11",2500.00,"Withdraw",202);
insert into transactions value(303,"2025-05-12",10000.00,"Deposit",203);
insert into transactions value(304,"2025-05-13",3000.00,"Withdraw",204);
insert into transactions value(305,"2025-05-14",7000.00,"Deposit",205);

insert into branches value(1,"Mumbai Branch","Andheri,Mumbai",0221111111);
insert into branches value(2,"Pune Branch","Shivaji Nagar,Pune",0202222222);
insert into branches value(3,"Nashik Branch","College road,Nashik",0253222222);
insert into branches value(4,"Nagpur Branch","Sitabuldi,Nagpur",0712333333);
insert into branches value(5,"Navi Mumbai Branch","Vashi,Navi Mumbai",022444444);

update customers set phone="888888888" where CustomerId=101;
update customers set Email="rahul_Sharma@gmail.com" where CustomerID=101;
update accounts set balance='30000.00' where AccountId=201;

Delete from transactions where TransactionID=302;
Delete from accounts where AccountID=202;









