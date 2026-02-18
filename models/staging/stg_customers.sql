with source as (
    select * from {{ source('raw', 'customers') }}
)
select
    customer_id,
    upper(trim(coalesce(first_name, 'UNKNOWN'))) as first_name,
    upper(trim(coalesce(last_name, 'UNKNOWN'))) as last_name,
    lower(trim(email)) as email,
    phone,
    city,
    created_date
from source
