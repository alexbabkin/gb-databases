START TRANSACTION;

INSERT INTO sample.users (id, name, birthday_at, created_at, updated_at)
	SELECT id, name, birthday_at, created_at, updated_at 
	FROM les7.users WHERE users.id = 1;

 DELETE FROM les7.users WHERE id = 1;

COMMIT;