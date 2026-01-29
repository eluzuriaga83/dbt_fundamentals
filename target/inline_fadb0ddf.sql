select * from (
with customers as (

    select
        id as customer_id,
        first_name,
        last_name

    from raw.jaffle_shop.customers

)
SELECT * FROM CUSTOMERS
) as __preview_sbq__ limit 1000