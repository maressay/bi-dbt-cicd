
    
    

with child as (
    select usuario_id as from_field
    from "DB_BI"."master"."fact_portabilidad"
    where usuario_id is not null
),

parent as (
    select msisdn as to_field
    from "DB_BI"."master"."dim_usuario"
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


