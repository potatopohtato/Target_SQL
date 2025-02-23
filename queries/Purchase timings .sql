SELECT 
CASE 
WHEN EXTRACT(HOUR FROM order_purchase_timestamp) >=0 AND EXTRACT(HOUR FROM order_purchase_timestamp) <=6 THEN 'Dawn'
WHEN EXTRACT(HOUR FROM order_purchase_timestamp) >=7 AND EXTRACT(HOUR FROM order_purchase_timestamp) <=12 THEN 'Morning'
WHEN EXTRACT(HOUR FROM order_purchase_timestamp) >=13 AND EXTRACT(HOUR FROM order_purchase_timestamp) <=18 THEN 'Afternoon'
WHEN EXTRACT(HOUR FROM order_purchase_timestamp) >=19 AND EXTRACT(HOUR FROM order_purchase_timestamp) <=23 THEN 'Night'
END AS purchase_timings,
COUNT(*) AS Order_count
FROM `Target.orders`
GROUP BY purchase_timings
ORDER BY Order_count DESC