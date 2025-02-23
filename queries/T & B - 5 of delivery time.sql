WITH delivery_times AS (
  SELECT
    c.customer_state,
    AVG(DATE_DIFF(o.order_delivered_customer_date, o.order_purchase_timestamp, DAY)) AS average_delivery_time
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
  average_delivery_time
FROM (
  SELECT
    customer_state,
    average_delivery_time,
    ROW_NUMBER() OVER (ORDER BY average_delivery_time DESC) AS rank_highest,
    ROW_NUMBER() OVER (ORDER BY average_delivery_time ASC) AS rank_lowest
  FROM
    delivery_times
)
WHERE
  rank_highest <= 5 OR rank_lowest <= 5
ORDER BY
  average_delivery_time DESC
