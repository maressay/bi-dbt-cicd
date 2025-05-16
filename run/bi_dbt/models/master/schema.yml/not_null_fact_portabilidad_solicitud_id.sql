
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_da72c2db1d3b6b510bbf71be815660c8]
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

    [dbt_test__audit.testview_da72c2db1d3b6b510bbf71be815660c8]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_da72c2db1d3b6b510bbf71be815660c8]
  ;')