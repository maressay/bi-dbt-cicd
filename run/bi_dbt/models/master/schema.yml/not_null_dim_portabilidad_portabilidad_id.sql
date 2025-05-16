
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_b6bf9a28a6ca48b505d7c97fd0f59470]
   as 
    
    



select portabilidad_id
from "DB_BI"."master"."dim_portabilidad"
where portabilidad_id is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_b6bf9a28a6ca48b505d7c97fd0f59470]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_b6bf9a28a6ca48b505d7c97fd0f59470]
  ;')