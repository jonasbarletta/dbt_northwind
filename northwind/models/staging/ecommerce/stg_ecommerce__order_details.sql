SELECT 
    order_id,
    product_id,
    unit_price,
    quantity,
    discount
FROM {{ref('raw_ecommerce__order_details')}}