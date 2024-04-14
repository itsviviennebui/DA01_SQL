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
ROUND(1.0*(SUM(CASE WHEN texts.signup_action = 'Confirmed' THEN 1
    ELSE 0
    END))/COUNT(DISTINCT emails.user_id), 2) AS confirm_rate
FROM emails
LEFT JOIN texts
ON emails.email_id = texts.email_id;

-- Exercise 3
SELECT
age_breakdown.age_bucket,
ROUND(100.0*(SUM(CASE WHEN activities.activity_type = 'send' THEN activities.time_spent
            ELSE 0 END))/SUM(activities.time_spent), 2) AS send_perc,
ROUND(100.0*(SUM(CASE WHEN activities.activity_type = 'open' THEN activities.time_spent
            ELSE 0 END))/SUM(activities.time_spent), 2) AS open_perc
FROM activities
INNER JOIN age_breakdown
ON activities.user_id = age_breakdown.user_id
WHERE activities.activity_type IN ('open', 'send')
GROUP BY age_breakdown.age_bucket;

-- Exercise 4
