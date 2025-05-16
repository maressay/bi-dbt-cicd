
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_5af1daf4cedd67ac3d6af86d770fe0db]
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

    [dbt_test__audit.testview_5af1daf4cedd67ac3d6af86d770fe0db]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_5af1daf4cedd67ac3d6af86d770fe0db]
  ;')