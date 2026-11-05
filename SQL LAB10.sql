use bank;

select * from accounts;
select * from transactions;
select * from branches;
select * from accountbranches;
select * from loans;
select * from customers;

-- 1 -- Create a View for High-Balance Accounts
create view high_balance as 
select * from accounts where balance > 30000;
-- 2 -- Retrieve Data Using the View 
select * from high_balance;
-- 3 -- Modify the View to Include Transaction Details
create or replace view new_transaction_details as 
select a.AccountID, a.AccountType, a.Balance, a.CustomerID, t.TransactionID, t.TransactionDate, t.TransactionType, t.Amount from accounts a inner join transactions t on a.AccountID = t.Accountid where a.balance > 30000;
select * from new_transaction_details;
-- 4 -- Generate Banking Reports Using the View
select AccountID, AccountType, Balance, CustomerID, TransactionID, TransactionDate, TransactionType, Amount from new_transaction_details order by balance desc;

