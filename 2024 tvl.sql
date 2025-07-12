WITH tvl AS (
    SELECT
        date,
        date_part('month', date) AS month,
        date_part('year', date) AS year,
        chain,
        tvl_usd
    FROM 
        external.defillama.fact_chain_tvl
    WHERE 
        date BETWEEN '2024-01-01' AND '2024-12-31'
)

SELECT
    CASE
        WHEN month = 3 THEN 'Q1'
        WHEN month = 6 THEN 'Q2'
        WHEN month = 9 THEN 'Q3'
        WHEN month = 12 THEN 'Q4'
    END AS quarter,
    tvl_usd
FROM 
    tvl
WHERE 
    chain IN ('Binance')
    AND date IN (
        '2024-03-31', 
        '2024-06-30', 
        '2024-09-30', 
        '2024-12-31'
    )  -- Filter for the last day of each quarter
--GROUP BY 
    --quarter
ORDER BY 
    quarter;