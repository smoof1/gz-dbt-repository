SELECT 
    i.orders_id
    ,date_date
    ,SUM(margin + shipping_fee - logcost -ship_cost) AS operational_margin
    ,SUM(revenue) AS revenue
    ,SUM(quantity) AS quantity
    ,SUM(purchase_cost) AS purchase_cost
    ,SUM(margin)  AS margin
FROM {{ ref('int_orders_margin')}} i
LEFT JOIN {{ ref('stg_raw__ship')}} s
ON i.orders_id=s.orders_id
GROUP BY orders_id, date_date
ORDER BY date_date DESC, orders_id DESC