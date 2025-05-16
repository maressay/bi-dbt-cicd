
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_71e749425c394a8e3c170015ec2c1b31]
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

    [dbt_test__audit.testview_71e749425c394a8e3c170015ec2c1b31]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_71e749425c394a8e3c170015ec2c1b31]
  ;')