WITH monthly_orders AS (
  SELECT
    FORMAT_TIMESTAMP('%Y-%m', o.order_purchase_timestamp) AS purchase_month,
    p.payment_type,
    COUNT(DISTINCT o.order_id) AS order_count
  FROM
    `Target.orders` AS o
  JOIN
    `Target.payments` AS p
  ON
    o.order_id = p.order_id
  GROUP BY
    purchase_month,
    p.payment_type
)

SELECT
  purchase_month,
  payment_type,
  order_count
FROM
  monthly_orders
ORDER BY
  purchase_month,
  payment_type
