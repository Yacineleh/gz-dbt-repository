WITH sales AS(
select * from {{ source('raw', 'sales') }}
)
,
product AS (
select * from {{ source('raw', 'product') }}
)

SELECT 
sales.*, 
product.purchSE_PRICE AS purchase_price,
CAST(quantity AS float64)*CAST(purchSE_PRICE AS float64) AS Purchase_cost,
CAST(revenue AS float64)-CAST(quantity AS float64)*CAST(purchSE_PRICE AS float64) AS margin,
CONCAT(orders_id,"_",pdt_id) AS primary_key
FROM sales as sales
LEFT JOIN product 
ON sales.pdt_id=product.products_id
