use vk;

SELECT DISTINCT
	communities.name,
	FIRST_VALUE(users.last_name) OVER (PARTITION BY communities.id ORDER BY birthday) as olderst,
	FIRST_VALUE(users.last_name) OVER (PARTITION BY communities.id ORDER BY birthday DESC) as youngest,
	COUNT(users.id) OVER w AS num_of_user_in_group,
    COUNT(users.id) OVER() AS total_users,
    COUNT(users.id) OVER w / COUNT(users.id) OVER() * 100 AS "%%",
    (SELECT COUNT(*) FROM communities_users) / (SELECT COUNT(*) FROM communities) as average_in_groups -- ??? вероянтно есть лучший вариант ???
	FROM communities_users
		JOIN communities 
			ON communities.id = communities_users.community_id
		JOIN users
			ON communities_users.user_id = users.id
		JOIN profiles
			ON users.id = profiles.user_id
	WINDOW w AS (PARTITION BY communities.id);