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
SELECT * FROM genre;
SELECT * FROM game;
SELECT * FROM table_equipment;
SELECT * FROM equipment_category;

SELECT
	c.category_id,
	COUNT(e.equipment_id) AS number_of_equipments,
	ROUND(AVG(e.equipment_price), 2) AS average_price
FROM
	table_equipment e
JOIN equipment_category c
	ON c.category_id = e.category_id
GROUP BY
	c.category_id;


--Query 7 Find the number of sales according to the month of a specific year (to be picked) withe famous product bought for that month?



--Query 8 Something pasal Manufacturer of each store 



--Query 9 Number of produced products each year ...



--Query 10 



--Query 11



--Query 12



--Query 13



--Query 14



--Query 15


