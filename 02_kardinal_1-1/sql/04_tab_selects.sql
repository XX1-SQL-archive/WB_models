-- SELECTS TBA

-- Einzeltabellen
SELECT * FROM cats;
SELECT * FROM servants;

-- Kreuzprodukt (Kartesisches Produkt)
SELECT * FROM cats JOIN servants;

-- Inner Join 1
SELECT 
	* 
FROM cats INNER JOIN servants
ON cats.id = servants.cats_id
;



