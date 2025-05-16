
  
    USE [DB_BI];
    USE [DB_BI];
    
    

    

    
    USE [DB_BI];
    EXEC('
        create view "master"."dim_usuario__dbt_tmp__dbt_tmp_vw" as 

select
    u.msisdn as msisdn,
    u.segmento as segmento,
    u.departamento as departamento,
    u.provincia as provincia,
    u.distrito as distrito, 
    u.marca as marca, 
    u.modelo as modelo
from "DB_BI"."staging"."stg_usuario" as u;
    ')

EXEC('
            SELECT * INTO "DB_BI"."master"."dim_usuario__dbt_tmp" FROM "DB_BI"."master"."dim_usuario__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS master.dim_usuario__dbt_tmp__dbt_tmp_vw')



    
    


  