CREATE TABLE department (
	dept_id INT PRIMARY KEY,
	dept_name VARCHAR(20)
);

INSERT INTO department VALUES
(1.'IT'),
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
(1,'asmita',60000,1),
(2,'divya',50000,1),
(3,'trisha',60000,1),
(4,'roshni',45000,2),
(5,'reema',45000,2),
(6,'rekha',50000,3),
(7,'kavya',51000,3),
(8,'leela',70000,4);

-- show dept with empolyees
SELECT e.name, d.dept_name
FROM emp e
JOIN department d
ON e.dept_id = d.dept_id;

-- show only IT emp
SELECT e.name
FROM emp e
JOIN department d
ON e.dept_id = d.dept_id
WHERE d.dept_name = 'IT';

--show only MGMT emp
SELECT e.name
FROM emp e
JOIN department d
ON e.dept_id = d.dept_id
WHERE d.dept_name = 'MGMT';

--show only HR emp
SELECT e.name
FROM emp e
JOIN department d
ON e.dept_id = d.dept_id
WHERE d.dept_name = 'HR';


