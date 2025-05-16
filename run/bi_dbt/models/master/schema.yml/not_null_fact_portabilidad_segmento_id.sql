
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_07810a76e0b4d44469a0bec002ddc2a4]
   as 
    
    



select segmento_id
from "DB_BI"."master"."fact_portabilidad"
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

    [dbt_test__audit.testview_07810a76e0b4d44469a0bec002ddc2a4]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_07810a76e0b4d44469a0bec002ddc2a4]
  ;')