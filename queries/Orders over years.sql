SELECT 
EXTRACT(YEAR FROM order_purchase_timestamp) AS purchase_year,
COUNT(*) AS order_count
FROM 
`Target.orders`
GROUP BY 
purchase_year
ORDER BY 
purchase_year