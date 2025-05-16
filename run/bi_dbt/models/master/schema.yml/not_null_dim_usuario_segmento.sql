
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_06517d2d6599f7d08261eadfe511f01e]
   as 
    
    



select segmento
from "DB_BI"."master"."dim_usuario"
where segmento is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_06517d2d6599f7d08261eadfe511f01e]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_06517d2d6599f7d08261eadfe511f01e]
  ;')