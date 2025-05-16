
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_9ec53f9a405c2abcad40ae4354906023]
   as 
    
    

select
    accion_id as unique_field,
    count(*) as n_records

from "DB_BI"."master"."dim_acciones"
where accion_id is not null
group by accion_id
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

    [dbt_test__audit.testview_9ec53f9a405c2abcad40ae4354906023]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_9ec53f9a405c2abcad40ae4354906023]
  ;')