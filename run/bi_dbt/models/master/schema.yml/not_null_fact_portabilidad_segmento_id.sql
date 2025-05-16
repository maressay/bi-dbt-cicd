
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_b5d31a40cf62c9d472b8cc7a861ade55]
   as 
    
    



select segmento_id
from "DB_BI"."master"."fact_portabilidad"
where segmento_id is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_b5d31a40cf62c9d472b8cc7a861ade55]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_b5d31a40cf62c9d472b8cc7a861ade55]
  ;')