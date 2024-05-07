SELECT 
margeee.*,
margeee.margin+CAST(shippp.shipping_fee AS float64)-CAST(logcost AS float64)-CAST(ship_cost AS float64) AS operational_cost
FROM {{ ref('int_orders_margin') }} as margeee
LEFT JOIN {{ ref('stg_raw__ship') }} AS shippp
USING (orders_id)


