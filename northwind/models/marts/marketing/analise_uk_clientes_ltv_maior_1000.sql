SELECT 
    contact_name,
    SUM(unit_price * quantity * (1.0 - discount) * 100) / 100 AS payments
FROM 
    {{ref('int_join_customer_order_details')}}
WHERE 
    LOWER(country) = 'uk'
GROUP BY 
    contact_name
HAVING 
    SUM(unit_price * quantity * (1.0 - discount)) > 1000