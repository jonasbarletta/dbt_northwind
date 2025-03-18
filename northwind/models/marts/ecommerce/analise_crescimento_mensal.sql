WITH receitasMensais AS (
    SELECT
        EXTRACT(YEAR FROM o.order_date) AS ano,
        EXTRACT(MONTH FROM o.order_date) AS mes,
        SUM(od.unit_price * od.quantity * (1.0 - od.discount)) AS receita_mensal
    FROM
        {{ref('stg_ecommerce__orders')}} o
    INNER JOIN
        {{ref('stg_ecommerce__order_details')}} od ON o.order_id = od.order_id
    GROUP BY
        EXTRACT(YEAR FROM o.order_date),
        EXTRACT(MONTH FROM o.order_date)
),
receitasAcumuladas AS (
    SELECT
        ano,
        mes,
        receita_mensal,
        SUM(receita_mensal) OVER (PARTITION BY ano ORDER BY mes) AS receita_ytd
    FROM
        receitasMensais
)
SELECT
    ano,
    mes,
    receita_mensal,
    receita_mensal - LAG(receita_mensal) OVER (PARTITION BY ano ORDER BY mes) AS diferenca_mensal,
    receita_ytd,
    (receita_mensal - LAG(receita_mensal) OVER (PARTITION BY ano ORDER BY mes)) / LAG(receita_mensal) OVER (PARTITION BY ano ORDER BY mes) * 100 AS percentual_mudanca_mensal
FROM
    receitasAcumuladas
ORDER BY
    ano, mes