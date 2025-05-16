
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_28c03f99ee8c43a4628fe7b3679d3d9d]
   as 
    
    



select es_port_in
from "DB_BI"."master"."fact_portabilidad"
where es_port_in is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_28c03f99ee8c43a4628fe7b3679d3d9d]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_28c03f99ee8c43a4628fe7b3679d3d9d]
  ;')