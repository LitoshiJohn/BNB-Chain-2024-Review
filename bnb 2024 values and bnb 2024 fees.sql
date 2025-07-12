select
  sum(value) as total_bnb,
  avg(value) as avg_bnb,
  sum(tx_fee) as total_fees,
  avg(tx_fee) as avg_fee,
  max(tx_fee) as max_fee,
  min(tx_fee) as min_fee
from
  bsc.core.fact_transactions
where block_timestamp::date BETWEEN '2024-01-01' and '2024-12-31'