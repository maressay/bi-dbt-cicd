
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_979fbffc97097bf41b95cce8f3e61a88]
   as 
    
    



select dias_portabilidad_esperada
from "DB_BI"."master"."fact_portabilidad"
where dias_portabilidad_esperada is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_979fbffc97097bf41b95cce8f3e61a88]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_979fbffc97097bf41b95cce8f3e61a88]
  ;')