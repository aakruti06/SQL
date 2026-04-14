--create table
CREATE TABLE employees(
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(20),
	m_salary INT,
	city VARCHAR(20)
);

-- INSEERT DATA
INSERT INTO employees VALUES
('asmita',50000,'mumbai'),
('aruna',60000,'delhi'),
('smita',70000,'pune'),
('leela',80000,'hyd');

SELECT * FROM employees;

-- update data
UPDATE employees SET city = 'hyderabad' WHERE name = 'leela';

SELECT * FROM employees;
