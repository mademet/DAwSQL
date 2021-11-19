SELECT DISTINCT state
FROM sale.customer X
WHERE	NOT EXISTS
					(
					SELECT A.product_id, A.product_name, B.product_id, B.order_id, C.order_id, C.customer_id, D.*
					FROM	product.product A, sale.order_item B, sale.orders C, sale.customer D
					WHERE	A.product_id = B.product_id
					AND		B.order_id = C.order_id
					AND		C.customer_id = D.customer_id
					AND		A.product_name = 'Trek Remedy 9.8 - 2019'
					AND		X.state = D.state
					)


SELECT A.product_id, A.product_name, B.product_id, B.order_id, C.order_id, C.customer_id, D.*
FROM	product.product A, sale.order_item B, sale.orders C, sale.customer D
WHERE	A.product_id = B.product_id
AND		B.order_id = C.order_id
AND		C.customer_id = D.customer_id
AND		A.product_name = 'Trek Remedy 9.8 - 2019'

CREATE VIEW new_view AS
SELECT	DISTINCT product.product_id, product.product_name, product.model_year
FROM	product.product
WHERE	model_year > 2019
;

SELECT *
FROM new_view
;


-- List the customers who ordered before the last order of Sharyn Hopkins and located in San Diego

SELECT	A.customer_id,A.first_name, A.last_name, B.order_date, A.state
FROM	sale.customer A, sale.orders B
WHERE	A.state = 'San Diego'
AND		NOT (A.first_name = 'Sharyn' AND A.last_name = 'Hopkins')
AND		B.order_date < (
			SELECT TOP 1 B.order_date
			FROM sale.orders B
			WHERE A.first_name = 'Sharyn' AND A.last_name = 'Hopkins'
			ORDER BY B.order_date)
;


WITH T1 AS
(
SELECT	max(order_date) last_purchase
FROM	sale.customer A, sale.orders B
WHERE	A.customer_id = B.customer_id
AND		A.first_name = 'Sharyn'
AND		A.last_name = 'Hopkins'
) 
SELECT	DISTINCT A.order_date, A.order_id, B.customer_id, B.first_name, B.last_name, B.city
FROM	sale.orders A, sale.customer B, T1
WHERE	A.customer_id = B.customer_id
AND		A.order_date < T1.last_purchase
AND		B.city = 'San Diego'
