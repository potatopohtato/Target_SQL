SELECT
  c.customer_state,
  ROUND(SUM(price),2) AS total_order_price,
  ROUND(AVG(price),2) AS average_order_price
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
