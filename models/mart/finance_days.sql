{{ config(materialized='table') }}
SELECT
date_date,
COUNT(orders_id)AS nb_transactions,
ROUND(SUM(total_revenue),2)AS revenue,
ROUND(SUM(total_revenue)/COUNT(orders_id),2) AS avg_basket,
ROUND(SUM(margin),2) AS margin,
ROUND(SUM(operational_cost),2)AS ops_margin
FROM {{ ref('int_orders_operational') }}
GROUP BY date_date