

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

-----------------------------------
######## JOINS ##################
-----------------------------------
--1. Retrieve employee names and their department names using INNER JOIN
--  This Query is to give the emp details using inner join with dept table

-- select employees.first_name, employees.last_name, departments.department_name
-- from hr.EMPLOYEES
-- inner join hr.DEPARTMENTS
-- on employees.department_id = departments.department_id;

 --2.  Retrieve all employees and their respective department names (including those without a department) using LEFT JOIN
-- This Query is to give all details of emp using left join with emp and dept table

-- select employees.first_name, employees.last_name, departments.department_name
-- from hr.EMPLOYEES
-- LEFT join hr.departments 
-- on employees.department_id = departments.department_id;

-- 3. Retrieve all departments and employees (including departments without employees) using RIGHT JOIN
-- This query is to give all the emp details using right join with  dept table

-- select employees.first_name, employees.last_name, departments.department_name
-- from hr.EMPLOYEES
-- right join hr.DEPARTMENTS
-- on employees.department_id = departments.department_id;

 --4.  Retrieve all employees and their department names using FULL OUTER JOIN
-- This Query is to give all details of emp's using full outer join

-- select employees.first_name,employees.last_name, departments.department_id
-- from hr.EMPLOYEES
-- full OUTER JOIN hr.DEPARTMENTS
-- on employees.department_id = departments.department_id;

-- 5. Retrieve employees who do not belong to any department using LEFT JOIN with NULL check
-- This Query is to give all the emp details who's not belong to any dept using left join with null checks

-- select employees.first_name, employees.last_name
-- from hr.EMPLOYEES
-- LEFT join hr.departments 
-- on employees.department_id = departments.department_id
-- where departments.department_id IS NULL;  

-- 6. Retrieve departments that have no employees using RIGHT JOIN with NULL check
-- This Query give is to emp details who's ID's having using right join

-- select departments.department_id, departments.department_name 
-- from hr.employees
-- right join hr.departments 
-- on employees.department_id = departments.department_id
-- where employees.employee_id is null; 

-- 7. Retrieve employees along with their manager names using SELF JOIN
-- This Query is to give emp details with their mgr's using self join

-- select e1.employee_id,e1.first_name employee_name,e2.first_name  manager_name
-- from hr.employees e1 
-- join hr.employees e2 
-- on e1.manager_id = e2.employee_id; 

--8. Retrieve employees along with their job title using INNER JOIN
-- This query is to give emp details with their job title using inner join

-- select employees.employee_id, employees.first_name, jobs.job_title
-- from hr.employees
-- join hr.jobs
-- on employees.job_id = jobs.job_id; 

--9.  Retrieve employees along with the location of their department using INNER JOIN
-- This Query is to give emp details with location using dept using inner join

-- select employees.employee_id, employees.first_name, departments.department_name, locations.city
-- from hr.EMPLOYEES
-- join hr.departments 
-- on employees.department_id = departments.department_id
-- join hr.locations 
-- on departments.location_id = locations.location_id;

-- 10. Retrieve employees who earn more than their department’s average salary using INNER JOIN and a subquery
-- This Query is to give emp details who's gettig more salary than dept avg salary using inner join

-- select employees.employee_id, employees.first_name, employees.salary
-- from hr.EMPLOYEES
-- join hr.DEPARTMENTS
-- on employees.department_id = departments.department_id
-- where employees.salary>(select avg(salary) from hr.employees where department_id = employees.department_id);

--11. retrieve employees who have the same job role as another employee using SELF JOIN
-- This Query is to give the emp details who's having same job role using self join

-- select e1.employee_id,e1.FIRST_NAME,e1.job_id,e2.FIRST_NAME co_worker_name
-- from hr.employees e1
-- join hr.employees e2
-- on e1.job_id = e2.job_id
-- where e1.employee_id<>e2.EMPLOYEE_ID;

--12. Retrieve employees and their department names, but show "Not Assigned" if an employee has no department using LEFT JOIN and COALESCE
-- This Query is to give emp details and deot names shows as not assigned using coalesce and left join

-- select employees.employee_id, employees.first_name, coalesce(departmets.department_name,'not assigned') department_name
-- from hr.employees
-- left join hr.DEPARTMENTS
-- on employees.department_id = departments.department_id; 

--13.  Retrieve employees who work in a city where their department is located using INNER JOIN
-- This Query is to give emp details who's working in a city using inner join with dept

-- select employees.employee_id, employees.first_name, locations.city
-- from hr.EMPLOYEES
-- join hr.departments 
-- on employees.department_id = departments.department_id
-- join hr.locations  
-- on departments.location_id = locations.location_id;

-- 14. retrieves employees and their department names where employees belong to a specific region using INNER JOIN
-- This Query is to give emp details with dept names, emp's belong to specific region using inner join

-- select e.emloyee_id,e.first_name,d.department_name,r.region_name
-- from hr.employees e
-- join hr.departments d
-- on e.DEPARTMENT_ID = d.DEPARTMENT_ID
-- join hr.locations l
-- on d.LOCATION_ID = l.LOCATION_ID
-- join hr.COUNTRIES c 
-- on l.COUNTRY_ID = c.COUNTRY_ID
-- join hr.REGIONS r
-- on c.REGION_ID = r.REGION_ID;

-- 15. Retrieve departments and the count of employees in each department using INNER JOIN and GROUP BY
-- This Query is to give count of emp's in each dept using inner join 

-- select departments.department_id, departments.department_name, COUNT(employees.employee_id) employee_count
-- from hr.departments
-- left JOIN hr.employees 
-- on departments.department_id = employees.department_id
-- group by departments.department_id, departments.department_name;

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


