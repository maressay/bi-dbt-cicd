
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_d3a449371af24c16f1acbb4578e5d2fa]
   as 
    
    

with child as (
    select fecha_id as from_field
    from "DB_BI"."master"."fact_portabilidad"
    where fecha_id is not null
),

parent as (
    select fecha_id as to_field
    from "DB_BI"."master"."dim_tiempo"
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

    [dbt_test__audit.testview_d3a449371af24c16f1acbb4578e5d2fa]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_d3a449371af24c16f1acbb4578e5d2fa]
  ;')