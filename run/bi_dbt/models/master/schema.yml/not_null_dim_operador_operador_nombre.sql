
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_a0f844f0deed8fd86d0b42c48c86a716]
   as 
    
    



select operador_nombre
from "DB_BI"."master"."dim_operador"
where operador_nombre is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_a0f844f0deed8fd86d0b42c48c86a716]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_a0f844f0deed8fd86d0b42c48c86a716]
  ;')