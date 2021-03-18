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
WHERE srv_name = "Holger"
#WHERE srv_name = "Peter"
;

-- Wieviel Produkte hat Holger gekauft?
-- Wieviel Geld hat Holger ausgegeben?
SELECT
	srv_name AS Diener,
    count(srv_name) AS Artikelanzahl  # Artikelanzahl
FROM purchases 
INNER JOIN servants ON servants.id = purchases.servants_id
INNER JOIN products ON products.id = purchases.products_id
GROUP BY srv_name
HAVING srv_name = "Holger"
#WHERE srv_name = "Peter"
;
