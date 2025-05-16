
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_e323c028134f6290db50066a4e7e2cf0]
   as 
    
    



select fecha_portabilidad
from "DB_BI"."master"."dim_portabilidad"
where fecha_portabilidad is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_e323c028134f6290db50066a4e7e2cf0]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_e323c028134f6290db50066a4e7e2cf0]
  ;')