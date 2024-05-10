--Query 1 Identify the top 3 products with the highest average rating, considering only products with more than 5 reviews.
SELECT p.product_name, AVG(pr.rating) AS avg_rating
FROM products p
INNER JOIN (
    SELECT product_id
    FROM product_reviews
    GROUP BY product_id
    HAVING COUNT(review_id) > 5
) AS reviewed_products ON p.product_id = reviewed_products.product_id
INNER JOIN product_reviews pr ON p.product_id = pr.product_id
GROUP BY p.product_name
ORDER BY avg_rating DESC
LIMIT 3;
-- EXPLANATION : Identifies the top 3 products with the highest average rating, considering only products with more than 5 reviews.

--Query 2 List the top 5 best-selling products by total quantity sold.
SELECT p.product_name, SUM(oi.quantity) AS total_quantity_sold
FROM products p
INNER JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY total_quantity_sold DESC
LIMIT 5;
-- EXPLANATION : Lists the top 5 best-selling products by total quantity sold.

--Query 3 List the top 3 most purchased products in each product category.
SELECT category, product_name, total_quantity_sold
FROM (
    SELECT p.category, p.product_name, SUM(oi.quantity) AS total_quantity_sold,
           ROW_NUMBER() OVER (PARTITION BY p.category ORDER BY SUM(oi.quantity) DESC) AS rank
    FROM products p
    INNER JOIN order_items oi ON p.product_id = oi.product_id
    GROUP BY p.category, p.product_name
) AS ranked_products
WHERE rank <= 3;
-- EXPLANATION : Lists the top 3 most purchased products in each product category.

--Query 4 Calculate the percentage of orders that contain products with an average rating above 4.5.
SELECT (COUNT(CASE WHEN avg_rating > 4.5 THEN order_id END) / COUNT(order_id)) * 100 AS high_rating_percentage
FROM (
    SELECT oi.order_id, 
           AVG(pr.rating) AS avg_rating
    FROM order_items oi
    INNER JOIN product_reviews pr ON oi.product_id = pr.product_id
    GROUP BY oi.order_id
) AS order_ratings;
-- EXPLANATION : Calculates the percentage of orders that contain products with an average rating above 4.5.

--Query 5 List the top 3 countries with the highest average order value.
SELECT c.country, AVG(o.total_price) AS avg_order_value
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.country
ORDER BY avg_order_value DESC
LIMIT 3;
-- EXPLANATION :  Lists the top 3 countries with the highest average order value.

--Query 6

--Query 7

--Query 8

--Query 9

--Query 10

--Query 11

--Query 12

--Query 13

--Query 14

--Query 15

