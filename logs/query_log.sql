-- created_at: 2026-01-24T03:47:16.098793+00:00
-- finished_at: 2026-01-24T03:47:16.479135+00:00
-- elapsed: 380ms
-- outcome: success
-- dialect: snowflake
-- node_id: not available
-- query_id: 01c1f003-0307-9037-001b-44e30004ef62
-- desc: execute adapter call
show terse schemas in database analytics
    limit 10000
/* {"app": "dbt", "connection_name": "", "dbt_version": "2.0.0", "profile_name": "default", "target_name": "dev"} */;
-- created_at: 2026-01-24T03:47:17.623520+00:00
-- finished_at: 2026-01-24T03:47:17.978268+00:00
-- elapsed: 354ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.jaffle_shop.stg_stripe_payment
-- query_id: 01c1f003-0307-8e59-001b-44e300050372
-- desc: get_relation > list_relations call
SHOW OBJECTS IN SCHEMA "ANALYTICS"."PUBLIC" LIMIT 10000;
-- created_at: 2026-01-24T03:47:18.042148+00:00
-- finished_at: 2026-01-24T03:47:18.205600+00:00
-- elapsed: 163ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.jaffle_shop.stg_jaffle_shop_orders
-- query_id: 01c1f003-0307-9037-001b-44e30004ef6a
-- desc: get_relation > list_relations call
SHOW OBJECTS IN SCHEMA "ANALYTICS"."PUBLIC" LIMIT 10000;
-- created_at: 2026-01-24T03:47:17.983964+00:00
-- finished_at: 2026-01-24T03:47:18.332799+00:00
-- elapsed: 348ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.jaffle_shop.stg_stripe_payment
-- query_id: 01c1f003-0307-9037-001b-44e30004ef66
-- desc: execute adapter call
create or replace   view analytics.public.stg_stripe_payment
  
   as (
    select
    orderid as order_id,
    paymentmethod as payment_method,
    status,
    -- amount is stored in cents, convert it to dollars
    amount/100 as amount,
    created as created_at,
    _batched_at
from raw.stripe.payment
  )
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.jaffle_shop.stg_stripe_payment", "profile_name": "default", "target_name": "dev"} */;
-- created_at: 2026-01-24T03:47:18.210726+00:00
-- finished_at: 2026-01-24T03:47:18.654929+00:00
-- elapsed: 444ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.jaffle_shop.stg_jaffle_shop_orders
-- query_id: 01c1f003-0307-8e59-001b-44e300050376
-- desc: execute adapter call
create or replace   view analytics.public.stg_jaffle_shop_orders
  
   as (
    
select
    id as order_id,
    user_id as customer_id,
    order_date,
    status,
    _etl_loaded_at
from raw.jaffle_shop.orders
  )
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.jaffle_shop.stg_jaffle_shop_orders", "profile_name": "default", "target_name": "dev"} */;
-- created_at: 2026-01-24T03:47:18.483972+00:00
-- finished_at: 2026-01-24T03:47:18.669268+00:00
-- elapsed: 185ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.jaffle_shop.source_not_null_jaffle_shop_customers_id.2b0a5f29a9
-- query_id: 01c1f003-0307-9037-001b-44e30004ef6e
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select id
from raw.jaffle_shop.customers
where id is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.jaffle_shop.source_not_null_jaffle_shop_customers_id.2b0a5f29a9", "profile_name": "default", "target_name": "dev"} */;
-- created_at: 2026-01-24T03:47:18.846830+00:00
-- finished_at: 2026-01-24T03:47:19.176938+00:00
-- elapsed: 330ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.jaffle_shop.source_unique_jaffle_shop_customers_id.aaddf56471
-- query_id: 01c1f003-0307-9037-001b-44e30004ef72
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    id as unique_field,
    count(*) as n_records

from raw.jaffle_shop.customers
where id is not null
group by id
having count(*) > 1



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.jaffle_shop.source_unique_jaffle_shop_customers_id.aaddf56471", "profile_name": "default", "target_name": "dev"} */;
-- created_at: 2026-01-24T03:47:19.183027+00:00
-- finished_at: 2026-01-24T03:47:19.660716+00:00
-- elapsed: 477ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.jaffle_shop.stg_jaffle_shop_customers
-- query_id: 01c1f003-0307-911c-001b-44e30004f36a
-- desc: execute adapter call
create or replace   view analytics.public.stg_jaffle_shop_customers
  
   as (
    select
    id as customer_id,
    first_name,
    last_name

from raw.jaffle_shop.customers
  )
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.jaffle_shop.stg_jaffle_shop_customers", "profile_name": "default", "target_name": "dev"} */;
-- created_at: 2026-01-24T03:47:19.667599+00:00
-- finished_at: 2026-01-24T03:47:20.481630+00:00
-- elapsed: 814ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.jaffle_shop.not_null_stg_jaffle_shop_customers_customer_id.56f60d8c68
-- query_id: 01c1f003-0307-911c-001b-44e30004f372
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select customer_id
from analytics.public.stg_jaffle_shop_customers
where customer_id is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.jaffle_shop.not_null_stg_jaffle_shop_customers_customer_id.56f60d8c68", "profile_name": "default", "target_name": "dev"} */;
-- created_at: 2026-01-24T03:47:20.197551+00:00
-- finished_at: 2026-01-24T03:47:20.532910+00:00
-- elapsed: 335ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.jaffle_shop.accepted_values_stg_jaffle_sho_9e737f1742bbf5f35cc658b19a560db5.20d98e94cc
-- query_id: 01c1f003-0307-919f-001b-44e3000561ba
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with all_values as (

    select
        status as value_field,
        count(*) as n_records

    from analytics.public.stg_jaffle_shop_orders
    group by status

)

select *
from all_values
where value_field not in (
    'placed','shipped','completed','returned','return_pending'
)



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.jaffle_shop.accepted_values_stg_jaffle_sho_9e737f1742bbf5f35cc658b19a560db5.20d98e94cc", "profile_name": "default", "target_name": "dev"} */;
-- created_at: 2026-01-24T03:47:19.728219+00:00
-- finished_at: 2026-01-24T03:47:20.549431+00:00
-- elapsed: 821ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.jaffle_shop.assert_stage_stripe_payment_total_for_payments.a7dbb393ad
-- query_id: 01c1f003-0307-919f-001b-44e3000561b6
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  select
    order_id,
    sum(amount) as total_amount
from analytics.public.stg_stripe_payment
group by 1
having total_amount < 0
  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.jaffle_shop.assert_stage_stripe_payment_total_for_payments.a7dbb393ad", "profile_name": "default", "target_name": "dev"} */;
-- created_at: 2026-01-24T03:47:19.667690+00:00
-- finished_at: 2026-01-24T03:47:20.585687+00:00
-- elapsed: 917ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.jaffle_shop.relationships_stg_jaffle_shop__3a4c5b7e76605024bff9af72d6fbad4e.50620a9dc7
-- query_id: 01c1f003-0307-911c-001b-44e30004f36e
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with child as (
    select customer_id as from_field
    from analytics.public.stg_jaffle_shop_orders
    where customer_id is not null
),

parent as (
    select customer_id as to_field
    from analytics.public.stg_jaffle_shop_customers
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.jaffle_shop.relationships_stg_jaffle_shop__3a4c5b7e76605024bff9af72d6fbad4e.50620a9dc7", "profile_name": "default", "target_name": "dev"} */;
-- created_at: 2026-01-24T03:47:19.667555+00:00
-- finished_at: 2026-01-24T03:47:20.594338+00:00
-- elapsed: 926ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.jaffle_shop.unique_stg_jaffle_shop_customers_customer_id.fd649595d3
-- query_id: 01c1f003-0307-9037-001b-44e30004ef76
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    customer_id as unique_field,
    count(*) as n_records

from analytics.public.stg_jaffle_shop_customers
where customer_id is not null
group by customer_id
having count(*) > 1



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.jaffle_shop.unique_stg_jaffle_shop_customers_customer_id.fd649595d3", "profile_name": "default", "target_name": "dev"} */;
-- created_at: 2026-01-24T03:47:20.547439+00:00
-- finished_at: 2026-01-24T03:47:20.828370+00:00
-- elapsed: 280ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.jaffle_shop.not_null_stg_jaffle_shop_orders_order_id.41fc01de69
-- query_id: 01c1f003-0307-9037-001b-44e30004ef7a
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select order_id
from analytics.public.stg_jaffle_shop_orders
where order_id is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.jaffle_shop.not_null_stg_jaffle_shop_orders_order_id.41fc01de69", "profile_name": "default", "target_name": "dev"} */;
-- created_at: 2026-01-24T03:47:20.924439+00:00
-- finished_at: 2026-01-24T03:47:21.138506+00:00
-- elapsed: 214ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.jaffle_shop.unique_stg_jaffle_shop_orders_order_id.8083d75694
-- query_id: 01c1f003-0307-9037-001b-44e30004ef7e
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    order_id as unique_field,
    count(*) as n_records

from analytics.public.stg_jaffle_shop_orders
where order_id is not null
group by order_id
having count(*) > 1



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.jaffle_shop.unique_stg_jaffle_shop_orders_order_id.8083d75694", "profile_name": "default", "target_name": "dev"} */;
-- created_at: 2026-01-24T03:47:21.146241+00:00
-- finished_at: 2026-01-24T03:47:22.303261+00:00
-- elapsed: 1.2s
-- outcome: success
-- dialect: snowflake
-- node_id: model.jaffle_shop.fct_orders
-- query_id: 01c1f003-0307-919f-001b-44e3000561be
-- desc: execute adapter call
create or replace transient  table analytics.public.fct_orders
    
    
    
    as (with orders  as(
    select * from analytics.public.stg_jaffle_shop_orders
),

payments as (
    select * from analytics.public.stg_stripe_payment
),

order_payments as(
    select 
        order_id,
        sum (case when status='success' then amount end) as amount
    from payments
    group by 1
),

final as(

    select 
        orders.order_id,
        orders.customer_id,
        orders.order_date,
        coalesce (order_payments.amount, 0) as amount
    from orders
    left join order_payments using (order_id)
)

select * from final
    )

/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.jaffle_shop.fct_orders", "profile_name": "default", "target_name": "dev"} */;
-- created_at: 2026-01-24T03:47:22.311351+00:00
-- finished_at: 2026-01-24T03:47:23.634825+00:00
-- elapsed: 1.3s
-- outcome: success
-- dialect: snowflake
-- node_id: model.jaffle_shop.dim_customers
-- query_id: 01c1f003-0307-8e59-001b-44e30005037a
-- desc: execute adapter call
create or replace transient  table analytics.public.dim_customers
    
    
    
    as (with customers as (
    select * from analytics.public.stg_jaffle_shop_customers
),

orders as (
     select * from analytics.public.fct_orders
),

customer_orders as (

    select
        customer_id,
        min(order_date) as first_order_date,
        max(order_date) as most_recent_order_date,
        count(order_id) as number_of_orders,
        sum(amount) as lifetime_value
    from orders
    group by 1

),


final as (

    select
        customers.customer_id,
        customers.first_name,
        customers.last_name,
        customer_orders.first_order_date,
        customer_orders.most_recent_order_date,
        coalesce(customer_orders.number_of_orders, 0) as number_of_orders,
        customer_orders.lifetime_value
    from customers
    left join customer_orders using (customer_id)
)

select * from final
    )

/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.jaffle_shop.dim_customers", "profile_name": "default", "target_name": "dev"} */;
