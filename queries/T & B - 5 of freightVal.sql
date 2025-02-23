WITH top_states AS (
  SELECT
    customer_state,
    AVG(freight_value) AS average_freight_value,
    ROW_NUMBER() OVER (ORDER BY AVG(freight_value) DESC) AS rank_highest,
    ROW_NUMBER() OVER (ORDER BY AVG(freight_value) ASC) AS rank_lowest
  FROM
    `Target.order_items` AS oi
  JOIN
    `Target.orders` AS o
  ON
    oi.order_id = o.order_id
  JOIN
    `Target.customers` AS c
  ON
    o.customer_id = c.customer_id
  GROUP BY
    customer_state
)
SELECT
  customer_state,
  average_freight_value
FROM
  top_states
WHERE
  rank_highest <= 5 
  OR rank_lowest <= 5 
ORDER BY
  average_freight_value DESC
