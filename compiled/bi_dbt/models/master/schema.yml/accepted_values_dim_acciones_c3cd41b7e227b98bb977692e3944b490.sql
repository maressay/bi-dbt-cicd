
    
    

with all_values as (

    select
        tipo_accion as value_field,
        count(*) as n_records

    from "DB_BI"."master"."dim_acciones"
    group by tipo_accion

)

select *
from all_values
where value_field not in (
    'MODIFICACION','ASISTENCIA','CONSULTA'
)


