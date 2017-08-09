-- In your script, use DISTINCT to find the unique titles in the titles:
SELECT DISTINCT title
FROM titles;


--Update the previous query to sort the results alphabetically
SELECT DISTINCT title
FROM titles
ORDER BY title ASC;

-- Find your query for employees whose last names start and end with 'E'. 
-- Update the query find just the unique last names that start and end with 'E' using GROUP BY. 

SELECT last_name
FROM employees
WHERE last_name LIKE 'E%' AND last_name LIKE '%E'
GROUP BY last_name;


-- Update your previous query to now find unique combinations of first and last name where the last name starts and ends with 'E'. You should get 846 rows.
SELECT DISTINCT last_name, first_name
FROM employees
WHERE last_name LIKE 'E%' AND last_name LIKE '%E'
ORDER BY first_name;


-- Find the unique last names with a 'q' but not 'qu'. 
--You may use either DISTINCT or GROUP BY. 

SELECT last_name
FROM employees
WHERE last_name LIKE '%q%'
AND last_name NOT LIKE '%qu%'
GROUP BY last_name;

