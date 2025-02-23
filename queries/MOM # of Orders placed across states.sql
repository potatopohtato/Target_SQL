SELECT
  EXTRACT(YEAR FROM o.order_purchase_timestamp) AS purchase_year,
  EXTRACT(MONTH FROM o.order_purchase_timestamp) AS purchase_month,
  c.customer_state,
  COUNT(*) AS order_count
FROM
  `Target.orders`o
JOIN `Target.customers`c  ON o.customer_id = c.customer_id
GROUP BY
  purchase_year, purchase_month, c.customer_state
ORDER BY
  purchase_year, purchase_month, c.customer_state
