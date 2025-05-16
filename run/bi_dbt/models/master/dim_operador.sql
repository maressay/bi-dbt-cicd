
  
    USE [DB_BI];
    USE [DB_BI];
    
    

    

    
    USE [DB_BI];
    EXEC('
        create view "master"."dim_operador__dbt_tmp__dbt_tmp_vw" as 

with operadores as (
    select
        x.operador_origen as operador_nombre
    from "DB_BI"."staging"."stg_solicitud" as x

    union all

    select
        y.operador_destino as operador_nombre
    from "DB_BI"."staging"."stg_solicitud" as y
),

operadores_unicos as (
    select distinct
        operador_nombre
    from operadores
)

select
    dense_rank() over (order by operador_nombre) as operador_id,
    operador_nombre
from operadores_unicos;
    ')

EXEC('
            SELECT * INTO "DB_BI"."master"."dim_operador__dbt_tmp" FROM "DB_BI"."master"."dim_operador__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS master.dim_operador__dbt_tmp__dbt_tmp_vw')



    
    


  