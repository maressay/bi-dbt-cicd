
  
    USE [DB_BI];
    USE [DB_BI];
    
    

    

    
    USE [DB_BI];
    EXEC('
        create view "staging"."stg_solicitud__dbt_tmp__dbt_tmp_vw" as 

select
    cast(solicitud_id as int) as solicitud_id,
    cast(msisdn as VARCHAR(255)) as msisdn,
    upper(operador_origen) as operador_origen,
    upper(operador_destino) as operador_destino,
    estado_solicitud,
    try_cast(fecha_solicitud as date) as fecha_solicitud,
    try_cast(fecha_portabilidad as date) as fecha_portabilidad,
    CAST(comentarios AS VARCHAR(8000)) AS comentarios
from "DB_BI"."raw"."solicitud_portabilidad"
where solicitud_id is not null;
    ')

EXEC('
            SELECT * INTO "DB_BI"."staging"."stg_solicitud__dbt_tmp" FROM "DB_BI"."staging"."stg_solicitud__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS staging.stg_solicitud__dbt_tmp__dbt_tmp_vw')



    
    


  