
  
    USE [DB_BI];
    USE [DB_BI];
    
    

    

    
    USE [DB_BI];
    EXEC('
        create view "staging"."stg_usuario__dbt_tmp__dbt_tmp_vw" as 

select
    cast(msisdn as VARCHAR(255)) as msisdn,
    trim(segmento) as segmento,
    upper(departamento) as departamento,
    upper(provincia) as provincia,
    upper(distrito) as distrito,
    upper(marca) as marca,
    upper(modelo) as modelo,
    cast(status as int) as status
from "DB_BI"."raw"."usuario"
where msisdn is not null
and len(cast(msisdn as VARCHAR(255))) = 11
and status = ''1'';
    ')

EXEC('
            SELECT * INTO "DB_BI"."staging"."stg_usuario__dbt_tmp" FROM "DB_BI"."staging"."stg_usuario__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS staging.stg_usuario__dbt_tmp__dbt_tmp_vw')



    
    


  