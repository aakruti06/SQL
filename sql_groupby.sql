CREATE TABLE team(
	t_id INT PRIMARY KEY,
	t_name VARCHAR(20),
	t_city VARCHAR(20)
);


INSERT INTO team VALUES
(1,'REEMA','DELHI'),
(2,'LEELA','MUMBAI'),
(3,'ROY','NYC'),
(4,'JENNY','BERLIN'),
(5,'FRED','PARIS'),
(6,'DIYA','HYDEARBAD'),
(7,'KRITI','TOKYO'),
(8,'ALEX','SHANGHAI'),
(9,'HU SHI','BEIJING'),
(10,'SETH','CAIRO');

SELECT * FROM team;

CREATE TABLE country(
	c_name VARCHAR(20),
	t_city VARCHAR(20)
);

INSERT INTO country(c_name) VALUES
('INDIA'),
('INDIA'),
('INDIA'),
--('INDIA','PUNE'),
--('INDIA','CHENNAI'),
('JAPAN'),
('FRANCE'),
('USA'),
('GERMANY'),
('CHINA'),
('CHINA'),
--('MEXICO', 'MEXICO CITY');

SELECT COUNT(*)
FROM team t
JOIN country c
ON t.t_city = c.t_city;

SELECT * FROM country;
