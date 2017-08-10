-- Find all the employees with the same hire date as employee 101010 using a sub-query.

--69 Rows

SELECT * FROM employees
WHERE hire_date IN (
		SELECT hire_date FROM employees WHERE emp_no = 101010 
	);


--Find all the titles held by all employees with the first name Aamod.

-- 314 total titles, 6 unique titles

SELECT *
FROM titles
WHERE emp_no IN (
		SELECT emp_no FROM employees WHERE first_name = "Aamod"
);	


-- Find all the current department managers that are female.
SELECT first_name, last_name
FROM employees
WHERE emp_no IN (
	SELECT emp_no FROM dept_manager WHERE to_date = '9999-01-01'
	)
AND gender = 'F';



 +------------+------------+
 | first_name | last_name  |
 +------------+------------+
 | Isamu      | Legleitner |
 | Karsten    | Sigstam    |
 | Leon       | DasSarma   |
 | Hilary     | Kambil     |
 +------------+------------+


-- BONUS Find all the department names that currently have female managers.

SELECT dept_name
FROM departments
WHERE dept_no IN (
	SELECT dept_no FROM dept_manager WHERE to_date = '9999-01-01'
	AND emp_no IN (
		SELECT emp_no FROM employees WHERE gender = 'F'
		)
	);


 +-----------------+
 | dept_name       |
 +-----------------+
 | Development     |
 | Finance         |
 | Human Resources |
 | Research        |
 +-----------------+


-- SUBQUERY CURRICULUM EXERCISES --

-- Find all the employees with the same hire date as employee 101010 using a sub-query.

-- Find all the titles held by all employees with the first name Aamod.

-- Find all the current department managers that are female.

-- BONUS Find all the department names that currently have female managers.



-- SUBQUERY/JOINS EXTRA BONUSES --

-- what is the most common birthday in the company? least common?

-- what is the average salary of managers by department?

-- how many employees currently work in each department?

-- what is the average salary for each department?

-- what was the average salary in the 80s? By department?

-- how many times (on average) do employees switch titles?

-- how many times (on average) do employees get a raise?


-- EXTRA HARD BONUS --

-- what employees were hired during the year Nevermind was released and after?





























