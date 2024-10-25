select
    Contentid,
    Customerid,
    Userid,
    TO_TIMESTAMP(Createddate) AS Createddate
from {{ source('main_db', 'Ordermaster') }}