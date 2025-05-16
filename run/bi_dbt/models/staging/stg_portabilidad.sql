
  
    USE [DB_BI];
    USE [DB_BI];
    
    

    

    
    USE [DB_BI];
    EXEC('
        create view "staging"."stg_portabilidad__dbt_tmp__dbt_tmp_vw" as 

select
    cast(portabilidad_id as int) as portabilidad_id,
    cast(solicitud_id as int) as solicitud_id,
    try_cast(fecha_portabilidad as date) as fecha_portabilidad,
    upper(operador_origen) as operador_origen,
    upper(operador_destino) as operador_destino,
    estado_portabilidad
from "DB_BI"."raw"."portabilidad_exitosa" 
where portabilidad_id is not null;
    ')

EXEC('
            SELECT * INTO "DB_BI"."staging"."stg_portabilidad__dbt_tmp" FROM "DB_BI"."staging"."stg_portabilidad__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS staging.stg_portabilidad__dbt_tmp__dbt_tmp_vw')



    
    


  