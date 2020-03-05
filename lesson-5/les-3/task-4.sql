DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `birthday_at` varchar(25) COLLATE utf8_unicode_ci,
  `created_at` varchar(25) COLLATE utf8_unicode_ci,
  `updated_at` varchar(25) COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO users (name, birthday_at, created_at, updated_at ) VALUES
  ('Светлана', '1988-may-04', '20.10.2017 8:10', '20.10.2017 8:10'),
  ('Олег', '1998-august-20', '20.10.2017 8:15', '20.10.2017 8:10'),
  ('Юлия', '2006-march-12', '20.10.2017 15:10', '22.10.2017 8:10');
 
SELECT id, name FROM users WHERE birthday_at LIKE '%may%' OR birthday_at LIKE '%august%';