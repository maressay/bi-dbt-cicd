
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_da01877840605af4d78798dafff73bc2]
   as 
    
    

select
    id as unique_field,
    count(*) as n_records

from "DB_BI"."master"."fact_portabilidad"
where id is not null
group by id
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

    [dbt_test__audit.testview_da01877840605af4d78798dafff73bc2]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_da01877840605af4d78798dafff73bc2]
  ;')