
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_b8cb64c049e56aa747cd5fcc7c5cd045]
   as 
    
    



select segmento_nombre
from "DB_BI"."master"."dim_segmento"
where segmento_nombre is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_b8cb64c049e56aa747cd5fcc7c5cd045]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_b8cb64c049e56aa747cd5fcc7c5cd045]
  ;')