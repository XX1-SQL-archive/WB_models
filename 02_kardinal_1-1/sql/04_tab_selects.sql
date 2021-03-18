-- SELECTS TBA

-- Einzeltabellen
SELECT * FROM cats;
SELECT * FROM servants;

-- Kreuzprodukt (Kartesisches Produkt)
SELECT * FROM cats JOIN servants;

-- Inner Join 1 / Gesamte Tabelle
SELECT 
	* 
FROM cats INNER JOIN servants
ON cats.id = servants.cats_id
;

-- Inner Join 1 / Gesamte Tabelle
SELECT 
	*
FROM cats INNER JOIN servants
ON cats.id = servants.cats_id
;

-- Inner Join 2 (Wer dient wem?)
-- Wer dient Grizabella?
SELECT 
	cat_name AS Katze,
    srv_name AS Diener
FROM cats INNER JOIN servants
ON cats.id = servants.cats_id
#WHERE cat_name = "Grizabella"
#WHERE cat_name = "Mausi"
WHERE srv_name = "Josef"
;

-- Inner Join 2a 
-- Wem dient Josef? --> "X ist der Diener von Y"
-- Josef + " ist der Diener von " + Grizabella
SELECT 
	concat(srv_name, " ist der Diener von ", cat_name,".") AS Dienstverhältnis
FROM cats INNER JOIN servants
ON cats.id = servants.cats_id
#WHERE cat_name = "Grizabella"
WHERE srv_name = "Josef"
;
