USE vk;

SELECT profiles.user_id, MIN(profiles.birthday) as bd, COUNT(*) -- MIN(profiles.birthday) is just birthday, but we need agregation, because we use group by
	FROM profiles 
	JOIN likes
		ON profiles.user_id = likes.target_id
	JOIN target_types
		ON likes.target_type_id = target_types.id -- or just likes.target_type_id = 2 if we know id of 'users' row
			WHERE target_types.name = 'users'
	GROUP BY profiles.user_id
	ORDER BY bd DESC LIMIT 10;


SELECT gender, COUNT(*) AS likes_num
	FROM profiles
	JOIN likes 
		ON profiles.user_id = likes.user_id
	GROUP BY gender
	ORDER BY likes_num DESC LIMIT 1;


SELECT users.id, COUNT(*) AS total
	FROM users
	LEFT JOIN posts 
		ON users.id = posts.user_id AND posts.user_id IS NOT NULL
	LEFT JOIN likes 
		ON users.id = likes.user_id AND likes.user_id IS NOT NULL
	LEFT JOIN messages 
		ON users.id = messages.from_user_id AND messages .from_user_id IS NOT NULL
	LEFT JOIN media
		ON users.id = media.user_id AND media.user_id IS NOT NULL
	GROUP BY users.id
	ORDER BY total LIMIT 10;
	