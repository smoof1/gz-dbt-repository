SELECT 
    date_date
    ,orders_id
    ,s.product_id
    ,revenue
    ,quantity
    ,purchase_price
    ,quantity * purchase_price AS purchase_cost
    ,(revenue - (quantity * purchase_price)) AS margin
FROM {{ ref('stg_raw__sales')}} s
LEFT JOIN {{ ref('stg_raw__product')}} p
ON s.product_id=p.product_id