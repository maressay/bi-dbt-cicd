
    
    

with child as (
    select fecha_id as from_field
    from "DB_BI"."master"."fact_portabilidad"
    where fecha_id is not null
),

parent as (
    select fecha_id as to_field
    from "DB_BI"."master"."dim_tiempo"
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


