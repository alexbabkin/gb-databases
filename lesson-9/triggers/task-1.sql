use les7;

DROP FUNCTION  IF EXISTS hello;
DELIMITER //
CREATE FUNCTION hello ()
RETURNS VARCHAR(50) NO SQL
BEGIN
	DECLARE cur_time TIME;
	SET cur_time = CURRENT_TIME();
	IF cur_time >= CONVERT('06:00:00', TIME) AND cur_time < CONVERT('12:00:00', TIME) THEN 
		RETURN 'Доброе утро';
	END IF;
	IF cur_time >= CONVERT('12:00:00', TIME) AND cur_time < CONVERT('18:00:00', TIME) THEN 
		RETURN 'Добрый день';
	END IF;
	IF cur_time >= CONVERT('18:00:00', TIME) AND cur_time < CONVERT('23:59:59', TIME) THEN 
		RETURN 'Добрый вечер';
	END IF;
	RETURN 'Доброй ночи';
END //

DELIMITER ;

SELECT hello();