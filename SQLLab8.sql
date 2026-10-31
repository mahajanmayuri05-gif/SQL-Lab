use bank;

select * from accounts;
Select * from transactions;

-- 1: Generate Accounts Transaction Reports

Select a.AccountID, a.Accounttype, a.balance, t.TransactionID, t.TransactionDate, t.Amount, t.Transactiontype from accounts a
inner join transactions t
on a.AccountID = t.AccountID;

--  2: Display All Accounts Including Those Without Transactions
Select a.AccountID, a.Accounttype, a.balance, t.TransactionID, t.TransactionDate, t.Amount, t.Transactiontype from accounts a
Left join transactions t
on a.AccountID = t.AccountID;

-- 3: Generate Deposit Transaction Reports
Select a.AccountID, a.Accounttype, a.balance, t.TransactionID, t.TransactionDate, t.Amount, t.Transactiontype from accounts a
inner join transactions t
on a.AccountID = t.AccountID
where Transactiontype = "Deposit";



-- 4. Generate High Balance Account Transaction Reports

Select a.AccountID, a.Accounttype, a.balance, t.TransactionID, t.TransactionDate, t.Amount, t.Transactiontype from accounts a
inner join transactions t
on a.AccountID = t.AccountID
Where a.balance >3000
order by balance desc;