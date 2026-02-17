-- models/staging/stg_customers.sql

SELECT *
FROM {{ source('raw', 'customers') }}
