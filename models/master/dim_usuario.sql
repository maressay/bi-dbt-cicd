
{{ config(materialized='table', as_columnstore=false) }}

select
    u.msisdn as msisdn,
    u.segmento as segmento,
    u.departamento as departamento,
    u.provincia as provincia,
    u.distrito as distrito, 
    u.marca as marca, 
    u.modelo as modelo
from {{ ref('stg_usuario') }} as u

