

with segmentos as (
    select
        distinct segmento as segmento_nombre
    from "DB_BI"."staging"."stg_usuario"
    where segmento is not null
)

select 
    dense_rank() over (order by segmento_nombre) as segmento_id,
    segmento_nombre
from segmentos