USE HR;

SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM locations;

-- 1. Write a query to display the last name, department number, department name for all employees.
SELECT e.last_name, e.department_id, d.department_name FROM employees e JOIN departments d ON e.department_id = d.department_id;


-- 2. Create a unique list of all jobs that are in department 4. Include the location of the department in the output.
SELECT	e.job_id, d.department_name, l.city AS location 
FROM departments d JOIN employees e ON d.department_id = e.department_id JOIN locations l ON d.location_id = l.location_id 
WHERE d.department_id = '4';


-- 3. Write a query to display the employee last name,department name,location id and city of all employees who earn commission.
SELECT	e.last_name, d.department_name, d.location_id, l.city 
FROM employees e JOIN departments d ON d.department_id = e.department_id JOIN locations l ON d.location_id = l.location_id 
WHERE e.commission_pct is not null;


-- 4. Display the employee last name and department name of all employees who have an 'a' in their last name
SELECT e.last_name, d.department_name 
FROM employees e JOIN departments d ON d.department_id = e.department_id
WHERE e.last_name like "%a%";


-- 5. Write a query to display the last name,job,department number and department name for all employees who work in ATLANTA.
SELECT e.last_name, e.job_id, d.department_id, d.department_name
FROM employees e JOIN departments d ON e.department_id=e.department_id JOIN locations l ON l.location_id=d.location_id
WHERE l.city ="Atlanta";


-- 6. Display the employee last name and employee number along with their manager's last name and manager number.
SELECT last_name, employee_id, manager_id FROM employees WHERE manager_id is not null;


-- 7. Display the employee last name and employee number along with their manager's last name and manager number (including the employees who have no manager).
SELECT last_name, employee_id, manager_id FROM employees;


-- 8. Create a query that displays employees last name,department number,and all the employees who work in the same department as a given employee.
SELECT e.last_name AS Employee, e.department_id AS Department, c.last_name AS Colleague
FROM employees e JOIN employees c ON e.department_id = c.department_id;


-- 9. Create a query that displays the name,job,department name,salary,grade for all employees. Derive grade based on salary(>=50000=A, >=30000=B,<30000=C)
SELECT CONCAT(e.first_name," ",e.last_name) AS "Employee Name", j.job_title as Job, d.department_name, e.salary,
CASE
	WHEN salary>=50000 THEN 'A'
	WHEN salary>=30000 THEN 'B'
	WHEN salary<30000 THEN 'C'
END AS grade 
FROM employees e JOIN departments d ON d.department_id = e.department_id JOIN jobs j ON j.job_id = e.job_id;


-- 10. Display the names and hire date for all employees who were hired before their managers along withe their manager names and hire date. 
-- Label the columns as Employee name, emp_hire_date,manager name,man_hire_date
SELECT CONCAT(e.first_name," ",e.last_name) AS "Employee Name", e.hire_date AS emp_hire_date
FROM employees e JOIN employees m ON e.manager_id = m.employee_id
WHERE e.hire_date < m.hire_date;


