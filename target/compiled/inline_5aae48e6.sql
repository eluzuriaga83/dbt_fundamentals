select * from (
with all_values as (

    select
        status as value_field,
        count(*) as n_records

    from analytics.public.stg_jaffle_shop_orders
    group by status

)
SELECT * FROM ALL_VALUES
) as __preview_sbq__ limit 1000