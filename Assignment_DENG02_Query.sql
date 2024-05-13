--Query 1 Find the percentage of total revenue contributed by each equipment category and round it to 2 decimal places:
SELECT 
    ec.category_name, 
    ROUND(SUM(te.equipment_price * te.quantity) / 
        (SELECT SUM(te.equipment_price * te.quantity) 
        FROM table_equipment te) * 100, 2) AS revenue_percentage
FROM 
    table_equipment te
INNER JOIN 
    equipment_category ec ON te.category_id = ec.category_id
GROUP BY 
    ec.category_name;


--Query 2 Finding the average rating of games released in each year, with their names, sorted by their average rating
SELECT 
    g.game_title,
    EXTRACT(YEAR FROM g.release_date) AS release_year,
    AVG(CAST(r.review_rating AS FLOAT)) AS average_rating
FROM 
    game g
LEFT JOIN 
    review r ON g.review_id = r.review_id
GROUP BY 
    g.game_title, release_year
ORDER BY 
    average_rating DESC;


--Query 3 Find the minimum ,average and maximum price of equipment in each category:
SELECT 
    ec.category_name, 
    MIN(te.equipment_price) AS min_price,
	ROUND(AVG(te.equipment_price), 2) AS average_price,
    MAX(te.equipment_price) AS max_price
FROM 
    table_equipment te
INNER JOIN 
    equipment_category ec ON te.category_id = ec.category_id
GROUP BY 
    ec.category_name;


--Query 4 Find the total number of games available on each platform and sort in descending:
SELECT 
    p.platform_name, 
    COUNT(*) AS total_games
FROM 
    game g
INNER JOIN 
    platform p ON g.platform_id = p.platform_id
GROUP BY 
    p.platform_name
ORDER BY 
    total_games DESC;


--Query 5 List all games along with the number of reviews they have received and the average review rating, sorted by average rating in descending order:
SELECT 
    g.game_title, 
    COUNT(r.review_id) AS total_reviews, 
    AVG(CAST(r.review_rating AS FLOAT)) AS average_rating
FROM 
    game g
LEFT JOIN 
    review r ON g.review_id = r.review_id
GROUP BY 
    g.game_title
ORDER BY 
    average_rating DESC;


--Query 6 Find the number of products (games and equipment) on sale according to genre along with the average price of each genre
SELECT
	e.equipment_name,
	c.category_id,
	ROUND(AVG(e.equipment_price) OVER
		  	(PARTITION BY c.category_id), 2) AS average_price
FROM
	table_equipment e
INNER JOIN equipment_category c
	ON c.category_id = e.category_id
ORDER BY
	c.category_id;


--Query 7 Find the number of sales according to the month of a specific year (to be picked) withe famous product bought for that month?
SELECT * FROM store_transaction; 
SELECT * FROM orders;


--Query 8 Something pasal Manufacturer of each store 



--Query 9 Number of produced products each year ...



--Query 10 



--Query 11 Find The highest amount spend by each customer
SELECT 
	c.customer_id, 
	c.first_name,
	c.last_name, 
    SUM(COALESCE(e.equipment_price, 0) + 
		COALESCE(g.game_price, 0)) AS total_price
FROM 
	customer c
LEFT JOIN orders o 
	ON c.customer_id = o.customer_id
LEFT JOIN 
	table_equipment e ON o.equipment_id = e.equipment_id
LEFT JOIN 
	game g ON o.game_id = g.game_id
GROUP BY 
	c.customer_id, 
	c.first_name, 
	c.last_name
ORDER BY 
	total_price DESC;


--Query 12 Count transaction by each employee
SELECT 
    e.employee_id,
    e.first_name,
    e.last_name,
    COUNT(st.type_of_payment) AS total_profit
FROM 
    employee e
LEFT JOIN 
    store_transaction st ON e.employee_id = st.employee_id
GROUP BY 
    e.employee_id, e.first_name, e.last_name
ORDER BY 
    total_profit DESC;


--Query 13 The top 5 games with the highest average rating and the number of reviews
SELECT 
    g.game_id,
    g.game_title,
    AVG(CAST(r.review_rating AS DECIMAL(10,2))) AS avg_rating,
    COUNT(r.review_id) AS num_reviews
FROM 
    game g
LEFT JOIN 
    review r ON g.review_id = r.review_id
GROUP BY 
    g.game_id
ORDER BY 
    avg_rating DESC
LIMIT 5;


--Query 14



--Query 15


