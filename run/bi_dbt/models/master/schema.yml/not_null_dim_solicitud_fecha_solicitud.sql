
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_1f3793e1f1e7d44e16b76ebc079036de]
   as 
    
    



select fecha_solicitud
from "DB_BI"."master"."dim_solicitud"
where fecha_solicitud is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_1f3793e1f1e7d44e16b76ebc079036de]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_1f3793e1f1e7d44e16b76ebc079036de]
  ;')