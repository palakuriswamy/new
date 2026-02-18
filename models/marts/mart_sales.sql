with sales_with_prev as (

    select
        customer_id,
        month,
        sum(current_sales) as current_sales,
        lag(sum(current_sales)) over (partition by customer_id order by month) as previous_sales
    from {{ ref('customer_orders') }}
    group by customer_id, month

)

select
    *,
    {{ calculate_growth('current_sales', 'previous_sales') }} as growth_percentage
from sales_with_prev
