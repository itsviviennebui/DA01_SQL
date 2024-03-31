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
