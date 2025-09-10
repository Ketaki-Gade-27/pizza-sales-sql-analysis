
CREATE	DATABASE pizza_project

USE pizza_project


ALTER TABLE order_details 
ADD FOREIGN KEY(order_id) 
	REFERENCES orders(order_id)

ALTER TABLE order_details 
ADD FOREIGN KEY(pizza_id) 
	REFERENCES pizzas(pizza_id)

ALTER TABLE pizzas
ADD FOREIGN KEY(pizza_type_id)
	REFERENCES pizza_types(pizza_type_id)


-- Check for constraints

EXEC sp_helpconstraint 'order_details'

EXEC sp_helpconstraint 'pizzas'



--------------------------------------
--------------------------------------

-- 1.How many orders were placed in total?

SELECT COUNT(order_id) as Total_orders
FROM orders


-- 2. How many unique pizzas are available on the menu?

SELECT COUNT(pizza_type_id) available_pizza_count 
FROM pizza_types


-- 3. What are the different pizza categories and sizes available?

SELECT DISTINCT(category) [Categories]
FROM pizza_types

SELECT DISTINCT(size) [size]
FROM pizzas 


-- 4. What is the trend of orders per day/week/month?

-- trend of orders per day

SELECT o.date, COUNT(o.order_id) total_orders
FROM orders o
GROUP BY o.date
ORDER BY o.date

-- trend of orders per week

SELECT DATEPART(WEEK, o.date) as [week], 
		COUNT(o.order_id) as total_orders
FROM orders o
GROUP BY DATEPART(WEEK, O.date)
ORDER BY [week]

-- trend of orders per month

SELECT 	DATENAME(MONTH, o.date) [month],
		DATEPART(MONTH, o.date) month_no,
		COUNT(o.order_id) total_orders
FROM orders o
GROUP BY DATENAME(MONTH, o.date),
		DATEPART(MONTH, o.date)
ORDER BY month_no


-- 5. What days of the week and times of the day is the restaurant the busiest?

ALTER TABLE orders
ADD [Day] AS DATENAME(WEEKDAY, date),
	[Hour] AS DATEPART(HOUR, time)


WITH cte_orders
AS (
	SELECT [DAY], [Hour], COUNT([order_id]) Total_orders
	FROM orders
	GROUP BY [DAY], [Hour]
	)
SELECT  * FROM cte_orders
ORDER BY Total_orders DESC


-- 6. How many pizzas are made during peak periods?

SELECT * FROM orders_details

WITH cte_orders_peak
AS (
	SELECT o.[Day], o.[Hour], SUM(od.quantity) AS Total_orders
	FROM orders o
	join order_details od on o.order_id = od.order_id
	GROUP BY [DAY], [Hour]
	)
SELECT  TOP 5 * FROM cte_orders_peak
ORDER BY Total_orders DESC


-- 7. What is the average number of pizzas per order?

SELECT AVG(order_total) AS avg_pizzas_per_order
FROM (
    SELECT od.order_id, SUM(od.quantity) AS order_total
    FROM order_details od
    GROUP BY od.order_id
) t;


-- 8. What is the total revenue generated?

WITH cte_revenue
AS (
	SELECT od.pizza_id, od.quantity, p.price, od.quantity*p.price as total_cost
	FROM order_details od
	JOIN pizzas p ON p.pizza_id = od.pizza_id
	)

SELECT ROUND(SUM(total_cost), 2) FROM cte_revenue

					-- OR -- 

SELECT ROUND(SUM(od.quantity * p.price), 4) total_revevue
FROM order_details od 
join pizzas p On p.pizza_id = od.pizza_id


-- 9. What is the average order value (AOV)?

SELECT AVG(tc.total_cost) AOV
FROM (
	SELECT od.order_id, SUM(p.price) total_cost 
	FROM order_details od
	JOIN pizzas p ON p.pizza_id = od.pizza_id
	GROUP BY od.order_id
	) tc


-- 10. Which pizza size contributes the most to total revenue?

SELECT TOP 1 p.size, ROUND(SUM(od.quantity * p.price),4) AS total_price
FROM order_details od
JOIN pizzas p ON p.pizza_id = od.pizza_id
GROUP BY p.size
ORDER BY total_price DESC


-- 11. Which pizza category (Classic, Chicken, Supreme, Veggie) generates the highest revenue?

SELECT TOP 1 pt.category, ROUND(SUM(p.price * od.quantity),4) total_revenue 
FROM pizza_types pt
JOIN pizzas p ON P.pizza_type_id = pt.pizza_type_id
JOIN order_details od ON od.pizza_id = p.pizza_id
GROUP BY pt.category
ORDER BY total_revenue DESC


-- 12. What is the monthly/quarterly revenue trend?

ALTER TABLE orders
ADD [month_name] AS DATENAME(MONTH, [date]) 

SELECT  o.month_name, o.[month], ROUND(SUM(p.price * od.quantity), 2) total_revenue
FROM order_details od
JOIN pizzas p ON p.pizza_id = od.pizza_id
JOIN orders o ON o.order_id = od.order_id
GROUP BY o.month_name, o.[month]
ORDER BY o.[month]


-- 13 . What are the top 5 best-selling pizzas by quantity?

SELECT TOP 5 pt.pizza_type_id, SUM(od.quantity) Orders
FROM order_details od
JOIN pizzas p ON p.pizza_id = od.pizza_id
JOIN pizza_types pt ON pt.pizza_type_id = p.pizza_type_id
GROUP BY pt.pizza_type_id
ORDER BY Orders DESC


--14. Which pizzas generate the highest revenue?

SELECT TOP 1 pt.pizza_type_id, ROUND(SUM(od.quantity * p.price),2) revenue
FROM order_details od
JOIN pizzas p ON p.pizza_id = od.pizza_id
JOIN pizza_types pt ON pt.pizza_type_id = p.pizza_type_id
GROUP BY pt.pizza_type_id
ORDER BY revenue DESC


-- 15. What are the bottom 5 worst-selling pizzas by quantity?

SELECT TOP 5 pt.pizza_type_id, SUM(od.quantity) Orders
FROM order_details od
JOIN pizzas p ON p.pizza_id = od.pizza_id
JOIN pizza_types pt ON pt.pizza_type_id = p.pizza_type_id
GROUP BY pt.pizza_type_id
ORDER BY Orders


-- 16. Which pizzas are ordered frequently but generate low revenue (popular but cheap)?

WITH pizza_stats 
AS (
    SELECT pt.pizza_type_id,
           SUM(od.quantity) total_pizzas_ordered,
           COUNT(DISTINCT od.order_id) total_orders,
           SUM(od.quantity * p.price) revenue
    FROM order_details od
    JOIN pizzas p ON p.pizza_id = od.pizza_id
    JOIN pizza_types pt ON pt.pizza_type_id = p.pizza_type_id
    GROUP BY pt.pizza_type_id
	)
SELECT * FROM pizza_stats
WHERE total_pizzas_ordered > (SELECT AVG(total_pizzas_ordered) FROM pizza_stats)   
  AND revenue < (SELECT AVG(revenue) FROM pizza_stats)                            
ORDER BY revenue ASC



-- 17. Which pizzas generate very little revenue (least popular + least profitable)?

WITH pizza_stats 
AS (
    SELECT pt.pizza_type_id,
           SUM(od.quantity) total_pizzas_ordered,
           COUNT(DISTINCT od.order_id) total_orders,
           SUM(od.quantity * p.price) revenue
    FROM order_details od
    JOIN pizzas p ON p.pizza_id = od.pizza_id
    JOIN pizza_types pt ON pt.pizza_type_id = p.pizza_type_id
    GROUP BY pt.pizza_type_id
	)
SELECT * FROM pizza_stats
WHERE total_pizzas_ordered < (SELECT AVG(total_pizzas_ordered) FROM pizza_stats)   
  AND revenue > (SELECT AVG(revenue) FROM pizza_stats)                            
ORDER BY revenue ASC



-- 18. What percentage of total revenue does each pizza category contribute?

SELECT pt.category, ROUND(SUM(od.quantity * p.price),2) revenue,
ROUND((ROUND(SUM(od.quantity * p.price),2) * 100 / (SELECT ROUND(SUM(od.quantity * p.price),2) revenue 
										FROM order_details od
										JOIN pizzas p ON p.pizza_id = od.pizza_id
										JOIN pizza_types pt ON pt.pizza_type_id = p.pizza_type_id)),2)
											AS percentage_contribution
FROM order_details od
JOIN pizzas p ON p.pizza_id = od.pizza_id
JOIN pizza_types pt ON pt.pizza_type_id = p.pizza_type_id
GROUP BY pt.category



-- 19. Rank pizzas by revenue contribution (Top 10).

WITH cte_rank
AS (
	SELECT pt.pizza_type_id, ROUND(SUM(od.quantity * p.price), 2) revenue
	FROM order_details od
		JOIN pizzas p ON p.pizza_id = od.pizza_id
		JOIN pizza_types pt ON pt.pizza_type_id = p.pizza_type_id
		GROUP BY pt.pizza_type_id
	)

SELECT TOP 10 *, ROW_NUMBER() OVER(ORDER BY revenue DESC) AS rn
FROM cte_rank



-- 20. If a 10% discount is applied on Supreme pizzas, how much revenue loss will occur?

WITH cte_discount
AS (
	SELECT p.size, od.quantity, p.price, (p.price *10/100) AS discount
	FROM order_details od
	JOIN pizzas p ON p.pizza_id = od.pizza_id
	WHERE p.size = 's'
	)
SELECT ROUND((SUM(price) - SUM(discount)), 2) loss FROM cte_discount



-- 21. Compare small vs large pizzas: which size is more profitable overall?

SELECT TOP 1 p.size, ROUND(SUM(od.quantity * p.price), 2) profit
FROM order_details od
JOIN pizzas p on p.pizza_id = od.pizza_id
WHERE p.size IN ('s', 'l')
GROUP BY p.size
ORDER BY profit DESC

