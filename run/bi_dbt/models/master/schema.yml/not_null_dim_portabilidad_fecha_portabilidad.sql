
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_4f607e4f1a2b4720d6710aab05fff9d2]
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

    [dbt_test__audit.testview_4f607e4f1a2b4720d6710aab05fff9d2]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_4f607e4f1a2b4720d6710aab05fff9d2]
  ;')