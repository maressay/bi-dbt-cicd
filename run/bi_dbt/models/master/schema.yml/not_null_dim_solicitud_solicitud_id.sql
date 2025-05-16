
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_0b966e100107dcbc1b6723fb1e814c4b]
   as 
    
    



select solicitud_id
from "DB_BI"."master"."dim_solicitud"
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

    [dbt_test__audit.testview_0b966e100107dcbc1b6723fb1e814c4b]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_0b966e100107dcbc1b6723fb1e814c4b]
  ;')