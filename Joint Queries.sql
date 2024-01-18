-- This query is a left join(The information needed is tied mostly to the order_details table
SELECT *
FROM order_details AS od
LEFT JOIN menu_items AS mi
ON od.item_id = mi.menu_item_id;

-- This query is to find the top selling items and their category 
SELECT item_name, category, COUNT(item_id) AS num_purchases
FROM order_details AS od
JOIN menu_items AS mi
ON od.item_id = mi.menu_item_id
GROUP BY item_name, category
ORDER BY num_purchases DESC
LIMIT 5

-- This query is to find the bottom items sold and their category
SELECT item_name, category, COUNT(item_id) AS num_purchases
FROM order_details AS od
JOIN menu_items AS mi
ON od.item_id = mi.menu_item_id
GROUP BY item_name, category
ORDER BY num_purchases ASC
LIMIT 5

-- This query is to find the 5 most expensive orders
-- 440, 2075, 1957, 330, 2675
SELECT order_id, SUM(mi.price) AS total_cost
FROM order_details AS od
LEFT JOIN menu_items AS mi ON od.item_id = mi.menu_item_id
GROUP BY order_id
ORDER BY SUM(mi.price) DESC
LIMIT 5;

-- This query is to find how many items were purchased in each category for the most expensive order as well as the total spent in each category.
SELECT category, COUNT(category) AS total_items, SUM(price) AS total_spent
FROM order_details AS od
LEFT JOIN menu_items AS mi
ON od.item_id = mi.menu_item_id
WHERE order_id = 440
GROUP BY category
ORDER BY total_items DESC;

-- This query is to count how many of each menu item was sold in the most expensive order. 
SELECT item_name, COUNT(item_name) AS item_count, category
FROM order_details AS od
LEFT JOIN menu_items AS mi
ON od.item_id = mi.menu_item_id
WHERE order_id = 440
GROUP BY item_name, category
ORDER BY item_count DESC;

-- The next two queries are the same, but cover the 5 largest orders
-- Italian and Asian are the two highest selling categories in bothe number and price with the top 5
-- The top 3 selling items are all Italian: Eggplant Parmesan, Spaghetti, and Spaghetti & Meatballs
SELECT category, COUNT(category) AS total_items, SUM(price) AS total_spent
FROM order_details AS od
LEFT JOIN menu_items AS mi
ON od.item_id = mi.menu_item_id
WHERE order_id IN (440, 2075, 1957, 330, 2675)
GROUP BY category
ORDER BY total_items DESC;

SELECT item_name, COUNT(item_name) AS item_count, category
FROM order_details AS od
LEFT JOIN menu_items AS mi
ON od.item_id = mi.menu_item_id
WHERE order_id IN (440, 2075, 1957, 330, 2675)
GROUP BY item_name, category
ORDER BY item_count DESC;