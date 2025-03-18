SELECT 
    company_name, 
    SUM(unit_price * quantity * (1.0 - discount)) AS total
FROM 
    {{ref('int_join_customer_order_details')}} 
GROUP BY 
    company_name
ORDER BY 
    total DESC