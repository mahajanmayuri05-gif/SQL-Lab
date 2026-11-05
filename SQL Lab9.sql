use bank;

-- 1: Identify Transactions Above the Average Transaction Amount

Select * from transactions
where Amount > 
(Select avg(Amount) from transactions);

-- 2: Identify Accounts with Above-Average Balance

Select AccountID,Accounttype,balance,customerid from accounts
where balance > (
Select avg(balance) from accounts)
order by balance desc;

-- 3: Identify Deposit Accounts Using a Multi-Row Subquery

Select AccountID,Accounttype,balance,customerid  from accounts
where AccountID in(
select AccountID from transactions where Transactiontype = " deposit"
);

-- 4: Identify the Account with the Highest Balance

Select * from accounts
where balance = (
select Max(balance) from Accounts);
