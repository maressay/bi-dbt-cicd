
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_4be1637a878375a3c0ffa16ec8508c67]
   as 
    
    

with child as (
    select usuario_id as from_field
    from "DB_BI"."master"."fact_portabilidad"
    where usuario_id is not null
),

parent as (
    select msisdn as to_field
    from "DB_BI"."master"."dim_usuario"
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

    [dbt_test__audit.testview_4be1637a878375a3c0ffa16ec8508c67]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_4be1637a878375a3c0ffa16ec8508c67]
  ;')