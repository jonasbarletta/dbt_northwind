WITH source AS (

    SELECT
        * 
    FROM 
        {{source('northwind', 'customers')}}

)

SELECT
    customer_id,
    company_name,
    contact_name, 
    contact_title,
    address,
    city,
    region,
    LOWER(REGEXP_REPLACE(postal_code, '[^a-zA-Z0-9]', '', 'g')) AS postal_code,
    country,    
    LOWER(REGEXP_REPLACE(phone, '[^0-9]', '', 'g')) AS phone,
    LOWER(REGEXP_REPLACE(fax, '[^0-9]', '', 'g')) AS fax
FROM source