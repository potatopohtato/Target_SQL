WITH delivery_time_diff AS (
  SELECT
    c.customer_state,
    AVG(DATE_DIFF(o.order_delivered_customer_date, o.order_estimated_delivery_date, DAY)) AS delivery_time_difference
  FROM
    `Target.orders` AS o
  JOIN
    `Target.customers` AS c
  ON
    o.customer_id = c.customer_id
  WHERE
    o.order_status = 'delivered'
  GROUP BY
    c.customer_state
)

SELECT
  customer_state,
  delivery_time_difference
FROM (
  SELECT
    customer_state,
    delivery_time_difference,
    ROW_NUMBER() OVER (ORDER BY delivery_time_difference ASC) AS rank_fastest
  FROM
    delivery_time_diff
)
WHERE
  rank_fastest <= 5
ORDER BY
  delivery_time_difference ASC
