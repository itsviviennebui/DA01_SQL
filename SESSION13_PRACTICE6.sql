-- Exercise 1
WITH job_count AS
  (SELECT 
      company_id,
      title,
      description,
      COUNT(job_id) AS number_of_job
      FROM job_listings
      GROUP BY company_id, title, description)
SELECT COUNT(DISTINCT company_id) AS duplicate_companies
FROM job_count
WHERE number_of_job >1;

-- Exercise 2
WITH spend_ranking AS
  (SELECT
      category,
      product,
      SUM(spend) AS total_spend,
      RANK() OVER(
        PARTITION BY category
        ORDER BY SUM(spend) DESC) AS ranking
    FROM product_spend
    WHERE EXTRACT(YEAR FROM transaction_date) = 2022
    GROUP BY category, product)
SELECT
  category,
  product,
  total_spend
FROM spend_ranking
WHERE ranking <=2
ORDER BY category, ranking;

-- Exercise 3
WITH call_count AS
  (SELECT
    policy_holder_id,
    COUNT(case_id) AS number_of_call
  FROM callers
  GROUP BY policy_holder_id)
SELECT COUNT(policy_holder_id) AS member_count
FROM call_count
WHERE number_of_call >=3;

-- Exercise 4
SELECT page_id
FROM pages
WHERE NOT EXISTS
  (SELECT page_id
  FROM page_likes AS likes
  WHERE pages.page_id = likes.page_id);

-- Exercise 5
WITH last_month AS
  (SELECT user_id
  FROM user_actions
  WHERE EXTRACT(MONTH FROM event_date) = 6
  AND EXTRACT(YEAR FROM event_date) = 2022)
SELECT
  EXTRACT(MONTH FROM current_month.event_date) AS month,
  COUNT(DISTINCT current_month.user_id) AS monthly_active_users
FROM user_actions AS current_month
JOIN last_month
ON current_month.user_id = last_month.user_id
WHERE EXTRACT(MONTH FROM current_month.event_date) = 7
AND EXTRACT(YEAR FROM current_month.event_date) = 2022
GROUP BY EXTRACT(MONTH FROM current_month.event_date);

-- Exercise 6

