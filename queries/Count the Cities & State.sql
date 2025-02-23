SELECT
COUNT(DISTINCT customer_city) AS city_count,
COUNT(DISTINCT customer_state) AS state_count
FROM `Target.customers`