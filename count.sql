CREATE TABLE furniture(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(20),
number INT
);

INSERT INTO furniture VALUES
(1,'dinning_table',1),
(2,'chairs',6),
(3,'sofa',4),
(4,'beds',3),
(5,'side_tables',8),
(6,'almirah',5),
(7,'kitchen_racks',3),
(8,'stools',6);

SELECT * FROM furniture;

--total rows
SELECT COUNT(*)
FROM furniture;

--count per number
SELECT number, COUNT(*)
FROM furniture
GROUP BY number
ORDER BY number ASC;

--sort furniture by quantity
SELECT *
FROM furniture
ORDER BY number ASC;

--highest quantity item
SELECT name, number
FROM furniture
ORDER BY number DESC
LIMIT 1;

--count per furniture type
SELECT name, number
FROM furniture
GROUP BY name, number;

--highest - 2
SELECT name, number
FROM furniture
ORDER BY number DESC
LIMIT 2;

--count less than 6
SELECT COUNT(*)
FROM furniture
WHERE number BETWEEN 1 AND 5
GROUP BY number;


SELECT number, COUNT(*) AS total
FROM furniture
GROUP BY number;
