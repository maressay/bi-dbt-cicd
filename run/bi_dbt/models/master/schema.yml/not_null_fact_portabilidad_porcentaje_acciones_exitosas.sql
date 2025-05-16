
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_13360ac4fe02cd8b68819f71e765c916]
   as 
    
    



select porcentaje_acciones_exitosas
from "DB_BI"."master"."fact_portabilidad"
where porcentaje_acciones_exitosas is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_13360ac4fe02cd8b68819f71e765c916]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_13360ac4fe02cd8b68819f71e765c916]
  ;')