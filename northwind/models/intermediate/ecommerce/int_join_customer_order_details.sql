SELECT
c.customer_id,
c.company_name,
c.contact_name,
c.contact_title,
c.address,
c.city,
c.region,
c.postal_code,
c.country,
c.phone,
c.fax,
o.order_id,
o.employee_id,
o.order_date,
o.required_date,
o.shipped_date,
o.ship_via,
o.ship_name,
o.ship_address,
o.ship_city,
o.ship_region,
o.ship_postal_code,
o.ship_country,
od.product_id,
od.unit_price,
od.quantity,
od.discount
FROM 
    {{ref('stg_ecommerce__customers')}} c
INNER JOIN 
    {{ref('stg_ecommerce__orders')}} o  ON c.customer_id = o.customer_id
INNER JOIN 
    {{ref('stg_ecommerce__order_details')}} od ON od.order_id = o.order_id