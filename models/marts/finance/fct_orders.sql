with customers as (
    select * from {{ref ('stg_jaffle_shop__customers')}}
),

orders as (
    select * from {{ref ('stg_jaffle_shop__orders')}}
),

payments as (
    select * from {{ref ('stg_stripe_payments')}}
),

final as (

select 
    orders.order_id,
    customers.customer_id,
    payments.payment_amount
from
    orders
    left join customers on orders.customer_id = customers.customer_id
    left join payments on payments.order_id = orders.order_id

)

select * from final