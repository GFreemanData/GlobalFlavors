-- This is to get a general count of the number of items on the menu
-- There are 32 items
SELECT COUNT(*)
FROM menu_items

-- These next two queries are to help me figure out the most and least expensive items on the menu
-- The 3 most expensive items on the menu are Shrimp Scampi, Korean Beef Bowl, and Pork Ramen
-- The 3 least expensive dishes are Edamame, French Fries, and Mac & Cheese
SELECT *
FROM menu_items
ORDER BY price DESC
LIMIT 3;

SELECT *
FROM menu_items
ORDER BY price ASC
LIMIT 3;

-- The next two queries can be used to find the number of dishes in a category and sort said dishes by price 
SELECT COUNT(item_name) as dish_count
FROM menu_items
WHERE category = 'Italian';

SELECT  item_name, category, price
FROM menu_items
WHERE category = 'Italian'
ORDER BY price DESC;

-- This query allows you to find out how many dishes are in each category and their average price
-- Mexican and Italian have the most dishes, and on average Italian dishes are more expensive than most dishes
SELECT category, COUNT(item_name) AS dish_count, AVG(price) AS average_price
FROM menu_items
GROUP BY category;