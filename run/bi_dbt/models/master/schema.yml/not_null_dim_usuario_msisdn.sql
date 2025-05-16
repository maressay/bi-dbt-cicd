
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_4b56b9ae69734fe38214a74c02aedcd1]
   as 
    
    



select msisdn
from "DB_BI"."master"."dim_usuario"
where msisdn is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_4b56b9ae69734fe38214a74c02aedcd1]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_4b56b9ae69734fe38214a74c02aedcd1]
  ;')