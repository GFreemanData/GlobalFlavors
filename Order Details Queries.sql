-- This query is for finding the start and end date for the date range
SELECT MIN(order_date) AS start_date, MAX(order_date) AS end_date
FROM order_details;

-- This query is to find how many orders were made during this time period
SELECT COUNT(DISTINCT order_id) AS order_count
FROM order_details;

-- This query is to find how many items were ordered
SELECT COUNT(order_details_id) AS item_sales_count
FROM order_details;

-- This query is to see the 5 orders with the most items 
SELECT order_id, COUNT(item_id) AS item_count
FROM order_details
GROUP BY order_id
ORDER BY item_count DESC
LIMIT 5;

-- This query is to find which orders have more than 12 items
SELECT COUNT(*) FROM

(SELECT order_id, COUNT(item_id) AS item_count
FROM order_details
GROUP BY order_id
HAVING item_count > 12) AS count_orders;