
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_e371f66dcb3f2880cec3c9fdc805f2ec]
   as 
    
    



select tipo_accion
from "DB_BI"."master"."dim_acciones"
where tipo_accion is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_e371f66dcb3f2880cec3c9fdc805f2ec]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_e371f66dcb3f2880cec3c9fdc805f2ec]
  ;')