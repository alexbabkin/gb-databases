USE les7;

SELECT 
	products.id, 
	products.descr, 
	products.price, 
	catalogs.name
FROM 
	products 
JOIN 
	catalogs 
WHERE 
	products.catalog_id = catalogs.id;
	
--предпочтительно
SELECT 
	products.id, 
	products.descr, 
	products.price, 
	catalogs.name
FROM 
	products JOIN catalogs 
ON
	products.catalog_id = catalogs.id;