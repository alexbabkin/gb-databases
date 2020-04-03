use vk;

CREATE UNIQUE INDEX users_email_idx ON users(email); -- логин
CREATE INDEX media_filename_idx ON media(filename); -- поиск
CREATE INDEX messages_created_at_idx ON messages(created_at); -- для загрузки диалога вероятно понадобится
CREATE INDEX posts_user_id_created_at_idx ON posts(user_id, created_at); -- для загрузки стены
CREATE INDEX likes_target_id_idx ON likes(target_id); -- для отображения количества лайков у сущности
CREATE INDEX user_id_idx ON friendship(user_id); -- для загрузки друзей конкретного пользователя
CREATE INDEX communities_name_idx ON communities(name); -- поиск