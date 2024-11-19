with orders as (
    select * from {{ ref('stg_order') }}
)
select 
    Orderid,
    sum(Totalprice) as Total_Amount
from
    orders
group by
    Orderid
having 
    sum(Totalprice) < 0

