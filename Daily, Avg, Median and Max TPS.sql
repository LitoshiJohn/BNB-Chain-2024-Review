

with bnb AS (select  block_timestamp, 
tx_hash
from bsc.core.fact_transactions
where block_timestamp::date BETWEEN '2024-01-01' and '2024-12-31'
and status = 'SUCCESS'
 )
,
txns as (select trunc(block_timestamp,'second') as seconds, 
count(DISTINCT tx_hash) as txns
from bnb
group by 1
)

select trunc(seconds,'day') as daily,
avg(txns) as "Avg TPS",
median(txns) as "Median TPS",
max(txns) as "Max TPS"
from txns
group by 1
order by 1 asc 
 

 

