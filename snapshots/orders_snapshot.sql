{% snapshot orders_snapshot %}

{{
    config(
        target_schema='snapshots',
        unique_key='order_id',
        strategy='timestamp',
        updated_at='order_date'
    )
}}

with clean_orders as (
    select *
    from {{ ref('stg_orders') }}
    where try_to_date(order_date) is not null
)

select
    order_id,
    customer_id,
    product_name,
    quantity,
    price,
    status,
    order_date
from clean_orders

{% endsnapshot %}
