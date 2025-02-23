SELECT
  (cost_2018 - cost_2017) / (cost_2017) * 100 AS cost_increase_percentage
FROM (
  SELECT
    SUM(CASE WHEN EXTRACT(YEAR FROM o.order_purchase_timestamp) = 2017 THEN p.payment_value ELSE 0 END) AS cost_2017,
    SUM(CASE WHEN EXTRACT(YEAR FROM o.order_purchase_timestamp) = 2018 THEN p.payment_value ELSE 0 END) AS cost_2018
  FROM
    `Target.orders` o
  JOIN
    `Target.payments` p
  ON
    o.order_id = p.order_id
  WHERE
    EXTRACT(YEAR FROM o.order_purchase_timestamp) IN (2017, 2018)
    AND EXTRACT(MONTH FROM o.order_purchase_timestamp) BETWEEN 1 AND 8
) 
