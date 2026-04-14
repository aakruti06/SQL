CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(20)
);

INSERT INTO department VALUES
(1,'IT'),
(2,'HR'),
(3,'FINANCE'),
(4,'MGMT');

CREATE TABLE emp (
    id INT PRIMARY KEY,
    name VARCHAR(20),
    salary INT,
    dept_id INT
);

INSERT INTO emp VALUES
(1,'ASMITA',50000,1),
(2,'DIVYA',60000,2),
(3,'LEELA',70000,1),
(4,'DEEPA',80000,3),
(5,'ROSHNI',60000,2),
(6,'DIYA',100000,4),
(7,'SIMRAN',65000,1),
(8,'PREETI',61000,3),
(9,'NEHA',50000,1),
(10,'SWATI'90000,2);

-- SHOW EMPLOYEE WITH DEPT
SELECT e.name, d.dept_name
FROM emp e
JOIN department d
ON e.dept_id = d.dept_id;

 -- SHOW EMP WITH SALARY & DEPT
SELECT e.name, e.salary, d.dept_name
FROM emp e
JOIN department d
ON e.dept_id = d.dept_id;

 -- EPM OF IT DEPT
SELECT e.name
FROM emp e
JOIN department d
ON e.dept_id = d.dept_id
WHERE d.dept_name = 'IT';

-- AVG SALARY PER DEPT
SELECT d.dept_name, AVG(e.salary)
FROM emp e
JOIN department d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

-- TOTAL SALARY OF EACH DEPT
SELECT d.dept_name, SUM(e.salary)
FROM emp e
JOIN department d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

-- COUNT EMP IN EACH DEPT
SELECT d.dept_name, COUNT(*)
FROM emp e
JOIN department d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

-- HIGHEST SALARY IN EACH DEPT
SELECT d.dept_name, MAX(e.salary)
FROM emp e
JOIN department d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

-- DEPT WITH AVG SALARY > 60000
SELECT d.dept_name, AVG(e.salary)
FROM emp e
JOIN department d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name
HAVING AVG(e.salary) > 60000;

-- LOWEST SALARY 
SELECT d.dept_name, MIN(e.salary) AS lowest_salary
FROM emp e
JOIN department d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

-- EMP EARING > AVG SALARY 
SELECT name, salary
FROM emp
WHERE salary > (SELECT AVG(salary) FROM emp);

-- COUNT EMP IN IT
SELECT COUNT(*)
FROM emp e
JOIN department d
ON e.dept_id = d.dept_id
WHERE d.dept_name = 'IT';

-- DEPT WITH HIHEST SALARY
SELECT d.dept_name, SUM(e.salary) AS total_salary
FROM emp e
JOIN department d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name
ORDER BY total_salary DESC
LIMIT 1;

