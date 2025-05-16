
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_8bdafe363630e6d990fab02a9a88b18d]
   as 
    
    

with child as (
    select operador_origen as from_field
    from "DB_BI"."master"."fact_portabilidad"
    where operador_origen is not null
),

parent as (
    select operador_id as to_field
    from "DB_BI"."master"."dim_operador"
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


;')
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select  * from 

    [dbt_test__audit.testview_8bdafe363630e6d990fab02a9a88b18d]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_8bdafe363630e6d990fab02a9a88b18d]
  ;')