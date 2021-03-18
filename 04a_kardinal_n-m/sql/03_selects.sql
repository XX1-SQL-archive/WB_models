-- 03. SELECTs

-- Einzeltabellen
SELECT * FROM cats;
SELECT * FROM servants;
SELECT * FROM products;
SELECT * FROM purchases;

-- Inner Join 1 / Kombi (servants / products / purchases)
SELECT
	*
FROM purchases 
INNER JOIN servants ON servants.id = purchases.servants_id
INNER JOIN products ON products.id = purchases.products_id
;

-- Welche Artikel hat Holger gekauft?
SELECT
	product_name AS Artikel
FROM purchases 
INNER JOIN servants ON servants.id = purchases.servants_id
INNER JOIN products ON products.id = purchases.products_id
#WHERE srv_name = "Holger"
WHERE srv_name = "Peter"
;


