{{ config(materialized='table') }}

with items as (
  select 
    a.order_id
  , sum((a.order_item_id * a.price) + a.freight_value) as total
  from `dbt-shop-382400.dbt_ecommerce.order_items` a
  group by 1
  order by 1
)
select 
  o.*
, round(items.total, 2) as order_total_value
from `dbt-shop-382400.dbt_ecommerce.orders` o
join items on items.order_id = o.order_id