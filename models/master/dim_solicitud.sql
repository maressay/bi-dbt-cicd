
{{ config(materialized='table', as_columnstore=false) }}

select 
    solicitud_id as solicitud_id,
    msisdn as msisdn,
    operador_origen as operador_origen,
    operador_destino as operador_destino,
    estado_solicitud,
    s.fecha_solicitud as fecha_solicitud,
    s.fecha_portabilidad as fecha_portabilidad
from {{ ref('stg_solicitud') }} as s