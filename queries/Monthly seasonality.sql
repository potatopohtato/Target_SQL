SELECT 
EXTRACT(YEAR FROM order_purchase_timestamp) AS purchase_year,
EXTRACT(MONTH FROM order_purchase_timestamp) AS purchase_month,
COUNT(*) AS order_count
FROM 
`Target.orders`
GROUP BY 
purchase_year, purchase_month
ORDER BY 
purchase_year, purchase_month
