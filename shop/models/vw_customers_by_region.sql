{{ config(materialized='view') }}

SELECT 
  a.region
, count(a.customer_unique_id) AS total_customers
FROM `dbt-shop-382400.dbt_daniel.customers_with_region` a
group by 1
order by 2 desc