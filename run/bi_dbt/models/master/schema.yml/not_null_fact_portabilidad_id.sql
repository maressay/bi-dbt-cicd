
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_7e4b7e0bdbb52a7bda4520f3d67f2b38]
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

    [dbt_test__audit.testview_7e4b7e0bdbb52a7bda4520f3d67f2b38]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_7e4b7e0bdbb52a7bda4520f3d67f2b38]
  ;')