
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_c869f6bc259cdce0d4a7ad99415e510f]
   as 
    
    



select solicitud_id
from "DB_BI"."master"."dim_acciones"
where solicitud_id is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_c869f6bc259cdce0d4a7ad99415e510f]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_c869f6bc259cdce0d4a7ad99415e510f]
  ;')