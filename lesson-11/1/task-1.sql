USE les7;

DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
       id INT(11) NOT NULL AUTO_INCREMENT,
       created_at DATETIME,
       table_name VARCHAR(50),
       prim_id INT,
       name VARCHAR(255),
       PRIMARY KEY (id)
     ) ENGINE=ARCHIVE;
     
DROP TRIGGER IF EXISTS log_users;
DELIMITER //
CREATE TRIGGER log_users AFTER INSERT ON users
FOR EACH ROW
BEGIN 
	INSERT INTO logs (created_at, table_name, prim_id, name) VALUES 
	(NOW(), 'users', NEW.id, NEW.name);
END //
DELIMITER ;


DROP TRIGGER IF EXISTS log_products;
DELIMITER //
CREATE TRIGGER log_products AFTER INSERT ON products
FOR EACH ROW
BEGIN 
	INSERT INTO logs (created_at, table_name, prim_id, name) VALUES 
	(NOW(), 'products', NEW.id, NEW.name);
END //
DELIMITER ;

DROP TRIGGER IF EXISTS log_catalogs;
DELIMITER //
CREATE TRIGGER log_catalogs AFTER INSERT ON catalogs
FOR EACH ROW
BEGIN 
	INSERT INTO logs (created_at, table_name, prim_id, name) VALUES 
	(NOW(), 'catalogs', NEW.id, NEW.name);
END //
DELIMITER ;

INSERT INTO users VALUES 
(NULL, 'alex', '1987-01-17', NOW(), NOW());

INSERT INTO catalogs VALUES 
(NULL, 'new_cat2');

INSERT INTO products VALUES 
(NULL, 'new_prod', 'description', 100, 1, NOW(), NOW());

SELECT * FROM logs;
