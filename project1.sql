-- ==============================
-- PROJECT.SQL
-- Complete SQL Practice Project
-- ==============================

-- ==============================
-- 1. CREATE DATABASE
-- ==============================
CREATE DATABASE IF NOT EXISTS project;
USE project;

-- ==============================
-- 2. CREATE TABLES
-- ==============================

CREATE TABLE team(
    id INT PRIMARY KEY,
    name VARCHAR(20),
    salary INT,
    dept VARCHAR(20),
    manager_id INT
);

CREATE TABLE emp(
    year INT,
    id INT
);

-- ==============================
-- 3. INSERT DATA
-- ==============================

INSERT INTO team VALUES
(1,'aa',50000,'IT',501),
(2,'bb',60000,'HR',502),
(3,'cc',65000,'HR',502),
(4,'dd',90000,'IT',501),
(5,'ee',85000,'IT',501),
(6,'ff',68000,'HR',502),
(7,'gg',70000,'FINANCE',502),
(8,'hh',71000,'FINANCE',501),
(9,'ii',95000,'MGMT',503),
(10,'jj',95000,'MGMT',503);

INSERT INTO emp VALUES
(2010,1),
(2011,2),
(2010,3),
(2015,4),
(2012,5),
(2012,6),
(2010,7),
(2015,8),
(2012,9),
(2020,10);

-- ==============================
-- 4. BASIC QUERIES
-- ==============================

-- Q1: Employees with salary > 60000
SELECT name, salary
FROM team
WHERE salary > 60000;

-- Q2: Count employees per department
SELECT dept, COUNT(*) AS total_emp
FROM team
GROUP BY dept;

-- Q3: Top 2 highest salaries
SELECT salary
FROM team
ORDER BY salary DESC
LIMIT 2;

-- ==============================
-- 5. JOIN QUERIES
-- ==============================

-- Q4: Employee name + join year
SELECT t.name, e.year
FROM team t
JOIN emp e
ON t.id = e.id;

-- Q5: Employees in IT department
SELECT name
FROM team
WHERE dept = 'IT';

-- Q6: Employees joined after 2012
SELECT t.name, e.year
FROM team t
JOIN emp e
ON t.id = e.id
WHERE e.year > 2012;

-- ==============================
-- 6. AGGREGATE QUERIES
-- ==============================

-- Q7: Average salary per department
SELECT dept, AVG(salary) AS avg_salary
FROM team
GROUP BY dept;

-- Q8: Department with highest total salary
SELECT dept, SUM(salary) AS total_salary
FROM team
GROUP BY dept
ORDER BY total_salary DESC
LIMIT 1;

-- Q9: Employees earning more than average salary
SELECT name, salary
FROM team
WHERE salary > (
    SELECT AVG(salary) FROM team
);

-- ==============================
-- 7. ADVANCED QUERIES
-- ==============================

-- Q10: Employees earning more than their manager (SELF JOIN)
-- NOTE: Will work only if manager_id matches actual employee id
SELECT e.name AS employee, m.name AS manager, e.salary, m.salary
FROM team e
JOIN team m
ON e.manager_id = m.id
WHERE e.salary > m.salary;

-- Q11: Second highest salary
SELECT MAX(salary) AS second_highest
FROM team
WHERE salary < (SELECT MAX(salary) FROM team);

-- Q12: Departments with more than 2 employees
SELECT dept, COUNT(*) AS total
FROM team
GROUP BY dept
HAVING COUNT(*) > 2;

-- ==============================
-- 8. BONUS QUERY
-- ==============================

-- Q13: Employees without matching record in emp
SELECT t.name
FROM team t
LEFT JOIN emp e
ON t.id = e.id
WHERE e.id IS NULL;

-- ==============================
-- END OF PROJECT
-- ==============================
