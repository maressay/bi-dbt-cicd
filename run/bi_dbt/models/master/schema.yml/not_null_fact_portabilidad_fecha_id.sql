
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_0253b6ab104bc9b785b3a4b74798db8e]
   as 
    
    



select fecha_id
from "DB_BI"."master"."fact_portabilidad"
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

    [dbt_test__audit.testview_0253b6ab104bc9b785b3a4b74798db8e]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_0253b6ab104bc9b785b3a4b74798db8e]
  ;')