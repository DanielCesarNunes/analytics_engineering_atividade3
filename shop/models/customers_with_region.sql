
{{ config(materialized='table') }}

SELECT 
  a.customer_unique_id
, a.customer_state
, CASE
	WHEN a.customer_state IN ('PR', 'SC', 'RS') then 'Sul'
	WHEN a.customer_state IN ('AM', 'RR', 'AP', 'PA', 'TO', 'RO', 'AC') then 'Norte'
	WHEN a.customer_state IN ('MA', 'PI', 'CE', 'RN', 'PE', 'PB', 'SE', 'AL', 'BA') then 'Nordeste'
	WHEN a.customer_state IN ('MT', 'MS', 'GO', 'DF') then 'Centro-Oeste'
	WHEN a.customer_state IN ('SP', 'RJ', 'ES', 'MG') then 'Sudeste'
	ELSE NULL
  END AS region
FROM `dbt-shop-382400.dbt_ecommerce.customers`a