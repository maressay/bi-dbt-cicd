
    
    

select
    operador_id as unique_field,
    count(*) as n_records

from "DB_BI"."master"."dim_operador"
where operador_id is not null
group by operador_id
having count(*) > 1


