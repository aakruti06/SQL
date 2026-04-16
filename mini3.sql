-- Mini Project 3: City and Country Analysis

-- Create tables
CREATE TABLE city(
    c_id INT PRIMARY KEY,
    c_name VARCHAR(20),
    c_population INT
);

CREATE TABLE country(
    cc_name VARCHAR(20),
    c_id INT
);

-- Insert data into city
INSERT INTO city VALUES
(1,'DELHI',200),
(2,'CAIRO',300),
(3,'WASHINGTON.D.C',150),
(4,'TOKYO',233),
(5,'BEIJING',560),
(6,'ROME',120),
(7,'OTTAWA',650),
(8,'MOSCOW',540),
(9,'PARIS',190),
(10,'SEOUL',100),
(11,'MADRID',500),
(12,'CAPE TOWN',420);

-- Insert data into country
INSERT INTO country VALUES
('INDIA',1),
('EGYPT',2),
('USA',3),
('JAPAN',4),
('CHINA',5),
('ITALY',6),
('CANADA',7),
('RUSSIA',8),
('FRANCE',9),
('SOUTH KOREA',10),
('SPAIN',11),
('SOUTH AFRICA',12);

-- Basic JOIN queries
SELECT c.c_name, c1.cc_name
FROM city c
JOIN country c1
ON c.c_id = c1.c_id;

SELECT c1.cc_name, c.c_population
FROM city c
JOIN country c1
ON c.c_id = c1.c_id;

-- Filter + JOIN
SELECT c.c_name, c.c_population
FROM city c
JOIN country c1
ON c.c_id = c1.c_id
WHERE c.c_population > 300 AND c.c_population < 500;

-- GROUP BY example
SELECT c.c_population, COUNT(*) AS total_cities
FROM city c
JOIN country c1
ON c.c_id = c1.c_id
WHERE c.c_population > 300 AND c.c_population < 500
GROUP BY c.c_population;
