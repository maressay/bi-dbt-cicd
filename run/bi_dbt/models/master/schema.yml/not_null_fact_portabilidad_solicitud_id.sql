
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_d918e1b6c430aadedd2af09f1b2aff94]
   as 
    
    



select solicitud_id
from "DB_BI"."master"."fact_portabilidad"
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

    [dbt_test__audit.testview_d918e1b6c430aadedd2af09f1b2aff94]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_d918e1b6c430aadedd2af09f1b2aff94]
  ;')