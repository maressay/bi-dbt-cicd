
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_0bb714999a8cc5b3fe04cc4fb34861f0]
   as 
    
    

select
    solicitud_id as unique_field,
    count(*) as n_records

from "DB_BI"."master"."dim_solicitud"
where solicitud_id is not null
group by solicitud_id
having count(*) > 1


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_0bb714999a8cc5b3fe04cc4fb34861f0]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_0bb714999a8cc5b3fe04cc4fb34861f0]
  ;')