{{ config(materialized='table') }}

with source_data as (

select
    Businessid,
    Contentid as Orderid,
    MasterOrderid,
    Orderstatusid,
    Customerid,
    Userid,
    TO_TIMESTAMP(Createddate) AS Createddate,
    Orderlocationid,
    Ordersource,
    Totalprice,
    TotalItem,
    CityName,
    Ispushsale,
    Orderlocation,
    Orderlongitude,
    Orderlatitude,
    MeetingID,
    Inventoryprice,
    Promodiscount,
    Walletdiscount,
    Omnipointsdiscount
    Ordercancelreason
from {{ source('main_db', 'Ordermaster') }}
where COALESCE(status, 0) <> 3 

)
select * from source_data