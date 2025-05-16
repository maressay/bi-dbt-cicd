
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_e199dc0849c9d164fedcd75a377bbecd]
   as 
    
    



select usuario_id
from "DB_BI"."master"."fact_portabilidad"
where usuario_id is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_e199dc0849c9d164fedcd75a377bbecd]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_e199dc0849c9d164fedcd75a377bbecd]
  ;')