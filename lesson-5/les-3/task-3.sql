DROP TABLE IF EXISTS `storehouses_products`;

CREATE TABLE `storehouses_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `value` int COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO storehouses_products (value) VALUES
(0),
(2500),
(0),
(30),
(500),
(1);

SELECT value FROM storehouses_products order by value <> 0 DESC, value;