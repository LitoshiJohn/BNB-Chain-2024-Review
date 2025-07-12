SELECT
  date_trunc('month', block_timestamp) as date,
  CASE
    when block_timestamp::date between '2024-01-01'
    and '2024-03-31' then 'Q1'
    when block_timestamp::date between '2024-04-01'
    and '2024-06-30' then 'Q2'
    when block_timestamp::date between '2024-07-01'
    and '2024-09-30' then 'Q3'
    when block_timestamp::date between '2024-10-01'
    and '2024-12-31' then 'Q4'
  end as Quarters,
  count(DISTINCT tx_hash) as transactions,
  sum(transactions) over (
    order by
      'block_timestamp'
  ) as total_transactions,
  avg(transactions) over (
    order by
      'block_timestamp'
  ) as average_daily_transactions
FROM
  bsc.core.fact_transactions
where
  block_timestamp :: date BETWEEN '2024-01-01'
  and '2024-12-31'
group by
  1,
  2