USE les7;

SELECT 
	users.id, 
	users.name, 
	users.birthday_at, 
	users.created_at, 
	users.updated_at 
FROM 
	users 
JOIN 
	orders 
WHERE 
	users.id = orders.user_id;

--предпочтительно
SELECT 
	users.id, 
	users.name, 
	users.birthday_at, 
	users.created_at, 
	users.updated_at 
FROM 
	users JOIN orders 
ON
	users.id = orders.user_id;