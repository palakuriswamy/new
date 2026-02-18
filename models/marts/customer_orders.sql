with orders as (

    select
        customer_id,
        date_trunc('month', order_date) as month,
        sum(price * quantity) as total_sales
    from {{ ref('stg_orders') }}
    group by 1,2

),

sales_with_prev as (

    select
        customer_id,
        month,
        total_sales as current_sales,
        lag(total_sales) over (partition by customer_id order by month) as previous_sales
    from orders

)

select
    *,
    {{ calculate_growth('current_sales', 'previous_sales') }} as growth_percentage
from sales_with_prev

