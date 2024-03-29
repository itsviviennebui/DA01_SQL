--- Exercise 1
SELECT DISTINCT CITY
FROM STATION
WHERE ID%2 = 0
ORDER BY CITY ASC;

--- Exercise 2
SELECT COUNT(CITY)-COUNT(DISTINCT CITY)
FROM STATION;

--- Exercise 3
SELECT CEILING(AVG(Salary) - AVG(REPLACE(Salary, 0, "")))
FROM EMPLOYEES;

--- Exercise 4
SELECT ROUND(CAST(SUM(item_count * order_occurrences) / SUM(order_occurrences) AS DECIMAL), 1) AS mean_items_per_order
FROM items_per_order;

--- Exercise 5
SELECT candidate_id
FROM candidates
WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(skill) = 3
ORDER BY candidate_id ASC;

--- Exercise 6
SELECT
user_id,
DATE(MAX(post_date)) - DATE(MIN(post_date)) AS days_between
FROM posts
WHERE EXTRACT(YEAR FROM post_date) = 2021
GROUP BY user_id
HAVING COUNT (post_id) >1;

--- Exercise 7
SELECT 
card_name,
MAX(issued_amount) - MIN(issued_amount) AS Difference
FROM monthly_cards_issued
GROUP BY card_name
ORDER BY MAX(issued_amount) - MIN(issued_amount) DESC;

--- Exercise 8
SELECT
manufacturer,
COUNT(drug) AS drug_count,
ABS(SUM(total_sales - cogs)) AS total_loss
FROM pharmacy_sales
WHERE cogs > total_sales
GROUP BY manufacturer
ORDER BY total_loss DESC;

--- Exercise 9
SELECT *
FROM Cinema
WHERE id%2 >0
AND description NOT LIKE 'boring'
ORDER BY rating DESC;

--- Exercise 10
SELECT teacher_id, 
COUNT(DISTINCT subject_id) AS cnt
FROM Teacher
GROUP BY teacher_id;

--- Exercise 11
SELECT
user_id,
COUNT(follower_id) AS followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id;

--- Exercise 12
SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(student)>=5;
