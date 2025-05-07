SELECT 
    orders_id
    ,date_date
    ,SUM(revenue) AS revenue
    ,SUM(quantity) AS quantity
    ,SUM(quantity * purchase_price) AS purchase_cost
    ,SUM((revenue - (quantity * purchase_price)))  AS margin
FROM {{ ref('stg_raw__sales')}} s
LEFT JOIN {{ ref('stg_raw__product')}} p
ON s.product_id=p.products_id
GROUP BY orders_id, date_date
ORDER BY date_date DESC, orders_id DESC