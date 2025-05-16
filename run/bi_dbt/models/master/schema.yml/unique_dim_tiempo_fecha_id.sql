
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_60acd4f6e4219a2f9c878008dc7a40f6]
   as 
    
    

select
    fecha_id as unique_field,
    count(*) as n_records

from "DB_BI"."master"."dim_tiempo"
where fecha_id is not null
group by fecha_id
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

    [dbt_test__audit.testview_60acd4f6e4219a2f9c878008dc7a40f6]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_60acd4f6e4219a2f9c878008dc7a40f6]
  ;')