
    
    

select
    accion_id as unique_field,
    count(*) as n_records

from "DB_BI"."master"."dim_acciones"
where accion_id is not null
group by accion_id
having count(*) > 1


