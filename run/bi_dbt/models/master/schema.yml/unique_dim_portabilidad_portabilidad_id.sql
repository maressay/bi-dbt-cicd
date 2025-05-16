
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_645cd335fdc63e7861b6d600e00fd4f0]
   as 
    
    

select
    portabilidad_id as unique_field,
    count(*) as n_records

from "DB_BI"."master"."dim_portabilidad"
where portabilidad_id is not null
group by portabilidad_id
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

    [dbt_test__audit.testview_645cd335fdc63e7861b6d600e00fd4f0]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_645cd335fdc63e7861b6d600e00fd4f0]
  ;')