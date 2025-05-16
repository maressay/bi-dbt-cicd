
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_fb88fad585e2d0f9ea7653005ebfb8c4]
   as 
    
    

select
    operador_id as unique_field,
    count(*) as n_records

from "DB_BI"."master"."dim_operador"
where operador_id is not null
group by operador_id
having count(*) > 1


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_fb88fad585e2d0f9ea7653005ebfb8c4]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_fb88fad585e2d0f9ea7653005ebfb8c4]
  ;')