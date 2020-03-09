USE vk;

DROP TABLE IF EXISTS activity_weight;
CREATE TABLE activity_weight (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  activity VARCHAR(255) NOT NULL UNIQUE,
  weight INT NOT NULL
);

INSERT INTO activity_weight (activity, weight) VALUES
   ('post', 3),
   ('like', 2),
   ('message', 1),
   ('media', 1);

SELECT 
id,  
   (
     (SELECT COUNT(*) FROM posts WHERE user_id = users.id) * (SELECT weight FROM activity_weight WHERE activity = 'post') +
     (SELECT COUNT(*) FROM likes WHERE user_id = users.id) * (SELECT weight FROM activity_weight WHERE activity = 'like') +
     (SELECT COUNT(*) FROM messages WHERE from_user_id = users.id) * (SELECT weight FROM activity_weight WHERE activity = 'message') + 
     (SELECT COUNT(*) FROM media WHERE user_id = users.id) * (SELECT weight FROM activity_weight WHERE activity = 'media')
    ) AS rating
  FROM users
  GROUP BY id
  ORDER BY rating
  LIMIT 10;