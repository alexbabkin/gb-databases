DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `birthday_at` DATETIME COLLATE utf8_unicode_ci,
  `created_at` DATETIME COLLATE utf8_unicode_ci,
  `updated_at` varchar(25) COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO users (name, birthday_at) VALUES
  ('Светлана', '1988-02-04'),
  ('Светлана', '1988-02-04'),
  ('Олег', '1998-03-20'),
  ('Юлия', '2006-07-13');

SELECT SUM(TIMESTAMPDIFF(YEAR, birthday_at,  CURDATE())) / COUNT(*) as age FROM users;