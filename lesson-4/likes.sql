-- типы лайков. содрежит сущности которым можно поставить лайки
DROP TABLE IF EXISTS `like_types`;
CREATE TABLE `like_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- в данный момент предпологаем, что лайки можно поставить только сообщениям и меди,
-- но можно добавить что угодно 
INSERT INTO like_types (type) VALUES
  ('media'),
  ('messages')
;

-- таблица лайков
DROP TABLE IF EXISTS `likes`;
CREATE TABLE `likes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `like_type` int(10) unsigned NOT NULL,
  `entity_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO likes (user_id, like_type, entity_id) VALUES
  (1, 2, 55),
  (66, 1, 66),
  (5, 1, 73),
  (51, 1, 1),
  (41, 1, 22),
  (11, 2, 53),
  (61, 2, 77),
  (71, 1, 77),
  (21, 2, 92),
  (11, 1, 66),
  (81, 1, 5),
  (81, 2, 5)
;


