

with acciones as (
    select
        solicitud_id,
        count(*) as total_acciones,
        SUM(case when resultado_accion = 'EXITO' then 1 else 0 end) as acciones_exitosas
    from "DB_BI"."staging"."stg_accion_cliente"
    group by solicitud_id
)

select
    NEWID() as id,
    p.portabilidad_id as portabilidad_id,
    s.solicitud_id as solicitud_id,
    u.msisdn as usuario_id,
    o.operador_id as operador_origen,
    d.operador_id as operador_destino,
    seg.segmento_id as segmento_id,
    fecha_id as fecha_id,
    a.total_acciones as total_acciones,
    case when a.total_acciones > 0 
        then cast(a.acciones_exitosas as float) / a.total_acciones 
        else 0
        end as porcentaje_acciones_exitosas,
    DATEDIFF(DAY, s.fecha_solicitud, s.fecha_portabilidad) as dias_portabilidad_esperada,
    DATEDIFF(DAY, s.fecha_solicitud, p.fecha_portabilidad) as dias_portabilidad_real,
    DATEDIFF(DAY, s.fecha_portabilidad, p.fecha_portabilidad) as diferencia_portabilidad_programada_real,
    case
        when p.operador_destino = 'CLARO' then 1
        else 0
        end as es_port_in
from "DB_BI"."master"."dim_portabilidad" as p
join "DB_BI"."master"."dim_solicitud" as s
    on p.solicitud_id = s.solicitud_id
join "DB_BI"."master"."dim_usuario" as u
    on s.msisdn = u.msisdn
join "DB_BI"."master"."dim_operador" as o
    on p.operador_origen = o.operador_nombre
join "DB_BI"."master"."dim_operador" as d
    on p.operador_destino = d.operador_nombre
join "DB_BI"."master"."dim_segmento" as seg
    on u.segmento = seg.segmento_nombre
join acciones as a 
    on s.solicitud_id = a.solicitud_id
join "DB_BI"."master"."dim_tiempo" as t
    on p.fecha_portabilidad = t.fecha_id