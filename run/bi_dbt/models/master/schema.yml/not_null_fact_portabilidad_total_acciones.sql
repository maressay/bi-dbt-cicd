
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_d04dff054080803ddfbf56ba374d00e2]
   as 
    
    



select total_acciones
from "DB_BI"."master"."fact_portabilidad"
where total_acciones is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_d04dff054080803ddfbf56ba374d00e2]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_d04dff054080803ddfbf56ba374d00e2]
  ;')