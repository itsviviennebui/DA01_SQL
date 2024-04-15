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
SELECT customer_contracts.customer_id
FROM customer_contracts
INNER JOIN products
ON customer_contracts.product_id = products.product_id
GROUP BY customer_contracts.customer_id
HAVING COUNT(DISTINCT products.product_category) = (SELECT COUNT(DISTINCT products.product_category) FROM products)

-- Exercise 5
SELECT
manager.employee_id,
manager.name,
COUNT(employee.employee_id) AS reports_count,
ROUND(AVG(employee.age)) AS average_age
FROM Employees manager, Employees employee
WHERE manager.employee_id = employee.reports_to
GROUP BY 1
HAVING reports_count >0
ORDER BY 1;

-- Exercise 6
SELECT
Products.product_name,
SUM(Orders.unit) AS unit
FROM Orders
LEFT JOIN Products
ON Orders.product_id = Products.product_id
WHERE MONTH(Orders.order_date) = 2 AND YEAR(Orders.order_date) = 2020
GROUP BY Products.product_id
HAVING SUM(Orders.unit) >=100;

-- Exercise 7
SELECT pages.page_id
FROM pages
LEFT JOIN page_likes
ON pages.page_id = page_likes.page_id
WHERE page_likes.page_id IS NULL
ORDER BY pages.page_id;



--------------------------------- MID COURSE TEST ---------------------------------

-- Question 1
SELECT DISTINCT(replacement_cost)
FROM film
ORDER BY replacement_cost ASC;

-- Question 2


