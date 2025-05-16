
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_6bab723ff6c7aaae0abae734cde55a04]
   as 
    
    



select fecha_solicitud
from "DB_BI"."master"."dim_solicitud"
where fecha_solicitud is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_6bab723ff6c7aaae0abae734cde55a04]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_6bab723ff6c7aaae0abae734cde55a04]
  ;')