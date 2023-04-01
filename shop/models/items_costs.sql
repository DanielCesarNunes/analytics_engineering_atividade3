{{ config(materialized='table') }}

SELECT 
  a.order_id
, a.product_id
, a.order_item_id
, a.price
, a.freight_value
, (a.price * a.order_item_id) + a.freight_value AS total
FROM `dbt-shop-382400.dbt_ecommerce.order_items` a
group by 1, 2, 3, 4, 5