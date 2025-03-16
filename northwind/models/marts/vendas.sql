-- Configuracao para incremental
{{config(
    materialized='incremental', 
    unique_key='transaction_id',
    on_schema_change='fail' 
)}}


SELECT 
    *
FROM 
    {{ref('stg_ecommerce__nova_tabela')}}

-- Macro para o incremental

{% if is_incremental() %}

    -- incremental pela data (this = vendas)
    where date > (select max(date) from {{this}})

{% endif %}
