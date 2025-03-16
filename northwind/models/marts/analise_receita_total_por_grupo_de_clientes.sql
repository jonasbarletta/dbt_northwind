SELECT 
company_name, 
SUM(unit_price * quantity * (1.0 - discount)) AS total,
NTILE(5) OVER (ORDER BY SUM(unit_price * quantity * (1.0 - discount)) DESC) AS group_number
FROM 
    {{ref('int_join_customer_order_details')}}
GROUP BY 
    company_name
ORDER BY 
    total DESC