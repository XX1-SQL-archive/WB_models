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

-- Inner Join 3 / Dienstzeit
SELECT 
	srv_name AS Diener,
    yrs_served AS Dienstzeit
FROM cats INNER JOIN servants
ON cats.id = servants.cats_id
ORDER BY yrs_served DESC;
;

-- Inner Join 3a / Dienstzeit
-- "X dient Y seit Z Jahren" ?
SELECT
	#concat(srv_name, " Dient seit sovielen Jahren: ", yrs_served) AS Dienstjahre # Jenny
    concat(srv_name, " dient ", cat_name, " seit ", yrs_served, " Jahren.") AS Dienstzeit 
FROM cats inner join servants
on cats.id = servants.cats_id
ORDER BY yrs_served DESC;
; 

-- Inner Join 4 / Dienstzeit
-- "X ist der Diener mit der längsten Dienstzeit" // max()
SELECT
    concat(srv_name, " - der Diener von ", cat_name, " - ist der Diener mit der längsten Dienstzeit.") AS Dienstzeit 
FROM cats inner join servants on cats.id = servants.cats_id
-- Filterung mit SUBQUERY
WHERE yrs_served = ( 
					SELECT 
						max(yrs_served) 
					FROM cats inner join servants 
                    on cats.id = servants.cats_id
                    )
                   
;


