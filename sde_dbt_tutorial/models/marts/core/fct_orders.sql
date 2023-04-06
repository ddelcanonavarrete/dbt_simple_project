
-- Use the `ref` function to select from other models

with orders as (
    select *
    from {{ ref('stg_eltool__orders') }}
)
select * from orders
