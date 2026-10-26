
-- ** String Function ** 
-- 1. Display customer Table

Select * from customers;

-- 2. Display all customer FirstName in uppercase.

Select firstname,upper(firstname) as New_Name from Customers;

Select upper("hello");

-- 3. Display all customer FirstName in lowercase.d

Select firstname,lower(firstname) as last_name from customers;

-- 4. Find the total number of characters in each customer FirstName

Select length("hello");

-- 5. Display only the first three characters of customer FirstName .

select firstname,left(firstname,3) from customers;

-- 6. Combine customer's FirstName with LastName.

Select concat(firstname," ",lastname) as combine from customers;


-- 7. Display only the last three characters of customer FirstName .

Select firstname, right(firstname,3) from customers;

-- 8. Display only the mid three characters of customer FirstName .

select firstname, mid(firstname,2,3) from customers;

-- 9. display Trim function.

Select upper(  firstname), length(  firstname), trim( firstname),length(trim( firstname)) from customers;

-- Table

Select upper(firstname) as uppercase_Name,  lower(firstname) as lowercase_name, length(firstname) from customers;

-- ** Math Function ** 

Select round(1235.6) ,ceil(1235.6), floor(1235.6), abs(-2356), mod(81,9);

-- ** Date and Time function

-- 1. Display customer Table

Select* from customers;

-- 2. Display the current system date

select current_date();

-- 3. Display the current system date and time.

Select current_date(), now();

-- 4. Display the Birth of year

Select DateofBirth, year(DateofBirth) as Dateofbirth from customers;

-- 5. Display the Birth month

Select DateofBirth, month(DateofBirth) as BirthMonth from customers;

-- 6. Calculate the number of days since BirthDate

select dateofBirth, datediff(Curdate(),dateofbirth) as NumberofDays from customers;

-- 7. Find the latest birth date.

select max(DateofBirth) as Latest_Birthdate from customers;

-- 8. Find the earliest birth date

select min(DateofBirth) as earliest_Birthdate from customers;

-- Practice Quetions

-- 1. Categorize customers as Adult or Young based on their birth year
 
 Select year(DateofBirth) ,
 case
 when year(DateofBirth)>1998 then "Young"
  when year(DateofBirth)<=1998 then "Adult" end as type from customers;


-- 2. Display 'Not Available' if a phone number is NULL

Select ifnull(Phone,"Not Available") from customers;

 
-- 3. Compare two customer names

Select * from customers where FirstName in ('Rahul','Priya');
 
-- 4. Calculate the total balance maintained across all customer accounts.

select * from accounts;

select sum(balance) as Total_balance from accounts;
 
-- 5. Calculate the average balance maintained across all customer accounts to understand the typical amount held by customers.
Select avg(balance) as AVG_balance from accounts;
 
-- 6. Identify the highest balance maintained in any customer account.

select max(balance) as Highest_balance from accounts;
 
-- 7. Identify the lowest balance maintained in any customer account

Select min(balance) as Lowest_balance from accounts;
 
-- 8. Determine the total number of customer accounts available in the system.

Select count(*) from accounts;

-- 9. The bank wants to calculate the total account balance for each AccountType by grouping the records based on AccountType and identify which account type is attracting the highest total deposits from customers.

Select AccountType, sum(Balance) as Total_balance from accounts group by AccountType;
 
-- 10. The bank management wants to identify only those account types whose total customer deposits exceed ₹25,000.

Select Accounttype, sum(Balance) as Total_balance from accounts group by Accounttype having  sum(balance)>25000;
