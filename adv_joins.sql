-- Mini Project 4: Team Employee Analysis with JOINS

-- TABLES

CREATE TABLE team_emp(
    t_id INT PRIMARY KEY,
    t_name VARCHAR(20),
    t_company VARCHAR(20),
    t_dept VARCHAR(20)
);

CREATE TABLE emp_year(
    t_name VARCHAR(20),
    y_joinyear INT,
    y_leftyear INT
);

-- INSERT DATA

INSERT INTO team_emp VALUES
(1,'AA','IBM','IT'),
(2,'BB','TESLA','SALES'),
(3,'CC','META','SALES'),
(4,'DD','AMD','MGMT'),
(5,'EE','IBM','IT'),
(6,'FF','INTEL','HR'),
(7,'GG','META','HR'),
(8,'HH','META','FINANCE');

INSERT INTO emp_year VALUES
('AA',2010,2014),
('BB',2010,2016),
('CC',2009,2011),
('DD',2011,2024),
('EE',2012,2016),
('FF',2015,2020),
('GG',2018,2020),
('HH',2017,2018);

-- Count employees in IBM
SELECT COUNT(*)
FROM team_emp
WHERE t_company = 'IBM';

-- INNER JOIN
SELECT t.t_dept, t.t_name, y.y_joinyear
FROM team_emp t
INNER JOIN emp_year y
ON t.t_name = y.t_name
WHERE t.t_company = 'META';


--  GROUP BY with JOIN
-- Count employees in SALES department

SELECT t.t_dept, COUNT(*) AS total_emp
FROM team_emp t
JOIN emp_year y
ON t.t_name = y.t_name
WHERE t.t_dept = 'SALES'
GROUP BY t.t_dept;

-- LEFT JOIN
SELECT t.t_name, t.t_company, y.y_joinyear
FROM team_emp t
LEFT JOIN emp_year y
ON t.t_name = y.t_name;

-- Find employees with NO matching year data
SELECT t.t_name
FROM team_emp t
LEFT JOIN emp_year y
ON t.t_name = y.t_name
WHERE y.t_name IS NULL;

-- RIGHT JOIN
SELECT t.t_name, y.y_joinyear
FROM team_emp t
RIGHT JOIN emp_year y
ON t.t_name = y.t_name;

-- Find year records without employee match
SELECT y.t_name
FROM team_emp t
RIGHT JOIN emp_year y
ON t.t_name = y.t_name
WHERE t.t_name IS NULL;


--SELF JOIN
-- Same company employees

SELECT a.t_name AS emp1, b.t_name AS emp2, a.t_company
FROM team_emp a
JOIN team_emp b
ON a.t_company = b.t_company
AND a.t_name <> b.t_name;

-------------------------------------------------------------------------
