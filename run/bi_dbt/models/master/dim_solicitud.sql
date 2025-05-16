
  
    USE [DB_BI];
    USE [DB_BI];
    
    

    

    
    USE [DB_BI];
    EXEC('
        create view "master"."dim_solicitud__dbt_tmp__dbt_tmp_vw" as 

select 
    solicitud_id as solicitud_id,
    msisdn as msisdn,
    operador_origen as operador_origen,
    operador_destino as operador_destino,
    estado_solicitud,
    s.fecha_solicitud as fecha_solicitud,
    s.fecha_portabilidad as fecha_portabilidad
from "DB_BI"."staging"."stg_solicitud" as s;
    ')

EXEC('
            SELECT * INTO "DB_BI"."master"."dim_solicitud__dbt_tmp" FROM "DB_BI"."master"."dim_solicitud__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS master.dim_solicitud__dbt_tmp__dbt_tmp_vw')



    
    


  