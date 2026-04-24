-- SELECT 

CREATE TABLE skills(
id INT PRIMARY KEY,
name VARCHAR(20),
topics VARCHAR(20)
);

INSERT INTO skills VALUES
(1,'C_','strings'),
(2,'CPP_','inheritance'),
(3,'PYTHON_','slice'),
(4,'SQL_','tables'),
(5,'AWS_','instances');

SELECT * FROM skills;

CREATE TABLE backend(
b_id INT PRIMARY KEY,
name VARCHAR(20),
project VARCHAR(20)
);

CREATE TABLE frontend(
f_id INT PRIMARY KEY,
name VARCHAR(20),
project VARCHAR(20)
);


INSERT INTO backend VALUES
(1,'C_','epoch_converter'),
(2,'CPP_','car_details'),
(3,'PYTHON_','LED_blinking');

INSERT INTO frontend VALUES
(1,'SQL_','datasets'),
(2,'AWS_','data_storage'); 


SELECT s.name, s.topics, b.project
FROM skills s
JOIN backend b
ON s.name = b.name;

SELECT s.name, s.topics, f.project
FROM skills s
JOIN frontend f
ON s.name = f.name;

SELECT s.name, s.topics, b.project
FROM skills s
LEFT JOIN backend b
ON s.name = b.name;

SELECT s.name, s.topics, b.project AS backend_project, f.project AS frontend_project
FROM skills s
LEFT JOIN backend b ON s.name = b.name
LEFT JOIN frontend f ON s.name = f.name;

SELECT s.name
FROM skills s
LEFT JOIN backend b
ON s.name = b.name
WHERE b.name IS NULL;


-- end --
