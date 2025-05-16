
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_96cea6bedae4b496e13fa19db2c5ae76]
   as 
    
    

select
    msisdn as unique_field,
    count(*) as n_records

from "DB_BI"."master"."dim_usuario"
where msisdn is not null
group by msisdn
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

    [dbt_test__audit.testview_96cea6bedae4b496e13fa19db2c5ae76]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_96cea6bedae4b496e13fa19db2c5ae76]
  ;')