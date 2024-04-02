-- Exercise 1
SELECT
SUM(CASE
      WHEN device_type = 'laptop' THEN 1 ELSE 0
      END) AS laptop_views,
SUM(CASE
      WHEN device_type IN ('tablet', 'phone') THEN 1 ELSE 0
      END) AS mobile_views
FROM viewership;

-- Exercise 2
SELECT *,
CASE
    WHEN x+y> z AND x+z>y AND y+z>x THEN 'Yes'
    ELSE 'No'
END AS triangle
FROM Triangle;

-- Exercise 3
