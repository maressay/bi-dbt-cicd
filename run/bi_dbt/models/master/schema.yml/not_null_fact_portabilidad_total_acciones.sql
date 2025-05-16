
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_b480f6cdfc69e87ce2aef25110e8929c]
   as 
    
    



select total_acciones
from "DB_BI"."master"."fact_portabilidad"
where total_acciones is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_b480f6cdfc69e87ce2aef25110e8929c]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_b480f6cdfc69e87ce2aef25110e8929c]
  ;')