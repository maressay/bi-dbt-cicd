
  
    USE [DB_BI];
    USE [DB_BI];
    
    

    

    
    USE [DB_BI];
    EXEC('
        create view "master"."dim_segmento__dbt_tmp__dbt_tmp_vw" as 

with segmentos as (
    select
        distinct segmento as segmento_nombre
    from "DB_BI"."staging"."stg_usuario"
    where segmento is not null
)

select 
    dense_rank() over (order by segmento_nombre) as segmento_id,
    segmento_nombre
from segmentos;
    ')

EXEC('
            SELECT * INTO "DB_BI"."master"."dim_segmento__dbt_tmp" FROM "DB_BI"."master"."dim_segmento__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS master.dim_segmento__dbt_tmp__dbt_tmp_vw')



    
    


  