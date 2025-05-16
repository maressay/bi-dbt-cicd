
  
    USE [DB_BI];
    USE [DB_BI];
    
    

    

    
    USE [DB_BI];
    EXEC('
        create view "master"."dim_acciones__dbt_tmp__dbt_tmp_vw" as 

select
    accion_id as accion_id,
    solicitud_id as solicitud_id,
    tipo_accion as tipo_accion,
    fecha_accion as fecha_accion,
    resultado_accion as resultado_accion,
    CAST(comentarios AS VARCHAR(8000)) AS comentarios
from "DB_BI"."staging"."stg_accion_cliente";
    ')

EXEC('
            SELECT * INTO "DB_BI"."master"."dim_acciones__dbt_tmp" FROM "DB_BI"."master"."dim_acciones__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS master.dim_acciones__dbt_tmp__dbt_tmp_vw')



    
    


  