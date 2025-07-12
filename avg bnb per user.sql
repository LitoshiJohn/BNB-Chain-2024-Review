SELECT
  count(from_address) as users,
  sum(value) as bnb,
  (bnb / users) as bnb_per_user
FROM
  bsc.core.fact_transactions
WHERE
  1 = 1
  and block_timestamp :: date BETWEEN '2024-01-01'
  and '2024-12-31'
