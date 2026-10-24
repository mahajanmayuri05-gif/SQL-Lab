Use bank;

-- Q: 1.Retrieve only the following details from the Accounts table: AccountID, AccountType, and Balance.

Select AccountID, AccountType, Balance from accounts;

-- 2.Retrieve Customers with Savings Accounts.

Select * from accounts where Accounttype ='Savings';

-- 3. Retrieve Accounts with Balance Greater Than 25000

Select * from accounts where balance>25000;

-- 4. Retrieve Transactions Between Specific Amounts 5000 -20000

select * from transactions where Amount between 5000 and 20000;

-- 5. Retrieve Records for Selected Customers 101,102,103,104

Select * from customers where CustomerId between 101 and 104;

-- 6. This displays customers whose names start with the letter R.

Select * from customers where FirstName like "R%";

-- 7. Retrieve all current account records.

Select * from accounts where Accounttype = 'Current';

-- 8. Find accounts with balance less than 15000.

Select * from accounts where balance<15000;

-- 9. Display transactions between 1000 and 10000

Select * from transactions where Amount between 1000 and 10000;

-- 10.  Retrieve customer records for CustomerID 104 and 105
-- 11.  Display customers whose last name starts with S

Select * from customers where CustomerId between 104 and 105;

Select * from customers where LastName like "S%";

-- 12. Display Customers in Alphabetical Order

Select * from customers order by LastName asc;

-- 13. Display Accounts with Highest Balance First

Select * from accounts order by balance desc;

-- 14. Retrieve Unique Account Types

Select Accounttype from accounts group by Accounttype;

-- 15. Display Top 3 Highest Balance Accounts

Select * from accounts order by balance desc limit 3;

-- 16. Skip Initial Records While Viewing Transactions

Select * from transactions limit 1 offset 3;

-- 17. Display customers sorted by LastName

Select * from customers order by LastName ASC;

-- 18.Retrieve top 5 transactions with highest amount

Select * from transactions order by Amount desc limit 5;

-- 19.Display unique transaction types

Select transactiontype from transactions group by Transactiontype;

-- 20. Skip the first 3 transaction records and display the next 4 records
 
 Select * from transactions limit 4 offset 3;
 
 -- 21. Find Customers Without Phone Numbers
 
 Select * from customers where Phone is null;
 
 -- 22. Find Customers Having Email Addresses
 
 Select * from customers where Email is Not null;
 
 -- 23. Find customers without email addresses
 Select * from customers where Email is null;
 
 -- 24.  Display all accounts where balance information is available
 select * from accounts where balance is not null;
 
 -- 25. Search Customers Whose First Name Starts with “A”.
-- 26. Search Customers Whose Email Contains “gmail”
-- 27. Search Customers Whose Last Name Ends with “kar”

select * from customers Where FirstName like "A%";
select * from customers Where Email like"%gmail%";
select * from customers Where LastName like "%kar";

-- 28. Display customers whose first name starts with R
-- 29. Find customers whose email contains yahoo
-- 30. Display customers whose last name starts with P
-- 31.Search customers whose phone number ends with 99

select * from customers Where FirstName like "R%";
select * from customers Where Email like"%yahoo%";
select * from customers Where LastName like "P%";
select * from customers Where Phone like "%99";

-- 32. The finance team wants to review only Savings and Current account holders.
-- 33. The audit department wants to investigate only Deposit and Withdrawal transactions.
-- 34. The customer relationship team wants to review records for a specific set of customers. 101,102,105

Select * from accounts where AccountType = 'saving' or AccountType = 'Current';
Select * from transactions where TransactionType = "Deposit" or TransactionType = "Withdraw";
Select * from customers where Customerid in ('101','102','105');

-- 35. Display accounts belonging to Salary and Savings account types
-- 36.  Retrieve transactions for Payment and Deposit categories
-- 37. Display customer records for CustomerID 103 and 104
-- 38. Retrieve selected account records using AccountID values

Select * from accounts where Accountype in ( 'Salary','Current');
Select * from transactions where Transactiontype in ( 'Payment','Deposit');
Select * from customers where Customerid in ('103','104');
Select * from accounts  where AccountID in(101,102,105);


-- 39. Display Customers in Ascending Order of Last Name
-- 40. Display Accounts with Highest Balance First
-- 41.Display Transactions Sorted by Transaction Date

Select * from customers order by LastName ASC;
Select * from accounts order by balance desc;
Select * from transactions order by TransactionDate desc;

-- 42.  Display customers sorted by FirstName
-- 43. Display accounts sorted by ASc;
-- 44.  Display transactions sorted by Amount in descending order
-- 45.  Display customers sorted by DateOfBirth

Select * from customers order by FirstName ASC;
Select * from accounts order by AccountType ASC;
Select * from transactions order by Amount Desc;
Select * from customers order by DateofBirth Desc;

-- 46. Display Only Top 5 Highest Balance Accounts
-- 47.Display First 3 Customer Records
-- 48. Skip Initial Transaction Records 3 While Viewing Data record 2
 
Select * from accounts order by balance desc limit 5;
Select * from Customers limit 3;
Select * from transactions limit 2 offset 3;

-- 49.  Display top 3 transactions with highest amount
-- 50. Retrieve only 4 customer records
-- 51. Skip first 2 account records and display next 3 records
-- 52. Display top 5 latest transactions

Select * from transactions  order by balance desc limit 3;
Select * from customers Where CustomerId between 101 and 104;
Select * from accounts limit 3 offset 2;
Select * from transactions order by Amount desc limit 5;


-- 53. Display Savings Account Customers Sorted by Balance
-- Categorize Accounts Using Balance
-- Balance >50000 then premium account
-- Balance >2500 then standar account
 
-- 55.  High Transaction
--    · Medium Transaction
--    · Low Transaction
--    based on transaction amount.

Select AccountID, balance, case when balance >50000 then "premium account"when balance >25000 then "standard account" end from accounts;

Select Amount, case when amount >50000 then "High" when Amount >30000 then "medium" when Amount >=10000 then "Low" end from transactions;






 





















