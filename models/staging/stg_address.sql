{{ config(materialized='table') }}

with source_data as (

Select Distinct 
    Countryname as Country,
    a.Stateid,Statename as State,
    a.Cityid,
    Cityname as City,
    a.Contentid as Townid,
    Townname as Town
from {{ source('main_db', 'townmaster') }} as a
left join {{ source('main_db', 'countrymaster') }} as b on a.CountryID=b.contentid
left join {{ source('main_db', 'statemaster') }} as c on a.StateID=c.Contentid
left join {{ source('main_db', 'citymaster') }} as d on a.cityid=d.contentid

)
select * from source_data