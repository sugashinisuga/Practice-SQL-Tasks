create database vegdiscount;
use vegdiscount;

CREATE TABLE shop (
    veg_id INT PRIMARY KEY,
    veg_name VARCHAR(30),
    price DECIMAL(10,2),
    discount DECIMAL(10,2)  -- discount in currency (e.g., Rs.)
);


INSERT INTO shop VALUES
(1, 'Onion', 40, 5),
(2, 'Tomato', 50, 7),
(3, 'Beans', 90, 10),
(4, 'Carrot', 70, 8),
(5, 'Drumstick', 100, 12);


DELIMITER $$

CREATE FUNCTION avg_discount()
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE avgDisc DECIMAL(10,2);
    SELECT AVG(discount) INTO avgDisc FROM shop;
    RETURN avgDisc;
END$$

DELIMITER ;

SELECT avg_discount() AS Average_Discount;
