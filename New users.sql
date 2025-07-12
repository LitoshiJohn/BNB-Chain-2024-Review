-- forked from hess / Daily New Addresses @ https://flipsidecrypto.xyz/hess/q/u9ZeoNslK1Uv/daily-new-addresses

with new as (select min(block_timestamp::date) as date,
(from_address) as users
from bsc.core.fact_transactions
 group by 2)

select date_trunc('month',date) as Datee,
case
    when datee BETWEEN '2024-01-01'
    and '2024-03-31' then 'Q1'
    when datee BETWEEN '2024-04-01'
    and '2024-06-30' then 'Q2'
    when datee BETWEEN '2024-07-01'
    and '2024-09-30' then 'Q3'
    when datee BETWEEN '2024-10-01'
    and '2024-12-31' then 'Q4'
  end as Quarters,
count(DISTINCT users) as "New Users",
sum("New Users") over (order by datee asc) as "Cumulative New Users"
from new
where datee  BETWEEN '2024-01-01' and '2024-12-31'
group by 1,2
order by 1 asc  

