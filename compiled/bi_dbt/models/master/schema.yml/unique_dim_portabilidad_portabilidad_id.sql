
    
    

select
    portabilidad_id as unique_field,
    count(*) as n_records

from "DB_BI"."master"."dim_portabilidad"
where portabilidad_id is not null
group by portabilidad_id
having count(*) > 1


