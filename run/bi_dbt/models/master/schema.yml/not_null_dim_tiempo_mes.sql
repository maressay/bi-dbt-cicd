
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_71c759500abdd82c657960e038090137]
   as 
    
    



select mes
from "DB_BI"."master"."dim_tiempo"
where mes is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_71c759500abdd82c657960e038090137]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_71c759500abdd82c657960e038090137]
  ;')