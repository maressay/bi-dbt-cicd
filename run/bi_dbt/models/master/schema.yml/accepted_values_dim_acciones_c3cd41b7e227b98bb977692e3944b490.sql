
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_50b80e146b960bdac10a8ecd14ff6c59]
   as 
    
    

with all_values as (

    select
        tipo_accion as value_field,
        count(*) as n_records

    from "DB_BI"."master"."dim_acciones"
    group by tipo_accion

)

select *
from all_values
where value_field not in (
    ''MODIFICACION'',''ASISTENCIA'',''CONSULTA''
)


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_50b80e146b960bdac10a8ecd14ff6c59]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_50b80e146b960bdac10a8ecd14ff6c59]
  ;')