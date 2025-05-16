
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_67a0963e7f93c7f9711f9eb4933a7252]
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

    [dbt_test__audit.testview_67a0963e7f93c7f9711f9eb4933a7252]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_67a0963e7f93c7f9711f9eb4933a7252]
  ;')