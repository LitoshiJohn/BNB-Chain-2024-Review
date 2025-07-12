

with bnb AS (select  block_timestamp, 
tx_hash
from bsc.core.fact_transactions
where block_timestamp::date between  '2024-01-01' and '2024-12-31'
and status = 'SUCCESS'
 )
,
txns as (select trunc(block_timestamp,'second') as seconds, 
count(DISTINCT tx_hash) as txns
from bnb
group by 1
)

select case
    when seconds :: date BETWEEN '2024-01-01'
    and '2024-03-31' then 'Q1'
    when seconds :: date BETWEEN '2024-04-01'
    and '2024-06-30' then 'Q2'
    when seconds :: date BETWEEN '2024-07-01'
    and '2024-09-30' then 'Q3'
    when seconds :: date BETWEEN '2024-10-01'
    and '2024-12-31' then 'Q4'
  end as Quarters,
avg(txns) as "Avg TPS",
median(txns) as "Median TPS",
max(txns) as "Max TPS",
min(txns) as "Min TPS"
from txns
group by 1
order by 1 asc 
 

 

