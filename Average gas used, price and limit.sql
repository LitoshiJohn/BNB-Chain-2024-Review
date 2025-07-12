SELECT 
avg(gas_price),
avg(gas_limit),
avg(gas_used),
avg((gas_price * gas_limit) / 10e9) as avg_tx_fee
from bsc.core.fact_transactions
WHERE block_timestamp::date BETWEEN '2024-01-01' and '2024-12-31'