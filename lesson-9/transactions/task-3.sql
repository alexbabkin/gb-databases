DROP TABLE IF EXISTS dates;
CREATE TABLE dates(
	created_at DATE
);

INSERT INTO dates (created_at) VALUES
('2018-08-01'),
('2018-08-04'),
('2018-08-16'),
('2018-08-17');

DROP TABLE IF EXISTS days;
CREATE TEMPORARY TABLE days (
  d INT
);

INSERT INTO days VALUES
(0), (1), (2), (3), (4), (5), (6), (7), (8), (9), (10),
(11), (12), (13), (14), (15), (16), (17), (18), (19), (20),
(21), (22), (23), (24), (25), (26), (27), (28), (29), (30);

SELECT @cur_date := DATE('2018-08-01') + INTERVAL d DAY, @cur_date IN (SELECT created_at FROM dates) as is_in_table
FROM ( SELECT d FROM days ORDER BY d ) as ordered_days;