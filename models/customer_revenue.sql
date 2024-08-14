with customer_orders as (
    select
        c.customer_id,
        c.customer_name,
        sum(o.order_amount) as total_revenue
    from {{ source('public','customers') }} c
    join {{ source('public','orders') }} o on c.customer_id = o.customer_id
    where o.status = 'completed'
    group by c.customer_id, c.customer_name
)

select * from customer_orders;
