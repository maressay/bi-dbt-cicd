

with operadores as (
    select
        x.operador_origen as operador_nombre
    from "DB_BI"."staging"."stg_solicitud" as x

    union all

    select
        y.operador_destino as operador_nombre
    from "DB_BI"."staging"."stg_solicitud" as y
),

operadores_unicos as (
    select distinct
        operador_nombre
    from operadores
)

select
    dense_rank() over (order by operador_nombre) as operador_id,
    operador_nombre
from operadores_unicos