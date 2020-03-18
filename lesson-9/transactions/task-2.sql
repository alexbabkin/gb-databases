use les7;
CREATE VIEW V (name, catalog_name) AS (
	SELECT products.name, catalogs.name 
	FROM products
	JOIN catalogs
	ON catalogs.id = products.catalog_id