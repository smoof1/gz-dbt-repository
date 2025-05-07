SELECT 
    i.orders_id
    ,date_date
    ,ROUND((margin + shipping_fee - logcost -ship_cost),2) AS operational_margin
    ,i.revenue
    ,i.quantity
    ,i.purchase_cost
    ,i.margin
    ,s.shipping_fee
    ,s.logcost
    ,s.ship_cost
FROM {{ ref('int_orders_margin')}} i
LEFT JOIN {{ ref('stg_raw__ship')}} s
ON i.orders_id=s.orders_id
ORDER BY date_date DESC, orders_id DESC