SELECT
  MIN(order_purchase_timestamp) AS min_purchase_timestamp,
  MAX(order_purchase_timestamp) AS max_purchase_timestamp
FROM
`Target.orders`