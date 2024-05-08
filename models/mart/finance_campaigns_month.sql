SELECT
CONCAT(EXTRACT(YEAR FROM date_date),"-",EXTRACT(MONTH FROM date_date)) AS month_year,
SUM(nb_transactions) AS nb_transactions,
ROUND(SUM(revenue)) AS revenue,
ROUND(SUM(avg_basket)) AS avg_basket,
ROUND(SUM(margin)) AS revmarginenue,
ROUND(SUM(ops_margin)) AS ops_margin,
ROUND(SUM(ads_margin)) AS ads_margin,
FROM{{ ref('finance_campaigns_day') }}
GROUP BY month_year
ORDER BY month_year
