with source as (

    select * 
    from {{ source('raw', 'returns') }}

),

cleaned as (

    select
        return_id,
        order_id,
        return_date,
        return_reason,
        refund_amount,
        status

    from source

)

select * from cleaned
