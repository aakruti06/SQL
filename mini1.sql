-- create table 
CREATE TABLE emp(
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(20),
	m_salary INT,
	department VARCHAR(20)
);

-- insert values
INSERT INTO emp VALUES
('aruna',80000,'IT'),
('asmita',88000,'IT'),
('jiya',85000,'HR'),
('smriti',90000,'SALES'),
('preeti',87000,'SALES'),
('roshni',89000,'HR'),
('siya',100000,'MGMT');

-- print
SELECT * FROM emp;

--use group by 
SELECT COUNT(*)
FROM emp
GROUP BY salary;

SELECT COUNT(*)
FROM emp
GROUP BY salary
HAVING COUNT(*) > 1;

SELECT AVG(salary) FROM emp ORDER BY salary ASC;

 
