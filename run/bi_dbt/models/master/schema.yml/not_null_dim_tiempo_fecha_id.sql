
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_fdc9781cf931cfb380048b5f4d77b04c]
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

    [dbt_test__audit.testview_fdc9781cf931cfb380048b5f4d77b04c]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_fdc9781cf931cfb380048b5f4d77b04c]
  ;')