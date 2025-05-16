
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_fd52e4cec9494578fb43e1caee2c73e3]
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

    [dbt_test__audit.testview_fd52e4cec9494578fb43e1caee2c73e3]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_fd52e4cec9494578fb43e1caee2c73e3]
  ;')