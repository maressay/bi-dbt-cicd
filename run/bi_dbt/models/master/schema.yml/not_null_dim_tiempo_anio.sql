
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_5f98c38416da1c633dbd2b8ac0bdd784]
   as 
    
    



select anio
from "DB_BI"."master"."dim_tiempo"
where anio is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_5f98c38416da1c633dbd2b8ac0bdd784]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_5f98c38416da1c633dbd2b8ac0bdd784]
  ;')