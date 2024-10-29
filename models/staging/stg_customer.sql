{{ config(materialized='table') }}

with source_data as (

Select Distinct 
    Businessid,
    a.Userid as Customerid,
    a.name as Customer_Name,
    a.Phone as Customer_Phone,
    TO_TIMESTAMP(a.Createddate) AS Createddate,
    c.Countryname as Country,
    a.Stateid,
    a.Statename,
    a.Cityid,
    a.Cityname,
    a.Townid,
    Townname,
    a.Latitude,
    a.Longitude,
    a.Fulladdress as Customer_Address,
    a.Location,
    a.Status,
    ROW_NUMBER() OVER (PARTITION BY a.userid ORDER BY a.contentid DESC) AS rn  
from {{ source('main_db', 'Businessaddressbook') }} as a
Left Join {{ source('main_db', 'Businessmaster') }} b on a.businessid=b.contentid
Left Join {{ source('main_db', 'countrymaster') }} c on b.countryid=c.contentid
Where coalesce(a.status,0) IN (0,1,2,7)
)
select 
    Businessid,
    Customerid,
    Customer_Name,
    Customer_Phone,
    Createddate,
    Country,
    Stateid,
    Statename,
    Cityid,
    Cityname,
    Townid,
    Townname,
    Latitude,
    Longitude,
    Customer_Address,
    Location,
    Status
from source_data
where rn=1