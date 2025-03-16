with renamed as (
      SELECT
          coluna1 AS transaction_id,
          coluna5 AS customer_id,
          coluna2 AS customer_name,
          coluna3 AS transaction_value,
          coluna4 AS date
      FROM 
          {{ref('raw_ecommerce__nova_tabela')}}
)

SELECT * 
FROM renamed