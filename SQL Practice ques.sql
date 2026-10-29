Create database T2;
use T2;

Create table employees(
emp_id int,
emp_name varchar(200),
dept varchar(200),
city varchar(200),
salary float,
hire_date date,
manger_id  int);

Select * from employees;

insert into employees value (1,"Aarav Shah","IT","Pune",72000,"2021-03-15",null),(2,"Sneha rao","HR","Mumbai",48000,"2022-07-1",1),(3,"Karan Mehta","Sales","Delhi",55000,"2023-01-10",1),(4,"Priya Nair","IT","Pune",64000,"2020-11-23",1),(5,"Ramesh Iyer","Fiance","Mumbai",59000,"2019-05-30",null),(6,"Anita Desai","Sales","Pune",41000,"2024-02-12",3);


-- 1.List emp_name and salary of all
-- employees who work in the IT department.

select emp_name,salary from employees where dept="IT";

-- 2. Show all employees who earn more than 50000 and live in Pune.

select * from employees where  salary>50000 and city="Pune";

-- 3. Find employees hired between 2022-01-01 and 2023-12-31.

Select * from employees where hire_date between '2022-01-01' and '2023-12-31';

-- 4. Show employees from Pune, Mumbai or Delhi who have no manager assigned.

Select * from employees where city in ('Pune','Mumbai','Delhi') and manger_id is null;

-- 5. Show the names of employees that start with the letter 'A'.

Select * from employees where emp_name like "A%";

-- 6. Show the names of employees that end with 'sh'.

Select * from employees where emp_name like "%sh";

-- 7. Find employees whose name contains 'an' anywhere.

Select * from employees where emp_name like "%an%";

-- 8. Find names that are exactly 5 characters long with 'a' as the second letter.

Select * from employees where emp_name like '_a___';

-- 9. Count the number of employees in each department.

Select dept, count(*) as total_employee from employees group by dept;

-- 10. Find the average salary for each city.

select city, Avg(Salary) as Avg_Salary from employees group by city;

-- 11. For each department show the total salary and the highest salary.

Select dept, Sum(Salary) as Total_Salary, Max(Salary) as Highest_Salary from employees group by dept;

-- 12. Count employees for each dept and city combination, only for salary above 30000.

Select dept, city, Count(*) as total_employee from employees where salary>30000 group by dept,city;

-- 13. Show departments that have more than employees.

Select dept, count(*) as total_employee from employees group by dept having count(*)>3;

-- 14. Show cities where the average salary is above 60000.

Select city, Avg(salary) as Average_Salary from employees group by city having Avg(Salary)>60000;

-- 15. Show departments whose total salary payout is between 200000 and 500000.

select dept, Sum(salary) as total_salary from employees group by dept having sum(salary) between 200000 and 500000;


-- 16. Excluding HR, show departments with average salary above 45000, highest average first.

SELECT dept, AVG(salary) AS average_salary
FROM employees
WHERE dept <> 'HR'
GROUP BY dept
HAVING AVG(salary) > 45000
ORDER BY average_salary DESC;



-- 17. Show the 5 highest-paid employees.
SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 5;



-- 18. Show the 3 most recently hired employees.
SELECT *
FROM employees
ORDER BY hire_date DESC
LIMIT 3;


-- 19. Skip the 5 highest-paid employees and show the next 5 (page 2).
SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 5 OFFSET 5;



-- 20.Find the third highest distinct salary using LIMIT and OFFSET.
SELECT DISTINCT salary
FROM employees
ORDER BY salary DESC
LIMIT 1 OFFSET 2;


-- 21. Among employees whose name starts with 'S', show the top 3 cities by headcount.
SELECT city, COUNT(*) AS headcount
FROM employees
WHERE emp_name LIKE 'S%'
GROUP BY city
ORDER BY headcount DESC
LIMIT 3;


-- 22. Show page 3 (10 rows per page) of Pune employees sorted by name.

SELECT *
FROM employees
WHERE city = 'Pune'
ORDER BY emp_name ASC
LIMIT 10 OFFSET 20;

-- 23. For hires after 2021, find depts with more than 2 employees. Rank by average salary (high to low), skip the first and show the
-- next 2.
SELECT dept, COUNT(*) AS total_employees,
       AVG(salary) AS average_salary
FROM employees
WHERE hire_date >= '2022-01-01'
GROUP BY dept
HAVING COUNT(*) > 2
ORDER BY average_salary DESC
LIMIT 2 OFFSET 1;



-- 24. Find cities where at least 2 employee names contain 'ar'. Show the top 3 by count.
SELECT city, COUNT(*) AS total_employees
FROM employees
WHERE emp_name LIKE '%ar%'
GROUP BY city
HAVING COUNT(*) >= 2
ORDER BY total_employees DESC
LIMIT 3;