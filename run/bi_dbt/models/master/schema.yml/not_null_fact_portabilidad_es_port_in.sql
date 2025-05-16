
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_622d7d1c932e6bfce7d40bd193f2bbfe]
   as 
    
    



select es_port_in
from "DB_BI"."master"."fact_portabilidad"
where es_port_in is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_622d7d1c932e6bfce7d40bd193f2bbfe]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_622d7d1c932e6bfce7d40bd193f2bbfe]
  ;')