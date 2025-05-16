
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_c94b83ea87040f65fe24b9f9b66d13fd]
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

    [dbt_test__audit.testview_c94b83ea87040f65fe24b9f9b66d13fd]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_c94b83ea87040f65fe24b9f9b66d13fd]
  ;')