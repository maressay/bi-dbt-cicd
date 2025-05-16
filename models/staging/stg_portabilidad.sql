
{{ config(materialized='table', as_columnstore=false) }}

select
    cast(portabilidad_id as int) as portabilidad_id,
    cast(solicitud_id as int) as solicitud_id,
    try_cast(fecha_portabilidad as date) as fecha_portabilidad,
    upper(operador_origen) as operador_origen,
    upper(operador_destino) as operador_destino,
    estado_portabilidad
from {{ source('raw', 'portabilidad_exitosa') }} 
where portabilidad_id is not null