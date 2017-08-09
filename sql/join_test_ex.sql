USE join_test_db;

-- Create a database named join_test_db and run the SQL provided in the Join Example DB section above; to create the same setup used for this lesson.

CREATE TABLE roles (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  role_id INT UNSIGNED DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (role_id) REFERENCES roles (id)
);

INSERT INTO roles (name) VALUES ('admin');
INSERT INTO roles (name) VALUES ('author');
INSERT INTO roles (name) VALUES ('reviewer');
INSERT INTO roles (name) VALUES ('commenter');

--Insert 4 new users into the database. One should have a NULL role. 
-- The other three should be authors.
INSERT INTO users (name, email, role_id) VALUES
('bob', 'bob@example.com', 1),
('joe', 'joe@example.com', 2),
('sally', 'sally@example.com', 3),
('adam', 'adam@example.com', 3),
('jane', 'jane@example.com', null),
('mike', 'mike@example.com', null);


-- Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson. 
-- Before you run each query, guess the expected number of results.
SELECT *
FROM users
JOIN roles on roles.id = users.role_id;

-- JOIN LEFT:
SELECT users.name as user_name, roles.name as role_name
FROM roles
LEFT JOIN users ON users.role_id = roles.id;

-- JOIN RIGHT:
SELECT users.name AS user_name, roles.name AS role_name
FROM users
RIGHT JOIN roles ON users.role_id = roles.id;

-- Use count and the appropriate join type to get a list of roles along with the number of users that has the role. 
-- Hint: You will also need to use group by in the query.
SELECT roles.name as role_name, COUNT(*)
FROM roles
LEFT JOIN users ON users.role_id = roles.id
GROUP BY roles.name;
-- ============================== EMPLOYEE DATABASE EXERCISES =======================================
-- Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.
SELECT departments.dept_name AS 'Department Name', CONCAT(employees.first_name, ' ', employees.last_name) AS 'Department Manager'
FROM employees
JOIN dept_manager on dept_manager.emp_no = employees.emp_no
JOIN departments on departments.dept_no = dept_manager.dept_no
WHERE to_date = '9999-01-01';

-- Find the name of all departments currently managed by women.
SELECT departments.dept_name AS 'Department Name', CONCAT(employees.first_name, ' ', employees.last_name) AS 'Department Manager'
FROM employees
JOIN dept_manager on dept_manager.emp_no = employees.emp_no
JOIN departments on departments.dept_no = dept_manager.dept_no
WHERE to_date = '9999-01-01'
AND gender = 'F';

-- Find the current titles of employees currently working in the Customer Service department.
	SELECT titles.title AS 'Title', COUNT(*) AS 'Count'
	FROM departments
	JOIN dept_emp on dept_emp.dept_no = departments.dept_no
	JOIN titles on titles.emp_no = dept_emp.emp_no 
	WHERE dept_emp.to_date = '9999-01-01'
	AND departments.dept_name = "Customer Service"
	GROUP BY titles.title;

-- Find the current salary of all current managers.
SELECT departments.dept_name AS 'Department Name', CONCAT(employees.first_name, ' ', employees.last_name) AS 'Department Manager', salaries.salary
FROM employees
JOIN dept_manager on dept_manager.emp_no = employees.emp_no
JOIN departments on departments.dept_no = dept_manager.dept_no
JOIN salaries on salaries.emp_no = employees.emp_no
WHERE dept_manager.to_date = '9999-01-01'
AND salaries.to_date = '9999-01-01';

-- Bonus Find the names of all current employees, their department name, and their current manager's name.




