
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_fba4903b4c99c6430ea70bebe4229a4b]
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

    [dbt_test__audit.testview_fba4903b4c99c6430ea70bebe4229a4b]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_fba4903b4c99c6430ea70bebe4229a4b]
  ;')