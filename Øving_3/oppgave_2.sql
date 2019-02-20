-- Deloppgave a) 
SELECT *
FROM film;

-- Deloppgave b)
SELECT skuespiller_navn
FROM skuespiller
WHERE (fødselsår > 1960);

-- Deloppgave c)
SELECT skuespiller_navn, fødselsår
FROM skuespiller
WHERE (fødselsår > 1979 AND fødselsår < 1990)
ORDER BY skuespiller_navn ASC;

-- Deloppgave d)
SELECT tittel, rolle
FROM skuespillerifilm NATURAL JOIN skuespiller NATURAL JOIN film
WHERE skuespiller_navn='Morgan Freeman';

-- Deloppgave e)
SELECT  DISTINCT tittel
FROM film NATURAL JOIN regissør NATURAL JOIN skuespillerifilm NATURAL JOIN skuespiller
WHERE regissør.navn=skuespiller.skuespiller_navn;

-- Deloppgave f)
SELECT COUNT(skuespiller_navn)
FROM skuespiller
WHERE skuespiller_navn LIKE "C%";

-- Deloppgave g)
SELECT sjanger.navn, COUNT(sjangerforfilm.filmID) AS antall
FROM sjangerforfilm NATURAL JOIN sjanger
GROUP BY sjanger.navn
ORDER BY antall DESC;

-- Deloppgave h)
SELECT skuespiller_navn
FROM skuespillerifilm NATURAL JOIN skuespiller NATURAL JOIN film
WHERE film.tittel='Ace Ventura: Pet Detective' AND skuespiller_navn NOT IN (SELECT skuespiller_navn
															FROM skuespillerifilm NATURAL JOIN skuespiller NATURAL JOIN film
                                                            WHERE film.tittel='Ace Ventura: When Nature Calls');

-- Deloppgave i)
SELECT film.tittel, film.filmID, AVG(skuespiller.fødselsår) AS avg_fødselsår_i_film
FROM skuespillerifilm NATURAL JOIN skuespiller NATURAL JOIN film
GROUP BY film.tittel
HAVING avg_fødselsår_i_film > (SELECT AVG(skuespiller.fødselsår) FROM skuespiller)
ORDER BY film.tittel ASC;

-- Eksempel ekstra


