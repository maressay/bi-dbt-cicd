
    
    

select
    solicitud_id as unique_field,
    count(*) as n_records

from "DB_BI"."master"."dim_solicitud"
where solicitud_id is not null
group by solicitud_id
having count(*) > 1


