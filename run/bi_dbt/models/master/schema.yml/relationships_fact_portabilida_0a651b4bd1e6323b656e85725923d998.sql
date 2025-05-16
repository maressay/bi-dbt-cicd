
  
  

  
  USE [DB_BI];
  EXEC('create view 

    [dbt_test__audit.testview_d01d3a18e7a370a4f979bf1af2ccd152]
   as 
    
    

with child as (
    select solicitud_id as from_field
    from "DB_BI"."master"."fact_portabilidad"
    where solicitud_id is not null
),

parent as (
    select solicitud_id as to_field
    from "DB_BI"."master"."dim_solicitud"
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

    [dbt_test__audit.testview_d01d3a18e7a370a4f979bf1af2ccd152]
  
  ) dbt_internal_test;

  USE [DB_BI];
  EXEC('drop view 

    [dbt_test__audit.testview_d01d3a18e7a370a4f979bf1af2ccd152]
  ;')