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
