

-- 1. Count the number of employees in each department
-- This query is to give count of employees in each dept
SELECT department_id, COUNT(*) AS total_employees
FROM employees
GROUP BY department_id;

-- 2. Find the average salary in each department
-- This Query is to give count of employyes in each dept
SELECT department_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id;

-- 3. Find the maximum and minimum salary in each department
-- This Query is to give max salary and min salary of emp in each dept
SELECT department_id, MAX(salary) AS max_salary, MIN(salary) AS min_salary
FROM employees
GROUP BY department_id;

-- 4. Find the total salary paid in each department
-- This query is to give sum of all emp in each dept
SELECT department_id, SUM(salary) AS total_salary
FROM employees
GROUP BY department_id;

-- 5. Count the number of employees in each job role
-- This Query is to give emp details in each job role 
SELECT job_id, COUNT(*) AS total_employees
FROM employees
GROUP BY job_id;

-- 6. Find the average salary for each job role
-- This Query is to give avg salary of each job role
SELECT job_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY job_id;

-- 7. Find the maximum salary for each job role
-- This Query is to give max salary of emp's in each job role
SELECT job_id, MAX(salary) AS max_salary
FROM employees
GROUP BY job_id;

-- 8. Find the minimum salary for each job role
-- This query is to give min salary of emp's in each job role.
SELECT job_id, MIN(salary) AS min_salary
FROM employees
GROUP BY job_id;

-- 9. Find the total salary paid for each job role
-- This query is to give emp salary each job role.
SELECT job_id, SUM(salary) AS total_salary
FROM employees
GROUP BY job_id;

-- 10. Count the number of employees hired in each year
-- This query is to extracts the year from the hire_date and counts emp hired in each year.
SELECT EXTRACT(YEAR FROM hire_date) AS hire_year, COUNT(*) AS total_employees
FROM employees
GROUP BY EXTRACT(YEAR FROM hire_date)
ORDER BY hire_year;

-- 11. Find the total salary paid in each location
-- This query is to give total salary  by joining emp's with each dept locations.
SELECT d.location_id, SUM(e.salary) AS total_salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.location_id;

-- 12. Find the number of employees in each manager's team
-- This query is to give all the mgr details with team size
SELECT manager_id, COUNT(*) AS team_size
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id;

-- 13. Find the highest salary for each manager
-- This query is to give max salary of mgr's
SELECT manager_id, MAX(salary) AS max_salary
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id;

-- 14. Find the average salary for each manager's team
-- This query is to giuve avg salary of emp's with team size
SELECT manager_id, AVG(salary) AS avg_salary
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id;

-- 15. Count the number of employees hired in each month of the year
-- This query is to extracts the month from hire_date and employees details hired in each month.
SELECT EXTRACT(MONTH FROM hire_date) AS hire_month, COUNT(*) AS total_hired
FROM employees
GROUP BY EXTRACT(MONTH FROM hire_date)
ORDER BY hire_month;

-- 16. Find the department with the highest total salary
-- This query is to gives the dept details wuith total salary
SELECT department_id, SUM(salary) AS total_salary
FROM employees
GROUP BY department_id
ORDER BY total_salary;

-- 17. Find the job role with the highest average salary
-- This query is to give the job role with highest average salary
SELECT job_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY job_id
ORDER BY avg_salary DESC;

-- 18. Find the number of employees in each city
-- This query is to give emp details with locations using joins
SELECT l.city, COUNT(*) AS total_employees
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
GROUP BY l.city;

-- 19. Find the number of employees who have a commission, grouped by departmen
-- This query is to give emp deatils having comm  
SELECT department_id, COUNT(*) AS employees_with_commission
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY department_id;

-- 20. Find the sum of salaries for employees who have a commission, grouped by department
-- This query is to give emp details with comm  
SELECT department_id, SUM(salary) AS total_salary_with_commission
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY department_id;



 --#Oracle SQL Aggregation Questions for Sales History Table

--select * from sh.SALES

-- 1. Count the number of sales transactions for each product.
--This Query is to counts the sales transaction of each product in descending order
 select prod_id,COUNT(*) as transaction_count 
 from sh.sales 
 Group by prod_id
 order by transaction_count desc;

 2. Find the average sale amount for each product. 
 --This Query is to gives the avg sale amount of each product
 select PROD_ID, avg(amount_sold) as avg_sales_amt
 from SH.SALES
 group by PROD_ID;

 -- 3. Find the maximum and minimum sale amount for each product.
 --This Query gives max and min sales amount for each product
  select PROD_ID, max(amount_sold) as max_amt, min(amount_sold) as min_amt
 from sh.sales
 group by PROD_ID;
 -- 4. Find the total revenue generated by each product.
 -- This Query gives total sum of the products
 select PROD_ID, sum(quantity_sold * amount_sold) as total_revenue 
 from sh.SALES
 group by PROD_ID;

 -- 5. Count the number of sales transactions for each customer.
 --This Query counts the sales transactions of each customer
 select cust_id, count(*) as Total_Transactions
 from sh.SALES
 group by cust_ID;

 -- 6. Find the average sale amount per customer.
 -- This Query give avg sales amount per customers
 select cust_id, avg(amount_sold) as avg_sales_amt
 from sh.SALES
 group by cust_id;

 -- 7. Find the highest purchase amount for each customer.  
 --This Query give highest purchase amount for each customer
 select cust_id, max(amount_sold) as highest_purchase_amt
 from sh.SALES
 group by CUST_ID;
 
 -- 8. Find the lowest purchase amount for each customer. 
 -- This Query gives lowest purchase amount for each customer
 select cust_id, min(amount_sold) as lowest_purchase_amt
 from sh.SALES
 group by CUST_ID;

------------------------------------
ANALYTICAL FUNCTIONS:
------------------------------------

 --6. Assign a rank to employees based on their salary within each department.
 -- This Query is to assign the rank to emp's based on their salary's in each dept
 SELECT department_id, employee_id, salary,
 RANK () OVER (PARTITION by department_id order by salary DESC) as salary_rank
 --from hr.EMPLOYEES;

 --7.Find the top 3 highest-paid employees in each department
 -- This Query is to get the top highest salary from each dept using rank()
 Select department_id, employee_id, salary
 FROM(
    SELECT department_id, employee_id, salary,
    RANK () OVER (PARTITION by department_id order by salary DESC) as salary_rank
    from hr.employees
 ) where salary_rank<=3; 

 -- 8. Identify the second highest salary in each department using DENSE_RANK().
-- This Query is to get the second highest salary in each dept using dense_rank
SELECT department_id, employee_id, salary, 
from (
select department_id, employee_id, salary,
DENSE_RANK() OVER (PARTITION by department_id order by salary desc) as salary_rank
from hr.employees 
) where salary_rank=2;

--9. Compute the cumulative total salary of employees ordered by hire date.
-- This Query is to sum, over the salary of emp's and oder by hire_date
select employee_id, hire_date, salary
sum (salary) OVER (order by hire_date) as cummulative_salary
from hr.employees;

--10. Assign a row number to each employee in each department.
-- This Query is to assign rownum to each emp's using partitions
select department_id, employee_id,
Row_number () OVER (PARTITIONby department_id order by employee_id) as rownum
from hr.employees;

--11. Find the salary difference between each employee and the next highest-paid employee.
-- This query is to get the next highest sal using lead()
select employee_id, salary,
lead(salary) OVER (order by salary DESC)- salary as diff_salary
from hr.employees;

--12. Calculate the previous month’s salary for each employee using LAG().
-- This Query is to get the next prev highest salary using lag()
SELECT employee_id,salary, hire_date,
lag(salary) OVER (PARTITION by employee_id order by hire_date) as prev_salary
from hr.EMPLOYEES;

--13. Identify employees whose salaries increased over time.
-- This query is to get the salary's increases of emp's using lead() and lag()
select employee_id, hire_date, salary,
lag(salary) over (PARTITIONby employee_id order by hire_date) as prev_salary
case when salary > LAG(salary) over (PARTITION by employee_id order by hire_date) 
then 'Increased' else 'Decreased' End as salary_trend
from employees;


