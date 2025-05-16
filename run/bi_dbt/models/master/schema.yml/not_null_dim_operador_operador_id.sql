
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_425b9475ed45b96779a0f01825925dc2]
   as 
    
    



select operador_id
from "DB_BI"."master"."dim_operador"
where operador_id is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_425b9475ed45b96779a0f01825925dc2]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_425b9475ed45b96779a0f01825925dc2]
  ;')