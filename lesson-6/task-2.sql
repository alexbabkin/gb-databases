USE vk;

SELECT user_id, 
(
   SELECT COUNT(*) FROM likes WHERE target_id IN 
   (
      SELECT id FROM media WHERE media.user_id = profiles.user_id
   )
)
  FROM profiles 
  ORDER BY birthday DESC LIMIT 10