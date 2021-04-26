with source as (
  select
    *
  from {{ ref('orders') }}
)

SELECT
	order_status,
	count(*) as row_count
FROM
	source
GROUP BY
	order_status