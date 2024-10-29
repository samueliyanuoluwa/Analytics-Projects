{{ config(materialized='table') }}

with source_data as (

Select Distinct 
    {{ dbt_utils.generate_surrogate_key(['Customerid']) }} as Customer_Key,
    Businessid,
    Customerid,
    Customer_Name,
    Customer_Phone as Customer_Phone_Number,
    Createddate as Customer_onboarding_date,
    Coalesce(b.country,a.country) as Customer_Country,
    Coalesce(b.state,a.Statename) as Customer_State,
    Coalesce(b.City,a.Cityname) as Customer_City,
    Coalesce(b.Town,a.Townname) as Customer_Town,
    Latitude,
    Longitude,
    Coalesce(Customer_Address,a.Location) as Customer_Address,
    CASE WHEN Coalesce(a.status, 0) = 0 THEN 'Pending' 
			WHEN Coalesce(a.status, 0) = 1 then 'Approved' 
			WHEN Coalesce(a.status, 0) = 2 then 'Rejected' 
			WHEN Coalesce(a.status, 0) = 7 then 'Pending Image'
			ELSE 'Deleted' END AS Customer_Status
from {{ ref('stg_customer') }} a
left join {{ ref('stg_address') }} b on a.stateid=b.stateid and a.cityid=b.cityid and a.townid=b.townid

)
select * from source_data