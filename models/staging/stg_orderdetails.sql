{{ config(materialized='table') }}


with source_data as (

select
    Businessid,
    Orderid,
    Itemid
    Soldprice,
    Quantity,
    Buyingprice,
    Inventoryprice
from {{ source('main_db', 'Orderdetails') }}
)
Select * from source_data