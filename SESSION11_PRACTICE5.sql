-- Exercise 1
SELECT
COUNTRY.Continent,
FLOOR(AVG(CITY.Population)) AS avg_population
FROM CITY
INNER JOIN COUNTRY
ON CITY.CountryCode = COUNTRY.Code
GROUP BY COUNTRY.Continent;

-- Exercise 2

