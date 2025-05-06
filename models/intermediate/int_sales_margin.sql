SELECT 
    date_date
    ,orders_id
    ,product_id
    ,revenue
    ,quantity
    ,purchase_price
    ,quantity * purchase_price AS purchase_cost
    ,(revenue - (quantity * purchase_price)) AS margin
FROM {{ source('raw','sales')}}
LEFT JOIN {{ source('raw','product')}}
USING (product_id)