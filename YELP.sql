SELECT *
FROM YelpDataset;

--Target Variable 
SELECT is_open
	,COUNT (is_open) AS Count
	,CAST(COUNT (is_open) * 100.0/(SELECT COUNT (*) FROM YelpDataset) as decimal (16,2)) as 'Percentage'
FROM YelpDataset
GROUP BY is_open;


-- is_chain variable
SELECT is_chain
	,COUNT (is_chain) AS Count
	,CAST(COUNT (is_chain) * 100.0/(SELECT COUNT (*) FROM YelpDataset) as decimal (16,2)) as 'Percentage'
FROM YelpDataset
GROUP BY is_chain;

SELECT is_open, is_chain
	,COUNT (is_chain) AS Count
	,CAST(COUNT (is_open) * 100.0/(SELECT COUNT (is_chain) FROM YelpDataset) as decimal (16,2)) as 'Percentage'
FROM YelpDataset
GROUP BY is_chain, is_open;

-- Entertainment Variable
SELECT Entertainment
	,COUNT (Entertainment) AS Count
	,CAST(COUNT (Entertainment) * 100.0/(SELECT COUNT (*) FROM YelpDataset) as decimal (16,2)) as 'Percentage'
FROM YelpDataset
GROUP BY Entertainment;

SELECT is_open, Entertainment
	,COUNT (Entertainment) AS Count
	,CAST(COUNT (is_open) * 100.0/(SELECT COUNT (entertainment) FROM YelpDataset) as decimal (16,2)) as 'Percentage'
	,CAST (AVG (review_count) as decimal (16,0))AS 'Average Reviews'
FROM YelpDataset
GROUP BY Entertainment, is_open;

-- Reviews
SELECT AVG (review_count) AS 'Average Reviews'
FROM YelpDataset

SELECT is_open
	,COUNT (is_open) AS Count
	,CAST (AVG (review_count) as decimal (16,0))AS 'Average Reviews'
FROM YelpDataset
GROUP BY is_open;

-- Good for Dinner
SELECT good_for_dinner
	,COUNT (good_for_dinner) AS Count
	,CAST(COUNT (good_for_dinner) * 100.0/(SELECT COUNT (*) 
	FROM YelpDataset) as decimal (16,2)) as 'Percentage'
FROM YelpDataset
GROUP BY good_for_dinner;

SELECT Good_for_dinner, is_open
	,COUNT (good_for_dinner) AS Count
	,CAST(COUNT (good_for_dinner) * 100.0/(SELECT COUNT (good_for_dinner) FROM YelpDataset) as decimal (16,2)) as 'Percentage'
	,CAST (AVG (review_count) as decimal (16,0))AS 'Average Reviews'
FROM YelpDataset
GROUP BY is_open, good_for_dinner;

-- delivery variable
SELECT delivery, COUNT(*) AS 'Count of Restaurants'
	,CAST(COUNT (delivery) * 100.0/(SELECT COUNT (delivery) FROM YelpDataset) as decimal (16,2)) as 'Percentage'
FROM YelpDataset
GROUP BY delivery;

SELECT is_open, delivery
	, COUNT(delivery) AS 'Count'
	, CAST(COUNT (delivery) * 100.0/(SELECT COUNT (delivery) FROM YelpDataset) as decimal (16,2)) as 'Percentage'
FROM YelpDataset
GROUP BY delivery, is_open;

SELECT Delivery, is_open
	, COUNT(delivery) AS 'Count'
	, CAST (COUNT (delivery) * 100.0 / sum(count(delivery)) over(partition by delivery)as decimal (16,2)) as 'Percentage'
FROM YelpDataset
GROUP BY delivery, is_open;

-- Fast Food
SELECT FastFood, COUNT(*) AS 'Count'
	,CAST(COUNT (FastFood) * 100.0/(SELECT COUNT (FastFood) FROM YelpDataset) as decimal (16,2)) as 'Percentage'
FROM YelpDataset
GROUP BY FastFood;

SELECT FastFood, is_open
	, COUNT(FastFood) AS 'Count'
	, CAST (COUNT (FastFood) * 100.0 / sum(count(FastFood)) over(partition by FastFood)as decimal (16,2)) as 'Percentage'
FROM YelpDataset
GROUP BY FastFood, is_open;

-- State
SELECT state, COUNT(*) AS 'Count of Restaurants'
FROM YelpDataset
GROUP BY state
ORDER BY 'Count of Restaurants' DESC;


