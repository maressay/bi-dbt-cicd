
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_1a3ff23792c302ce1ccc93d355f8b582]
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

    [dbt_test__audit.testview_1a3ff23792c302ce1ccc93d355f8b582]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_1a3ff23792c302ce1ccc93d355f8b582]
  ;')