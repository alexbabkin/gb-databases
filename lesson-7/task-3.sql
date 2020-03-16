USE les7;

DROP TABLE IF EXISTS flights;
CREATE TABLE flights (
  id SERIAL PRIMARY KEY,
  from_ VARCHAR(255),
  to_ VARCHAR(255)
) COMMENT = 'рейсы';

INSERT INTO flights  (from_, to_) VALUES
  ('moscow', 'omsk'),
  ('novgorod', 'kazan'),
  ('irkutsk', 'moscow'),
  ('omsk', 'irkutsk'),
  ('moscow', 'kazan');
 
 
 DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
  label VARCHAR(255),
  name VARCHAR(255)
) COMMENT = 'города';

INSERT INTO cities (label, name) VALUES
  ('moscow', 'Москва'),
  ('novgorod', 'Новгород'),
  ('irkutsk', 'Иркутск'),
  ('kazan', 'Казань'),
  ('omsk', 'Омск');

 
 SELECT flights.id, f.name, t.name
 FROM 
 	(flights JOIN cities as f) JOIN cities as t
 ON
 	flights.from_ = f.label AND flights.to_ = t.label