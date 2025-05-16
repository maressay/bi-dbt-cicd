


with numeros as (
    SELECT TOP (1000) ROW_NUMBER() over (ORDER BY (SELECT null)) - 1 as n
    from sys.all_objects
),

fechas as (
    select 
        DATEADD(DAY, n, DATEADD(DAY, -1000, CAST(GETDATE() AS DATE))) as fecha
    from numeros
),

fechas_faltantes as (
    select
        fecha_solicitud as fecha
    from "DB_BI"."staging"."stg_solicitud"
    where fecha_solicitud is not null

    union all

    select
        fecha_portabilidad as fecha
    from "DB_BI"."staging"."stg_solicitud"
    where fecha_portabilidad is not null

),

fechas_completas as (
    select distinct fecha from fechas
    union all
    select distinct fecha from fechas_faltantes
)


select
    distinct
    fecha as fecha_id,
    year(fecha) as anio,
    month(fecha) as mes,
    datename(month, fecha) as mes_nombre,
    day(fecha) as dia,
    datename(day, fecha) as dia_nombre,
    case when datepart(weekday, fecha) in (1, 7) then 1 else 0 end as es_fin_de_semana
from fechas_completas