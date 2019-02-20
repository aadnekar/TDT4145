UPDATE skuespiller
SET skuespiller_navn = 'James Eugene Carrey'
WHERE skuespiller_navn = 'Jim Carrey';

DELETE FROM film
	WHERE regissørID IN (
		SELECT *
        FROM film full join regissør on (regissørID=regissørID)
        WHERE regissør.navn='Tom Shadyac'
        );


DELETE film
FROM film NATURAL JOIN regissør
WHERE regissør.navn='Tom Shadyac';

DELETE FROM regissør WHERE navn='Tom Shadyac';


