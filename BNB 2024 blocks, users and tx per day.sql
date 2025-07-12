select
  count(DISTINCT block_number) as blocks,
  count(DISTINCT tx_hash) as transactions,
  count(DISTINCT from_address) as addresses,
  transactions / addresses as avg_tx_per_user,
  transactions / blocks as avg_tx_per_block,
  transactions / 31622400 as tps, -- tps for 2024
  transactions / 366 as tx_per_day
from
  bsc.core.fact_transactions
where
  block_timestamp::date BETWEEN '2024-01-01'
  and '2024-12-31'
