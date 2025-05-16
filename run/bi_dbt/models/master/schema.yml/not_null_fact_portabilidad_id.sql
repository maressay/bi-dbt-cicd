
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_b17ed2286f8a3267c5d64ebd1f538e8b]
   as 
    
    



select id
from "DB_BI"."master"."fact_portabilidad"
where id is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_b17ed2286f8a3267c5d64ebd1f538e8b]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_b17ed2286f8a3267c5d64ebd1f538e8b]
  ;')