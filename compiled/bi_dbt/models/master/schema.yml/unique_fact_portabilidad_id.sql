
    
    

select
    id as unique_field,
    count(*) as n_records

from "DB_BI"."master"."fact_portabilidad"
where id is not null
group by id
having count(*) > 1


