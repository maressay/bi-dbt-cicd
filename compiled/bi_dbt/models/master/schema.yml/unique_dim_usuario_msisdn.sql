
    
    

select
    msisdn as unique_field,
    count(*) as n_records

from "DB_BI"."master"."dim_usuario"
where msisdn is not null
group by msisdn
having count(*) > 1


