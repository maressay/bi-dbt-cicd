
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_ec0b1dc8b5f63f94da9584ba2b6a4a11]
   as 
    
    



select operador_id
from "DB_BI"."master"."dim_operador"
where operador_id is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_ec0b1dc8b5f63f94da9584ba2b6a4a11]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_ec0b1dc8b5f63f94da9584ba2b6a4a11]
  ;')