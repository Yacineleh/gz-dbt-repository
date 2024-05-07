WITH sales AS(
select * from {{ source('raw', 'sales') }}
)
,
product AS (
select * from {{ source('raw', 'product') }}
)

SELECT 
sales.date_date,
sales.orders_id, 
SUM(sales.revenue) AS total_revenue,
SUM(sales.quantity) AS qty_products,
--product.purchSE_PRICE AS purchase_price,
SUM(CAST(quantity AS float64)*CAST(purchSE_PRICE AS float64)) AS Purchase_cost,
SUM(CAST(revenue AS float64)-CAST(quantity AS float64)*CAST(purchSE_PRICE AS float64)) AS margin
FROM sales as sales
LEFT JOIN product 
ON sales.pdt_id=product.products_id
GROUP BY orders_id, date_date
order by orders_id