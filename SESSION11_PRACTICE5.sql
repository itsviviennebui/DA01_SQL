-- Exercise 1
SELECT
COUNTRY.Continent,
FLOOR(AVG(CITY.Population)) AS avg_population
FROM CITY
INNER JOIN COUNTRY
ON CITY.CountryCode = COUNTRY.Code
GROUP BY COUNTRY.Continent;

-- Exercise 2
SELECT
ROUND(1.0*SUM((CASE 
  WHEN texts.signup_action = 'Confirmed' THEN 1
  ELSE 0
  END))/COUNT(DISTINCT emails.user_id),2) AS confirm_rate
FROM emails
LEFT JOIN texts
ON emails.email_id = texts.email_id;

-- Exercise 3

-- Exercise 4
