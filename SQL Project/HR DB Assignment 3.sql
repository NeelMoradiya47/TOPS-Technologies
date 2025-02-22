USE hr;

SELECT * FROM departments;
SELECT * FROM employees;

-- 1. Write a query that displays the employee's last names only from the string's 2-5th position with the first letter capitalized and all other letters lowercase, 
-- Give each column an appropriate label.
SELECT CONCAT(UPPER(SUBSTRING(last_name,2,1)), LOWER(SUBSTRING(last_name,3,5))) as employee_name FROM employees;


-- 2. Write a query that displays the employee's first name and last name along with a " in between for e.g.: first name : Ram; last name : Kumar then Ram-Kumar. 
-- Also displays the month on which the employee has joined.
SELECT CONCAT(first_name,"-",last_name) AS Employee_Name, MONTHNAME(hire_date) AS "Joining Month" FROM employees;


-- 3. Write a query to display the employee's last name and if half of the salary is greater than ten thousand then increase the salary by 10% else by 11.5% 
-- along with the bonus amount of 1500 each. Provide each column an appropriate label.
SELECT last_name AS "Employee Last Name", IF(salary/2 > 10000, salary * 1.1 + 1500, salary * 1.115 + 1500) AS "Salary + Bonus Amount" FROM employees;


-- 4. Display the employee ID by Appending two zeros after 2nd digit and 'E' in the end, department id, salary and the manager name all in Upper case, 
-- if the Manager name consists of 'z' replace it with '$!
SELECT CONCAT(LEFT(employee_id,2), "00", RIGHT(employee_id, LENGTH(employee_id) - 2), 'E') AS "Employee ID", department_id, salary, 
REPLACE(UPPER(first_name), 'A', '$!') AS "Manager Name" FROM employees WHERE job_id LIKE "%MGR";


-- 5. Write a query that displays the employee's last names with the first letter capitalized and all other letters lowercase, and the length of the names, 
-- for all employees whose name starts with J, A, or M. Give each column an appropriate label. Sort the results by the employees' last names
SELECT CONCAT(UPPER(MID(last_name,1,1)), LOWER(MID(last_name,2))) AS "Last Name", LENGTH(last_name) AS "Name Length" FROM employees 
WHERE first_name LIKE "J%" OR first_name LIKE "A%" OR first_name LIKE "M%" ORDER BY last_name;


-- 6. Create a query to display the last name and salary for all employees. Format the salary to be 15 characters long, left-padded with $. Label the column SALARY
SELECT last_name, CONCAT('$',LPAD(FORMAT(salary,0),15,'$')) AS SALARY FROM employees;


-- 7. Display the employee's name if it is a palindrome
SELECT first_name FROM employees WHERE first_name = REVERSE(first_name);


-- 8. Display First names of all employees with initcaps.
SELECT CONCAT(UPPER(SUBSTRING(first_name,1,1)),LOWER(SUBSTRING(first_name,2))) AS initacaps FROM employees;


-- 9. From LOCATIONS table, extract the word between first and second space from the STREET ADDRESS column.
SELECT SUBSTRING(street_address,POSITION(' ' IN street_address ),POSITION(' ' IN street_address )) AS sub_string FROM locations;


-- 10. Extract first letter from First Name column and append it with the Last Name. Also add "@systechusa.com" at the end. Name the column as e-mail address. 
-- All characters should be in lower case. Display this along with their First Name.
SELECT first_name, LOWER(CONCAT_WS('',SUBSTRING(first_name,1,1),last_name,'@systechusa.com')) AS email_address FROM employees;


-- 11. Display the names and job titles of all employees with the same job as Trenna.
SELECT e.first_name, e.last_name, j.job_title FROM employees e JOIN jobs j ON e.job_id = j.job_id WHERE e.first_name = 'Trenna';


-- 12. Display the names and department name of all employees working in the same city as Trenna.
SELECT CONCAT(e.first_name," ", e.last_name) AS "Employee Name", d.department_name 
FROM employees e JOIN departments d ON e.department_id = d.department_id JOIN locations l ON d.location_id = l.location_id WHERE e.first_name = 'Trenna';


-- 13. Display the name of the employee whose salary is the lowest.
SELECT CONCAT(first_name," ",last_name) AS "Employee Name" ,salary FROM employees WHERE salary = (SELECT MIN(salary) FROM employees);


-- 14. Display the names of all employees except the lowest paid.
SELECT CONCAT(first_name," ",last_name) AS "Employee Name" FROM employees WHERE salary != (SELECT MIN(salary) FROM employees);

