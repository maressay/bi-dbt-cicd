
  
    USE [DB_BI];
    USE [DB_BI];
    
    

    

    
    USE [DB_BI];
    EXEC('
        create view "staging"."stg_accion_cliente__dbt_tmp__dbt_tmp_vw" as 

select
    cast(accion_id as int) as accion_id,
    cast(solicitud_id as int) as solicitud_id,
    UPPER(
        CASE
            WHEN tipo_accion = ''Modificaci+ªn'' THEN ''Modificacion''
            WHEN tipo_accion = ''Asistencia'' THEN ''Asistencia''
            WHEN tipo_accion = ''Consulta'' THEN ''Consulta''
            ELSE tipo_accion
        END
    ) AS tipo_accion,
    try_cast(fecha_accion as date) as fecha_accion,
    resultado_accion,
    CAST(comentarios AS VARCHAR(8000)) AS comentarios
from "DB_BI"."raw"."accion_cliente"
where accion_id is not null;
    ')

EXEC('
            SELECT * INTO "DB_BI"."staging"."stg_accion_cliente__dbt_tmp" FROM "DB_BI"."staging"."stg_accion_cliente__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS staging.stg_accion_cliente__dbt_tmp__dbt_tmp_vw')



    
    


  