WITH total_revenue_1997 AS
(SELECT 
SUM((od.unit_price) * od.quantity * (1.0 - od.discount)) AS total_revenues_1997
FROM {{ref('stg_ecommerce__order_details')}} od
INNER JOIN (
    SELECT order_id 
    FROM {{ref('stg_ecommerce__orders')}} 
    WHERE EXTRACT(YEAR FROM order_date) = '1997'
) AS o
ON o.order_id = od.order_id)

SELECT * 
FROM total_revenue_1997