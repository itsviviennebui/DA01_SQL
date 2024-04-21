--- Exercise 1
WITH year_spend AS (
  SELECT
  EXTRACT(YEAR FROM transaction_date) as year,
  product_id,
  spend AS curr_year_spend,
  LAG(spend) OVER (
  PARTITION BY product_id 
  ORDER BY product_id, EXTRACT(YEAR FROM transaction_date)) AS prev_year_spend
  FROM user_transactions)
SELECT
year,
product_id,
curr_year_spend,
prev_year_spend,
ROUND(100* (curr_year_spend - prev_year_spend) / prev_year_spend, 2) AS yoy_rate
FROM year_spend;

--- Exercise 2
WITH first_issued_amount AS(
  SELECT
  card_name,
  FIRST_VALUE(issued_amount) OVER (PARTITION BY card_name ORDER BY issue_year, issue_month) AS issued_amount
  FROM monthly_cards_issued)
SELECT
DISTINCT card_name,
issued_amount
FROM first_issued_amount
ORDER BY issued_amount DESC;

--- Exercise 3
