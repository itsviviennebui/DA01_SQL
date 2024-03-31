-- Exercise 1
SELECT
Name
FROM STUDENTS
WHERE Marks >75
ORDER BY RIGHT(Name, 3), ID;

-- Exercise 2
SELECT
user_id,
CONCAT(UPPER(LEFT(name,1)), LOWER(SUBSTRING(name FROM 2 FOR LENGTH(name)-1))) AS name
FROM Users
ORDER BY user_id;

-- Exercise 3
SELECT
manufacturer,
CONCAT('$',CAST(SUM(total_sales)/10^6 AS int),' million') AS sale_mil
FROM pharmacy_sales
GROUP BY manufacturer
ORDER BY SUM(total_sales) DESC, manufacturer;

-- Exercise 4
SELECT
EXTRACT(month FROM submit_date) AS mth,
product_id AS product,
ROUND(AVG(stars), 2) AS avg_stars
FROM reviews
GROUP BY EXTRACT(month FROM submit_date), product_id
ORDER BY month, product;

-- Exercise 5
SELECT
sender_id,
COUNT(message_id) AS message_count
FROM messages
WHERE EXTRACT(month FROM sent_date)=8
AND EXTRACT(year FROM sent_date)=2022
GROUP BY sender_id
ORDER BY COUNT(message_id) DESC
LIMIT 2;

-- Exercise 6
SELECT
tweet_id
FROM Tweets
WHERE LENGTH(content)>15;

-- Exercise 7
SELECT
activity_date AS day,
COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE DATEDIFF('2019-07-27', activity_date) BETWEEN 0 AND 29
GROUP BY 1;

-- Exercise 8
SELECT 
COUNT(id) AS employees_hired
FROM employees
WHERE EXTRACT(month FROM joining_date) BETWEEN 1 AND 7
AND EXTRACT(year FROM joining_date) = 2022;

-- Exercise 9
SELECT
POSITION('a' IN first_name)
FROM worker
WHERE first_name = 'Amitah';

-- Exercise 10
SELECT
title,
SUBSTRING(title FROM LENGTH(winery)+2 FOR 4) AS year
FROM winemag_p2
WHERE country = 'Macedonia';
