
{{ config(materialized='table', as_columnstore=false) }}

select
    cast(accion_id as int) as accion_id,
    cast(solicitud_id as int) as solicitud_id,
    UPPER(
        CASE
            WHEN tipo_accion = 'Modificaci+ªn' THEN 'Modificacion'
            WHEN tipo_accion = 'Asistencia' THEN 'Asistencia'
            WHEN tipo_accion = 'Consulta' THEN 'Consulta'
            ELSE tipo_accion
        END
    ) AS tipo_accion,
    try_cast(fecha_accion as date) as fecha_accion,
    resultado_accion,
    CAST(comentarios AS VARCHAR(8000)) AS comentarios
from {{ source('raw', 'accion_cliente') }}
where accion_id is not null