WITH source AS (
    SELECT *
    FROM {{source('northwind', 'order_details')}}
)

SELECT 
    order_id,
    product_id,
    unit_price,
    quantity,
    discount
FROM source