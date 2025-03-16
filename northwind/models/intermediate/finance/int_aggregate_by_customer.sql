WITH aggregate_by_customer AS (
    SELECT
    customer_id,
    SUM(transaction_value) AS total_value
    FROM 
    {{ref('stg_ecommerce__nova_tabela')}}
    GROUP BY customer_id
)

SELECT *
FROM aggregate_by_customer