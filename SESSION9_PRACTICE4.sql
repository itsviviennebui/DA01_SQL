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
SELECT
ROUND((SUM(CASE 
    WHEN call_category IS NULL OR case_id = 'n/a' THEN 1 ELSE 0
    END)/COUNT(case_id)*100.0), 1) AS call_percentage
FROM callers;

-- Exercise 4
SELECT name
FROM Customer
WHERE referee_id !=2 OR referee_id IS NULL;

-- Exercise 5
SELECT
survived,
SUM(CASE
    WHEN pclass = 1 THEN 1 ELSE 0
    END) AS first_class,
SUM(CASE
    WHEN pclass = 2 THEN 1 ELSE 0
    END) AS second_class,
SUM(CASE
    WHEN pclass = 3 THEN 1 ELSE 0
    END) AS third_class
FROM titanic
GROUP BY survived;
