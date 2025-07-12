SELECT
  date_trunc('month', block_timestamp) as date,
  case
    when block_timestamp :: date BETWEEN '2024-01-01'
    and '2024-03-31' then 'Q1'
    when block_timestamp :: date BETWEEN '2024-04-01'
    and '2024-06-30' then 'Q2'
    when block_timestamp :: date BETWEEN '2024-07-01'
    and '2024-09-30' then 'Q3'
    when block_timestamp :: date BETWEEN '2024-10-01'
    and '2024-12-31' then 'Q4'
  end as Quarters,
  sum(tx_fee) as total_fees,
  avg(tx_fee) as avg_fee,
  max(tx_fee) as max_fee,
  min(tx_fee) as min_fee
from
  bsc.core.fact_transactions
where
  block_timestamp :: date BETWEEN '2024-01-01'
  and '2024-12-31'
GROUP BY 1,2