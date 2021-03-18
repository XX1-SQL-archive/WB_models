-- 04. SELECTs

-- Einzeltabellen
SELECT * FROM cats;
SELECT * FROM kittens;

-- Inner Join 1 / Gesamte Kombi-Tabelle
SELECT
	*
FROM cats INNER JOIN kittens
ON cats.id = kittens.cats_id 
;

-- Inner Join 2 / Verwandschaft
SELECT
	cat_name AS Mutter,
    kitten_name AS Kind,
    concat(cat_name, " ist die Mutter von ", kitten_name) AS Verwandschaft
FROM cats INNER JOIN kittens
ON cats.id = kittens.cats_id 
;

-- Inner Join 3 / Wieviel Kinder haben die Katzen?
SELECT
	cat_name AS Katze,
    count(cat_name) AS Kinder
FROM cats INNER JOIN kittens ON cats.id = kittens.cats_id 
GROUP BY cat_name # Wichtig bei Kombi Aggr./Nicht-Aggr.
;
