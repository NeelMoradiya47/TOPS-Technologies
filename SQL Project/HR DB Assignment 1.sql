USE hr;

-- 1. Display all information in the tables EMP and DEPT.
-- SELECT d.* , e.* FROM employees e, departments d;
SELECT * FROM departments;
SELECT * FROM employees;


-- 2. Display only the hire date and employee name for each employee.
SELECT CONCAT(first_name," ",last_name) AS Employee_Name, hire_date FROM employees;


-- 3. Display the ename concatenated with the job ID, separated by a comma and space, and name the column Employee and Title
SELECT CONCAT(first_name," ",last_name,", ",job_id) AS "Employee and Title" FROM employees;


-- 4. Display the hire date, name and department number for all clerks.
SELECT CONCAT(first_name," ",last_name) AS Employee_Name, hire_date, department_id FROM employees WHERE job_id LIKE "%CLERK";


-- 5. Create a query to display all the data from the EMP table. Separate each column by a comma. Name the column THE OUTPUT
SELECT CONCAT_WS(", ",employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) AS OUTPUT FROM employees;


-- 6. Display the names and salaries of all employees with a salary greater than 2000.
SELECT CONCAT(first_name," ",last_name) AS Employee_Name, salary FROM employees WHERE salary > 2000;


-- 7. Display the names and dates of employees with the column headers "Name" and "Start Date"
SELECT CONCAT(first_name," ",last_name) AS "Name", hire_date AS "Start Date" FROM employees;


-- 8. Display the names and hire dates of all employees in the order they were hired.
SELECT CONCAT(first_name," ",last_name) AS "Name", hire_date AS "Start Date" FROM employees ORDER BY hire_date;


-- 9. Display the names and salaries of all employees in reverse salary order.
SELECT CONCAT(first_name," ",last_name) AS Employee_Name, salary FROM employees ORDER BY salary DESC;


-- 10. Display 'ename" and "deptno" who are all earned commission and display salary in reverse order.
SELECT CONCAT(first_name," ",last_name) AS Employee_Name, department_id FROM employees WHERE commission_pct != 0 ORDER BY salary DESC;


-- 11. Display the last name and job title of all employees who do not have a manager
SELECT last_name, job_id FROM employees WHERE manager_id IS NULL;


-- 12. Display the last name, job, and salary for all employees whose job is sales representative or stock clerk and whose salary is not equal to $2,500, $3,500, or $5,000
SELECT last_name, job_id, salary FROM employees WHERE (job_id LIKE "SA_REP" OR job_id LIKE "ST_CLERK") AND (salary != 2500 AND salary != 3500 AND salary != 5000);

