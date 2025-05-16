
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_9d7746982acf9528990de2560fd4c09d]
   as 
    
    

with child as (
    select operador_destino as from_field
    from "DB_BI"."master"."fact_portabilidad"
    where operador_destino is not null
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

    [dbt_test__audit.testview_9d7746982acf9528990de2560fd4c09d]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_9d7746982acf9528990de2560fd4c09d]
  ;')