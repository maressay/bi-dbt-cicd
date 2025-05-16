
  
    USE [DB_BI];
    USE [DB_BI];
    
    

    

    
    USE [DB_BI];
    EXEC('
        create view "master"."dim_portabilidad__dbt_tmp__dbt_tmp_vw" as 

select
    p.portabilidad_id as portabilidad_id,
    p.solicitud_id as solicitud_id,
    p.fecha_portabilidad as fecha_portabilidad,
    p.operador_origen as operador_origen,
    p.operador_destino as operador_destino
from "DB_BI"."staging"."stg_portabilidad" as p
where p.fecha_portabilidad >= DATEADD(YEAR, -3, CAST(GETDATE() as DATE));
    ')

EXEC('
            SELECT * INTO "DB_BI"."master"."dim_portabilidad__dbt_tmp" FROM "DB_BI"."master"."dim_portabilidad__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS master.dim_portabilidad__dbt_tmp__dbt_tmp_vw')



    
    


  