
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_f840d9a3d6c806181eb62f1566924e99]
   as 
    
    



select dias_portabilidad_real
from "DB_BI"."master"."fact_portabilidad"
where dias_portabilidad_real is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_f840d9a3d6c806181eb62f1566924e99]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_f840d9a3d6c806181eb62f1566924e99]
  ;')