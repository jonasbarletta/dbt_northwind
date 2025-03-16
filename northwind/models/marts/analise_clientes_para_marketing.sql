SELECT *
FROM {{ref('analise_receita_total_por_grupo_de_clientes')}}
WHERE group_number >= 3


