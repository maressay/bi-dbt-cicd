
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_08cbebdaee3372cbc76f9eebc463b2e8]
   as 
    
    



select accion_id
from "DB_BI"."master"."dim_acciones"
where accion_id is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_08cbebdaee3372cbc76f9eebc463b2e8]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_08cbebdaee3372cbc76f9eebc463b2e8]
  ;')