SELECT
  customer_state,
  COUNT(*) AS customer_count
FROM
  `Target.customers`
GROUP BY
  customer_state
ORDER BY
  customer_count DESC
