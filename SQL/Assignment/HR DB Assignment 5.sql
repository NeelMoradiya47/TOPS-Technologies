USE HR;

SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM locations;

-- 1. Write a query to display the last name and hire date of any employee in the same department as SALES. 
SELECT	e.last_name, e.hire_date FROM employees e JOIN departments d ON e.department_id = d.department_id WHERE d.department_name = 'Sales';


-- 2. Create a query to display the employee numbers and last names of all employees who earn more than the average salary. 
-- Sort the results in ascending order of salary. 
SELECT employee_id, last_name FROM employees WHERE salary > (SELECT AVG(salary) FROM employees) ORDER BY salary;


-- 3. Write a query that displays the employee numbers and last names of all employees who work in a department with any employee whose last name contains a' u 
SELECT employee_id, last_name FROM employees WHERE department_id IN (SELECT department_id FROM employees WHERE last_name LIKE '%u%');


-- 4. Display the last name, department number, and job ID of all employees whose department location is ATLANTA. 
SELECT e.last_name, e.department_id, e.job_id 
FROM employees e JOIN departments d ON d.department_id = e.department_id JOIN locations l ON d.location_id = l.location_id
WHERE l.city='Atlanta';


-- 6. Display the department number, last name, and job ID for every employee in the OPERATIONS department. 
SELECT e.department_id,e.last_name,e.job_id 
FROM employees e JOIN departments d ON e.department_id=d.department_id
WHERE d.department_name = "Operations";


-- 7. Modify the above query to display the employee numbers, last names, and salaries of all employees who earn more than the average salary 
-- and who work in a department with any employee with a 'u'in their name. 
SELECT	employee_id, last_name, salary FROM employees WHERE salary > (SELECT AVG(salary) FROM employees) AND CONCAT(first_name,last_name) LIKE '%u%'; 


-- 8. Display the names of all employees whose job title is the same as anyone in the sales dept. 
SELECT	CONCAT(e.first_name," ",e.last_name) AS "Employee Name", j.job_title
FROM employees e JOIN jobs j ON j.job_id = e.job_id
WHERE job_title like "%sales%";


-- 9. Write a compound query to produce a list of employees showing raise percentages, employee IDs, and salaries. Employees in department 1 and 3 are given a 5% raise, 
-- employees in department 2 are given a 10% raise, employees in departments 4 and 5 are given a 15% raise, and employees in department 6 are not given a raise. 
SELECT employee_id,salary,
    CASE
		WHEN department_id IN (1,3) THEN salary*1.05
		WHEN department_id= 2 THEN salary*1.10
		WHEN department_id IN (4,5) THEN salary*1.15
		WHEN department_id= 6 THEN salary
     ELSE salary
	END AS raise_percentage
FROM employees;


-- 10. Write a query to display the top three earners in the EMPLOYEES table. Display their last names and salaries. 
SELECT last_name, salary FROM employees ORDER BY salary DESC LIMIT 3;


-- 11. Display the names of all employees with their salary and commission earned. Employees with a null commission should have O in the commission column 
SELECT CONCAT(first_name," ",last_name) AS "Employee Name", salary, ifnull(commission_pct,0) AS commission FROM employees;


-- 12. Display the Managers (name) with top three salaries along with their salaries and department information.
SELECT CONCAT(e.first_name," ",e.last_name) AS "Manager Name", e.salary, d.department_name 
FROM  employees e JOIN departments d ON e.department_id=d.department_id
WHERE e.job_id LIKE "%MGR" ORDER BY salary DESC LIMIT 3;

