
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_3b99e2df42381e4c6a31484cf50d6d93]
   as 
    
    



select operador_origen
from "DB_BI"."master"."fact_portabilidad"
where operador_origen is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_3b99e2df42381e4c6a31484cf50d6d93]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_3b99e2df42381e4c6a31484cf50d6d93]
  ;')