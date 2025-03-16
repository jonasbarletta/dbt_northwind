SELECT 
    p.product_name, 
    SUM(od.unit_price * od.quantity * (1.0 - od.discount)) AS sales
FROM {{ref('stg_ecommerce__products')}} p
INNER JOIN {{ref('stg_ecommerce__order_details')}} od ON od.product_id = p.product_id
GROUP BY p.product_name
ORDER BY sales DESC