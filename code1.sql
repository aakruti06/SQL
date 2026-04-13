-- create table
CREATE TABLE fruits(
	id INT  AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(20),
	color VARCHAR(10),
	quantity INT
);

-- insert data
INSERT INTO fruits VALUES
('apple' 'red',2),
('banana','yellow',5),
('fig','purple',2),
('watermelon','indigo',1),
('grapes','black',15);

SELECT * FROM fruits;

