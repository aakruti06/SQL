CREATE TABLE flowers(
name VARCHAR(20),
color VARCHAR(20),
quantity INT
);

CREATE TABLE shades(
color VARCHAR(20),
found_in VARCHAR(20)
);

INSERT INTO flowers VALUES
('rose','red',10),
('sunflower','yellow',50),
('lotus','pink',2),
('lily','white',8),
('lavendar','purple',12);

INSERT INTO shades VALUES
('red','worldwide'),
('yellow','Inida'),
('pink','Asia'),
('white','Northern Hemisphere'),
('purple','Mediterranean');

SELECT * FROM flowers;

SELECT * FROM shades;


SELECT f.name, s.found_in
FROM flowers f
JOIN shades s
ON f.color = s.color;

SELECT COUNT(*)
FROM flowers
WHERE quantity BETWEEN 6 AND 19;

SELECT quantity
FROM flowers
ORDER BY quantity ASC
LIMIT 3;

SELECT f.name, s.found_in, f.quantity
FROM flowers f
JOIN shades s
ON f.color = s.color
ORDER BY f.quantity ASC;

