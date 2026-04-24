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



SELECT name, number +2 AS updated_quantity
FROM furniture;

SELECT name, number
FROM furniture
WHERE number = 6;

SELECT name, number
FROM furniture
WHERE number > 3 AND number < 7;

SELECT name, number
FROM furniture
WHERE number = 3 OR number = 8;

SELECT name, number
FROM furniture
WHERE number != 6;

SELECT name, number
FROM  furniture
WHERE number BETWEEN 4 AND 7;


