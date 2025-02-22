USE HR;
SELECT * FROM departments;
SELECT * FROM employees;
-- 1) Display the maximum, minimum and average salary and commission earned.
SELECT MAX(salary), MIN(salary), AVG(salary), SUM(salary +(salary*commission_pct)) AS "Total commission" FROM employees;


-- 2) Display the department number, total salary payout and total commission payout for each department.
SELECT department_id, SUM(salary) AS "Total Salary Payout", SUM(salary +(salary*commission_pct)) AS "Total commission Payout" FROM employees GROUP BY department_id;


-- 3) Display the department number and number of employees in each department.
SELECT department_id, COUNT(employee_id) FROM employees GROUP BY department_id;


-- 4) Display the department number and total salary of employees in each department.
SELECT department_id, SUM(salary) AS "Total Salary" FROM employees GROUP BY department_id;


-- 5) Display the employee's name who doesn't earn a commission. Order the result set without using the column name
SELECT CONCAT(first_name," ",last_name) AS Employee_Name FROM employees WHERE commission_pct IS NULL;


/* 6) Display the employees name, department id and commission. If an Employee doesn't earn the commission, then display as 'No commission'. 
	  Name the columns appropriately */
SELECT CONCAT(first_name," ",last_name) AS Employee_Name, department_id, IF(commission_pct IS NULL, 'No commission', commission_pct) AS Commission FROM employees;

      
/* 7) Display the employee's name, salary and commission multiplied by 2. If an Employee doesn't earn the commission, then display as 'No commission. 
	  Name the columns appropriately */
	SELECT CONCAT(first_name," ",last_name) AS Employee_Name, salary, IF(commission_pct IS NULL, 'No commission', commission_pct*2) AS Commission FROM employees;

      
-- 8) Display the employee's name, department id who have the first name same as another employee in the same department
SELECT CONCAT(e1.first_name," ",e1.last_name) AS Employee_Name, e1.department_id FROM employees e1 
WHERE e1.first_name NOT IN (SELECT DISTINCT first_name FROM employees e2 WHERE e1.department_id = e2.department_id GROUP BY first_name);


-- 9) Display the sum of salaries of the employees working under each Manager.
SELECT manager_id, SUM(salary) FROM employees GROUP BY manager_id;


-- 10) Select the Managers name, the count of employees working under and the department ID of the manager.
SELECT manager_id, COUNT(employee_id), department_id FROM employees GROUP BY manager_id, department_id;


-- 11) Select the employee name, department id, and the salary. Group the result with the manager name and the employee last name should have second letter 'a!
SELECT first_name,last_name AS Employee_Name, department_id, salary FROM employees WHERE last_name LIKE "_a%";


-- 12) Display the average of sum of the salaries and group the result with the department id. Order the result with the department id.
SELECT department_id, AVG(salary) FROM employees GROUP BY department_id ORDER BY department_id;


-- 13) Select the maximum salary of each department along with the department id
SELECT department_id, MAX(salary) FROM employees GROUP BY department_id;


-- 14) Display the commission, if not null display 10% of salary, if null display a default value 1
SELECT IF(commission_pct IS NULL, 1 , salary * 0.1) AS Commission FROM employees;

