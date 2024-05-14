--Query 1 Find the percentage of total revenue contributed by each equipment category and which category provides the most revenue (round it to 2 decimal places):
SELECT 
    ec.category_name, 
    ROUND(SUM(e.equipment_price * e.quantity) / 
        (SELECT SUM(e.equipment_price * e.quantity) 
        FROM equipment e) * 100, 2) AS revenue_percentage
FROM 
    equipment e
INNER JOIN 
    equipment_category ec ON e.category_id = ec.category_id
GROUP BY 
    ec.category_name
ORDER BY 
	revenue_percentage DESC;


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
    MIN(e.equipment_price) AS min_price,
	ROUND(AVG(e.equipment_price), 2) AS average_price,
    MAX(e.equipment_price) AS max_price
FROM 
    equipment e
INNER JOIN 
    equipment_category ec ON e.category_id = ec.category_id
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


--Query 6 Average price of each category but displaying all equipments
SELECT
	e.equipment_name,
	c.category_id,
	ROUND(AVG(e.equipment_price) OVER
		  	(PARTITION BY c.category_id), 2) AS average_price
FROM
	equipment e
RIGHT JOIN equipment_category c
	ON c.category_id = e.category_id
ORDER BY
	c.category_id;


--Query 7 Finding the months that has the highest to lowest sales

SELECT
	EXTRACT(MONTH FROM o.order_date) AS month_number,
	CASE 
		WHEN EXTRACT(MONTH FROM o.order_date) = 1
			THEN 'January'
		 WHEN EXTRACT(MONTH FROM o.order_date) = 2
			THEN 'February'
		 WHEN EXTRACT(MONTH FROM o.order_date) = 3
			THEN 'March'
	 	 WHEN EXTRACT(MONTH FROM o.order_date) = 4
			THEN 'April'
		 WHEN EXTRACT(MONTH FROM o.order_date) = 5
		 	THEN 'May'
		 END AS month_name,
	MAX(COALESCE(g.game_price, 0) +
	    	COALESCE(e.equipment_price, 0)) AS maximum_sale
FROM
	orders o
JOIN store_transaction t
	ON t.order_id = o.order_id
JOIN game g
	ON g.game_id = o.game_id
JOIN equipment e
	ON e.equipment_id = o.equipment_id
GROUP BY
	month_number
ORDER BY
	maximum_sale DESC;


--Query 8 Finding the number of products sold from different manufacturers with its most expensive and cheapest product price from game and equipment each
SELECT
	p.manufacturer,
	COUNT(DISTINCT g.game_id) +
		COUNT(DISTINCT e.equipment_id) AS total_products,
	MAX(e.equipment_price) AS highest_game_price,
	MIN(e.equipment_price) AS lowest_game_price,
	MAX(g.game_price) AS highest_equipment_price,
	MIN(g.game_price) AS lowest_equipment_price
FROM
	platform p
JOIN game g
	ON g.platform_id = p.platform_id
JOIN equipment e
	ON e.platform_id = p.platform_id
GROUP BY
	p.manufacturer;


--Query 9 Ranking games according to their genre in terms of price
SELECT
	g.game_title,
	ge.genre_name,
	g.game_price,
	RANK() OVER
		(PARTITION BY ge.genre_name
		 ORDER BY
			g.game_price)
FROM
	genre ge
JOIN game g
	ON g.genre_id = ge.genre_id;
	

--Query 10 Current average number of sales for each country
SELECT
	s.store_country,
	ROUND(AVG(g.game_price), 2) AS average_sale
FROM
	store s
JOIN employee e
	ON e.store_id = s.store_id
JOIN store_transaction t
	ON t.employee_id = e.employee_id
JOIN orders o
	ON o.order_id = t.order_id
JOIN game g
	ON g.game_id = o.game_id
GROUP BY
	s.store_country
ORDER BY
	average_sale;


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
	equipment e ON o.equipment_id = e.equipment_id
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


--Query 14 List Customers Who Bought Games of a Specific Genre and Provide Their Order Details
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    o.order_id,
    g.game_title,
    g.release_date,
    ec.category_name AS equipment_category,
    e.equipment_name,
    e.equipment_price,
    (COALESCE(g.game_price, 0) + COALESCE(e.equipment_price, 0)) AS total_amount_spent
FROM 
    customer c
JOIN 
    orders o ON c.customer_id = o.customer_id
LEFT JOIN 
    game g ON o.game_id = g.game_id
LEFT JOIN 
    genre ge ON g.genre_id = ge.genre_id
LEFT JOIN 
    equipment e ON o.equipment_id = e.equipment_id
LEFT JOIN 
    equipment_category ec ON e.category_id = ec.category_id
WHERE 
    ge.genre_name = 'Action'
ORDER BY 
    c.customer_id, o.order_id;


--Query 15 Customer Purchase History with Detailed Order Information
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    o.order_id,
    o.order_date,
    g.game_title,
    e.equipment_name,
    COALESCE(g.game_price, 0) + COALESCE(e.equipment_price, 0) AS total_amount
FROM 
    customer c
JOIN 
    orders o ON c.customer_id = o.customer_id
LEFT JOIN 
    game g ON o.game_id = g.game_id
LEFT JOIN 
    equipment e ON o.equipment_id = e.equipment_id
ORDER BY 
    c.customer_id, o.order_date;


