-- models/staging/stg_orders.sql
WITH raw_orders AS (
    SELECT *
    FROM {{ source('raw', 'orders') }}
),

cleaned_orders AS (
    SELECT
        order_id::INT AS order_id,
        customer_id::INT AS customer_id,
        order_date::DATE AS order_date,
        product_name::STRING AS product_name,
        quantity::INT AS quantity,
        price::FLOAT AS price,
        status::STRING AS status
    FROM raw_orders
)

SELECT *
FROM cleaned_orders  
