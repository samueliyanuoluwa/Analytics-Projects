with source_data as (
select
    Businessid,
    Contentid as Itemid,
    Productname as skuname,
    skucode,
    status,
    manufacture_id,
    brand_id,
    category_id,
    margin,
    buyingrate,
    unit,
    Itemclassification
from {{ source('main_db', 'Businessstore') }}

)
Select * from source_data