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
  ('Светлана', '1988-02-04', '20.10.2017 8:10', '20.10.2017 8:10'),
  ('Олег', '1998-03-20', '20.10.2017 8:15', '20.10.2017 8:10'),
  ('Юлия', '2006-07-12', '20.10.2017 15:10', '22.10.2017 8:10');
 
ALTER TABLE users ADD created_at_tmp DATETIME, ADD updated_at_tmp DATETIME;
 
UPDATE users SET created_at_tmp = STR_TO_DATE(created_at, '%d.%m.%Y %H:%i'); 
UPDATE users SET updated_at_tmp = STR_TO_DATE(updated_at, '%d.%m.%Y %H:%i');
UPDATE users SET created_at = NULL;
UPDATE users SET updated_at = NULL;

ALTER TABLE users MODIFY created_at DATETIME, MODIFY updated_at DATETIME;
UPDATE users SET created_at = created_at_tmp;
UPDATE users SET updated_at = updated_at_tmp;

ALTER TABLE users DROP created_at_tmp, DROP updated_at_tmp;