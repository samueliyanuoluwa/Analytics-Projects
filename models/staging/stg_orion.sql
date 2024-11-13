select *
from {{ source('main_db', 'Orionstock') }}