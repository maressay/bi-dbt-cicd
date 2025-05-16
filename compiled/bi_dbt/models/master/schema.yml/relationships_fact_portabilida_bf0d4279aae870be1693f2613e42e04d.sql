
    
    

with child as (
    select operador_origen as from_field
    from "DB_BI"."master"."fact_portabilidad"
    where operador_origen is not null
),

parent as (
    select operador_id as to_field
    from "DB_BI"."master"."dim_operador"
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


