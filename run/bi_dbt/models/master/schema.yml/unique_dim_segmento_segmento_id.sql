
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_701e0792519a509dde9356880a1ffa29]
   as 
    
    

select
    segmento_id as unique_field,
    count(*) as n_records

from "DB_BI"."master"."dim_segmento"
where segmento_id is not null
group by segmento_id
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

    [dbt_test__audit.testview_701e0792519a509dde9356880a1ffa29]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_701e0792519a509dde9356880a1ffa29]
  ;')