DROP TRIGGER IF EXISTS check_name_description_insert;
DELIMITER //
CREATE TRIGGER check_name_description_insert BEFORE INSERT ON products
FOR EACH ROW
BEGIN 
	IF NEW.name is NULL AND NEW.descr is NULL THEN 
		SET NEW.name = 'Uknown-product';
	END IF;
END //

DELIMITER ;

INSERT INTO products (price, catalog_id) VALUES (10.0, 1);
SELECT * FROM products;

DELIMITER //
CREATE TRIGGER check_name_desc_update BEFORE UPDATE ON products
FOR EACH ROW
BEGIN
  IF NEW.name is NULL OR NEW.descr is NULL THEN
  	SIGNAL SQLSTATE '45000'
  	SET MESSAGE_TEXT = 'name and descr have to be not null';
  END IF;
END//
DELIMITER ;

UPDATE products SET name = null;