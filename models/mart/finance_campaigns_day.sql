WITH finance AS (
SELECT*
FROM {{ ref('finance_days') }}
),
campaign AS (
SELECT*
FROM {{ ref('int_campaigns_day') }}
)
SELECT 
fin.*,
ROUND(ops_margin-camp.ads_cost,2) AS ads_margin
FROM finance AS fin
JOIN campaign as camp
USING(date_date)

