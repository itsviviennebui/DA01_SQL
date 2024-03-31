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
