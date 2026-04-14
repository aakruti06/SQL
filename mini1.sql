-- create table 
CREATE TABLE emp(
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(20),
	m_salary INT,
	dept_id INT,
	FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

INSERT INTO department (dept_name) VALUES
('IT'),
('HR'),
('FINANCE'),
('MGMT');

--create another table
CREATE TABLE department(
        dept_id INT AUTO_INCREMENT PRIMARY KEY,
        dept_name VARCHAR(20)
);


-- insert values
INSERT INTO emp (name, m_salary, dept_id)  VALUES
('aruna',80000,1),
('asmita',88000,1),
('jiya',85000,2),
('smriti',90000,3),
('preeti',87000,3),
('roshni',89000,2),
('siya',100000,4);

SELECT e.name, e.m_salary, d.dept_name
FROM emp e
JOIN department d
ON e.dept_id = d.dept_id;

-- print
SELECT * FROM emp;

--use group by 
SELECT COUNT(*)
FROM emp
GROUP BY m_salary;

SELECT COUNT(*)
FROM emp
GROUP BY m_salary
HAVING COUNT(*) > 1;

SELECT AVG(m_salary) FROM emp ORDER BY m_salary ASC;

