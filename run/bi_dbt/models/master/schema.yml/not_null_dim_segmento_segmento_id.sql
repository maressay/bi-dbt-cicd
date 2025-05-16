
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_80ffb0d72f3534b84e2a3c37bb428e76]
   as 
    
    



select segmento_id
from "DB_BI"."master"."dim_segmento"
where segmento_id is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_80ffb0d72f3534b84e2a3c37bb428e76]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_80ffb0d72f3534b84e2a3c37bb428e76]
  ;')