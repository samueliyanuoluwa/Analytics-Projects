{{ config(materialized='table') }}

with source_data as (

Select Distinct 
    {{ dbt_utils.generate_surrogate_key(['stateid']) }} as Location_Key,
    Country,
    Stateid,
    State,
    Cityid,
    City,
    Townid,
    Town
from {{ ref('stg_address') }}
)
select * from source_data