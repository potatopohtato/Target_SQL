SELECT
  c.customer_state,
  ROUND(SUM(oi.freight_value),2) AS total_freight_value,
  ROUND(AVG(oi.freight_value),2) AS average_freight_value
FROM
  `Target.orders` o
JOIN
   `Target.customers`c
ON 
  c.customer_id = o.customer_id
JOIN
  `Target.order_items` oi
ON
  o.order_id = oi.order_id
GROUP BY
  customer_state