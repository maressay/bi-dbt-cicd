
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_8ed741928805387f472ecb326c0c9315]
   as 
    
    



select diferencia_portabilidad_programada_real
from "DB_BI"."master"."fact_portabilidad"
where diferencia_portabilidad_programada_real is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_8ed741928805387f472ecb326c0c9315]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_8ed741928805387f472ecb326c0c9315]
  ;')