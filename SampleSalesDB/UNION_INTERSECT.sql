-- UNION combines the tables(has to have same numbers of columns and data type)

SELECT	last_name
FROM	sale.customer
WHERE	city = 'Sacramento'

UNION ALL

SELECT	last_name
FROM	sale.customer
WHERE	city = 'Monroe'

-- UNION doesnt returns repeatings.

SELECT	last_name
FROM	sale.customer
WHERE	city = 'Sacramento'

UNION

SELECT	last_name
FROM	sale.customer
WHERE	city = 'Monroe'

-- List the customers whos first or last names are Carter.

SELECT	first_name, last_name
FROM	sale.customer
WHERE	first_name = 'Carter'

UNION

SELECT	first_name, last_name
FROM	sale.customer
WHERE	last_name = 'Carter'

--List the barnds that have products in 2018 and 2019.

SELECT	B.brand_name
FROM	product.product A, product.brand B
WHERE	A.brand_id = B.brand_id
AND		A.model_year = 2018

INTERSECT

SELECT	B.brand_name
FROM	product.product A, product.brand B
WHERE	A.brand_id = B.brand_id
AND		A.model_year = 2019

--

SELECT	A.first_name, A.last_name
FROM	sale.customer A, sale.orders B
WHERE	B.order_date BETWEEN '2018-01-01' AND '2018-12-31'
AND		

INTERSECT

SELECT	A.first_name, A.last_name
FROM	sale.customer A, sale.orders B
WHERE	B.order_date BETWEEN '2019-01-01' AND '2019-12-31'

INTERSECT

SELECT	A.first_name, A.last_name
FROM	sale.customer A, sale.orders B
WHERE	B.order_date BETWEEN '2020-01-01' AND '2020-12-31'



SELECT	customer_id, first_name, last_name
FROM	sale.customer
WHERE	customer_id IN	(
						SELECT	customer_id
						FROM	SALE.orders
						WHERE	order_date BETWEEN '2018-01-01' AND '2018-12-31'
						INTERSECT
						SELECT	customer_id
						FROM	SALE.orders
						WHERE	order_date BETWEEN '2019-01-01' AND '2019-12-31'
						INTERSECT
						SELECT	customer_id
						FROM	SALE.orders
						WHERE	order_date BETWEEN '2020-01-01' AND '2020-12-31'
						)
