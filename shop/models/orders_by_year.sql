{{ config(materialized='table') }}

select 
  extract(year from a.order_approved_at) as year
, count(a.order_id) total_orders
FROM `dbt-shop-382400.dbt_ecommerce.orders` AS a
GROUP BY 1
ORDER BY 1