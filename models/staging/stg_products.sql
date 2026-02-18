with source as (

    select * 
    from {{ source('raw', 'products') }}

),

cleaned as (

    select
        product_id,
        product_name,
        category,
        price,
        stock,
        created_date

    from source

)

select * from cleaned
