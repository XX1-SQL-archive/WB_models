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
    #count(srv_name) AS Artikelanzahl  # Artikelanzahl
    sum(product_price) AS Summe #Summe der Gesamtkosten
FROM purchases 
INNER JOIN servants ON servants.id = purchases.servants_id
INNER JOIN products ON products.id = purchases.products_id
GROUP BY srv_name
HAVING srv_name = "Holger"
#WHERE srv_name = "Peter"
;

-- Wer hat das Produkt X gekauft?
SELECT
    srv_name AS Kunde,
    product_name AS Produkt
FROM purchases 
INNER JOIN servants ON servants.id = purchases.servants_id
INNER JOIN products ON products.id = purchases.products_id
#WHERE product_name LIKE "%Sauce%"
WHERE product_name LIKE "%Lachs%"
;

-- Wie oft wurde das Produkt X gekauft?
SELECT
	product_name AS Produkt,
    count(product_name) AS Anzahl
FROM purchases 
INNER JOIN servants ON servants.id = purchases.servants_id
INNER JOIN products ON products.id = purchases.products_id
GROUP BY product_name
ORDER BY Anzahl DESC;
;

-- Welche Umsätze hatte das Produkt X?
-- Lösung A: Berechnung in gleicher Tabelle
SELECT
	product_name AS Produkt,
    product_price AS Preis,
    count(product_name) AS Anzahl,
    count(product_name) * product_price AS Umsatz
FROM purchases 
INNER JOIN servants ON servants.id = purchases.servants_id
INNER JOIN products ON products.id = purchases.products_id
GROUP BY Produkt, Preis
ORDER BY Anzahl DESC;
;

-- Lösung B: Berechnung mit tmp-Tabelle


-- Wer bekommt den Lachs?