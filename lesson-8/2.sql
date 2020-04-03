USE vk;

SELECT profiles.user_id, MIN(profiles.birthday) as bd, COUNT(likes.created_at) -- MIN(profiles.birthday) is just birthday, but we need agregation, because we use group by
	FROM profiles 
	LEFT JOIN likes
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


SELECT users.id, 
	( COUNT(posts.created_at)    * (SELECT weight FROM activity_weight WHERE activity = 'post')    ) +
	( COUNT(likes.created_at)    * (SELECT weight FROM activity_weight WHERE activity = 'like')    ) + 
	( COUNT(messages.created_at) * (SELECT weight FROM activity_weight WHERE activity = 'message') ) +
	( COUNT(media.created_at)    * (SELECT weight FROM activity_weight WHERE activity = 'media')   ) AS total
	FROM users
	LEFT JOIN posts 
		ON users.id = posts.user_id
	LEFT JOIN likes 
		ON users.id = likes.user_id
	LEFT JOIN messages 
		ON users.id = messages.from_user_id
	LEFT JOIN media
		ON users.id = media.user_id
	GROUP BY users.id
	ORDER BY total LIMIT 10;
	