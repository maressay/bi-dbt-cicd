
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_6f6392a337ae029cfad9b79830edf8b1]
   as 
    
    



select dias_portabilidad_esperada
from "DB_BI"."master"."fact_portabilidad"
where dias_portabilidad_esperada is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_6f6392a337ae029cfad9b79830edf8b1]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_6f6392a337ae029cfad9b79830edf8b1]
  ;')