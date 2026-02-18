with source as (
    select * from {{ source('raw', 'payments') }}
)
select
    payment_id,
    order_id,
    payment_method,
    payment_date,
    amount,
    status as status  -- make sure casing matches the actual column
from source
