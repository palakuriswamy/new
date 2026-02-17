select *
from {{ source('raw', 'customers') }}
limit 10
