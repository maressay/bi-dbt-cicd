
{{ config(materialized='table', as_columnstore=false) }}

select
    accion_id as accion_id,
    solicitud_id as solicitud_id,
    tipo_accion as tipo_accion,
    fecha_accion as fecha_accion,
    resultado_accion as resultado_accion,
    CAST(comentarios AS VARCHAR(8000)) AS comentarios
from {{ ref('stg_accion_cliente') }}