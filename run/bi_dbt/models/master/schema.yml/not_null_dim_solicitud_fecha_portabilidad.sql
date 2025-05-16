
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_7fb24cfa613e16b2d721cda4c26d944c]
   as 
    
    



select fecha_portabilidad
from "DB_BI"."master"."dim_solicitud"
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

    [dbt_test__audit.testview_7fb24cfa613e16b2d721cda4c26d944c]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_7fb24cfa613e16b2d721cda4c26d944c]
  ;')