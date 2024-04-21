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
WITH number_transaction AS(
  SELECT
  user_id,
  spend,
  transaction_date,
  ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY transaction_date) AS number
  FROM transactions)
SELECT
user_id,
spend,
transaction_date
FROM number_transaction
WHERE number = 3;

--- Exercise 4
WITH lastest AS(
  SELECT
  transaction_date,
  user_id,
  product_id,
  RANK() OVER (PARTITION BY user_id ORDER BY transaction_date DESC) AS trans_rank
  FROM user_transactions)
SELECT
transaction_date,
user_id,
COUNT(product_id) AS purchase_count
FROM lastest
WHERE trans_rank = 1
GROUP BY transaction_date, user_id
ORDER BY transaction_date;

--- Exercise 5
WITH data AS(
  SELECT
  user_id,
  tweet_date,
  tweet_count,
  LAG(tweet_count, 1) OVER (PARTITION BY user_id) AS pre_1,
  LAG(tweet_count, 2) OVER (PARTITION BY user_id) AS pre_2
  FROM tweets)
SELECT
user_id,
tweet_date,
CASE 
  WHEN pre_1 IS NULL THEN ROUND(tweet_count/1.0, 2)
  WHEN pre_2 IS NULL THEN ROUND((pre_1 + tweet_count)/2.0, 2)
  ELSE ROUND((pre_1 + pre_2 + tweet_count)/3.0, 2)
  END AS rolling_avg_3d
FROM data;

--- Exercise 6
WITH time_diff AS(
  SELECT
  *,
  transaction_timestamp - LAG( transaction_timestamp) OVER (PARTITION BY merchant_id, credit_card_id, amount ORDER BY  transaction_timestamp) AS diff
  FROM transactions)
SELECT COUNT(*) AS payment_count
FROM time_diff
WHERE diff <= '00:10:00';

--- Exercise 7
WITH spend_rank AS(
  SELECT
  category,
  product,
  SUM(spend) AS total_spend,
  RANK() OVER (PARTITION BY category ORDER BY SUM(spend) DESC) AS rank
  FROM product_spend
  WHERE EXTRACT(YEAR FROM transaction_date) = 2022
  GROUP BY category, product)
SELECT
category,
product,
total_spend
FROM spend_rank
WHERE rank <=2
ORDER BY category, rank;

--- Exercise 8
WITH in_top AS(
  SELECT
  artists.artist_name AS artist_name,
  COUNT(ranking.rank) AS frequency,
  DENSE_RANK() OVER (ORDER BY COUNT(ranking.rank) DESC) AS artist_rank
  FROM global_song_rank AS ranking
  JOIN songs ON songs.song_id = ranking.song_id
  JOIN artists ON songs.artist_id = artists.artist_id
  WHERE ranking.rank <= 10
  GROUP BY artists.artist_name)
SELECT
artist_name,
artist_rank
FROM in_top
WHERE artist_rank <=5;
