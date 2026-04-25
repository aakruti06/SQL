-- =========================================
-- DATABASE
-- =========================================
CREATE DATABASE IF NOT EXISTS company;
USE company;

-- =========================================
-- TABLE: employee
-- =========================================
CREATE TABLE employee(
    id INT PRIMARY KEY,
    name VARCHAR(20),
    salary INT,
    manager_id INT,
    join_year INT,
    left_year INT
);

INSERT INTO employee VALUES
(1,'pqr',120000,1,2005,NULL),
(2,'st',90000,2,2010,NULL),
(3,'uv',90000,3,2010,NULL),
(4,'xyz',88000,4,2011,NULL),
(5,'abdc',75000,5,2002,NULL);

-- =========================================
-- TABLE: team_emp
-- =========================================
CREATE TABLE team_emp(
    t_id INT PRIMARY KEY,
    t_name VARCHAR(20),
    t_company VARCHAR(20),
    t_dept VARCHAR(20),
    salary INT,
    manager_id INT
);

INSERT INTO team_emp VALUES
(1,'AA','IBM','IT',85000,1),
(2,'BB','TESLA','SALES',70000,2),
(3,'CC','META','SALES',55000,2),
(4,'DD','AMD','MGMT',65000,5),
(5,'EE','IBM','IT',92000,1),
(6,'FF','INTEL','HR',100000,3),
(7,'GG','META','HR',59999,3),
(8,'HH','META','FINANCE',60000,4);

-- =========================================
-- TABLE: emp_year
-- =========================================
CREATE TABLE emp_year(
    t_name VARCHAR(20),
    y_joinyear INT,
    y_leftyear INT
);

INSERT INTO emp_year VALUES
('AA',2010,2014),
('BB',2010,2016),
('CC',2009,2011),
('DD',2011,2024),
('EE',2012,2016),
('FF',2015,2020),
('GG',2018,2020),
('HH',2017,2018);

-- =========================================
-- BASIC JOIN
-- =========================================
SELECT e.name, t.t_name, t.t_dept
FROM team_emp t
JOIN employee e
ON e.manager_id = t.manager_id;

-- =========================================
-- FILTER BY DEPARTMENT
-- =========================================
SELECT e.name, t.t_name, t.t_dept
FROM team_emp t
JOIN employee e
ON e.manager_id = t.manager_id
WHERE t.t_dept = 'SALES';

-- =========================================
-- SALARY GREATER THAN DEPARTMENT AVERAGE
-- =========================================
SELECT t.t_name, t.salary, t.t_dept
FROM team_emp t
JOIN (
    SELECT t_dept, AVG(salary) AS avg_sal
    FROM team_emp
    GROUP BY t_dept
) d
ON t.t_dept = d.t_dept
WHERE t.salary > d.avg_sal;

-- =========================================
-- JOIN WITH YEAR TABLE
-- =========================================
SELECT t.t_name, e.y_leftyear
FROM team_emp t
JOIN emp_year e
ON t.t_name = e.t_name
WHERE e.y_leftyear BETWEEN 2016 AND 2020;

-- =========================================
-- MANAGER vs EMPLOYEE SALARY COMPARISON
-- =========================================
SELECT e.name AS manager_name, t.t_name AS employee_name
FROM team_emp t
JOIN employee e
ON t.manager_id = e.manager_id
WHERE t.salary > e.salary;

-- =========================================
-- SELF JOIN (same join year)
-- =========================================
SELECT a.t_name AS emp1, b.t_name AS emp2, a.y_joinyear
FROM emp_year a
JOIN emp_year b
ON a.y_joinyear = b.y_joinyear
AND a.t_name < b.t_name;

-- =========================================
-- EMPLOYEES WITH SALARY GREATER THAN HR
-- =========================================
SELECT DISTINCT t1.t_name
FROM team_emp t1
JOIN team_emp t2
ON t2.t_dept = 'HR'
WHERE t1.salary > t2.salary;

-- =========================================
-- LATEST JOIN YEAR PER DEPARTMENT
-- =========================================
SELECT t.t_name, t.t_dept, y.y_joinyear
FROM team_emp t
JOIN emp_year y
ON t.t_name = y.t_name
WHERE (t.t_dept, y.y_joinyear) IN (
    SELECT t2.t_dept, MAX(y2.y_joinyear)
    FROM team_emp t2
    JOIN emp_year y2
    ON t2.t_name = y2.t_name
    GROUP BY t2.t_dept
);

-- =========================================
-- SELF JOIN: SAME DEPT, DIFFERENT COMPANY
-- =========================================
SELECT a.t_name AS emp1, b.t_name AS emp2, a.t_dept
FROM team_emp a
JOIN team_emp b
ON a.t_dept = b.t_dept
AND a.t_company != b.t_company
AND a.t_id < b.t_id;

-- =========================================
-- COMPANY WISE COUNT
-- =========================================
SELECT t_company, COUNT(*) AS total_employees
FROM team_emp
GROUP BY t_company;



