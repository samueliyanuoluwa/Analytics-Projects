with customers as (
    select * from {{ ref('stg_customer') }}
)
select 
    count(distinct Customerid) as Customer_count
from
    customers
where Customer_Phone is null


