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


