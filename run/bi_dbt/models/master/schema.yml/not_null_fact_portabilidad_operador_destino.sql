
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_f68b9e880eeae8ee5efc085c4197abc9]
   as 
    
    



select operador_destino
from "DB_BI"."master"."fact_portabilidad"
where operador_destino is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_f68b9e880eeae8ee5efc085c4197abc9]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_f68b9e880eeae8ee5efc085c4197abc9]
  ;')