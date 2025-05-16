
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_a34f88b4eda3ba5bdcf5f11a1b8dc35b]
   as 
    
    



select fecha_id
from "DB_BI"."master"."dim_tiempo"
where fecha_id is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_a34f88b4eda3ba5bdcf5f11a1b8dc35b]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_a34f88b4eda3ba5bdcf5f11a1b8dc35b]
  ;')