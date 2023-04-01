{{ config(materialized='view') }}

SELECT 
  b.customer_state as state
, count(a.order_id) as total
FROM `dbt-shop-382400.dbt_ecommerce.orders` AS a
JOIN `dbt-shop-382400.dbt_ecommerce.customers` AS b ON b.customer_id = a.customer_id
GROUP BY 1
ORDER BY 1