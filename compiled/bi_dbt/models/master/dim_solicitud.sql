

select 
    solicitud_id as solicitud_id,
    msisdn as msisdn,
    operador_origen as operador_origen,
    operador_destino as operador_destino,
    estado_solicitud,
    s.fecha_solicitud as fecha_solicitud,
    s.fecha_portabilidad as fecha_portabilidad
from "DB_BI"."staging"."stg_solicitud" as s