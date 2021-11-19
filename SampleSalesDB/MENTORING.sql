SELECT	B.brand_id, B.brand_name, COALESCE(SUM(C.quantity), 0) QUANTITY, YEAR.O_YEAR
FROM	product.product A, product.brand B, sale.order_item C--, --sale.orders D
FULL OUTER JOIN  (
	SELECT DISTINCT YEAR(D.ORDER_DATE) O_YEAR, order_id
	FROM sale.orders D) YEAR ON C.order_id = YEAR.order_id
WHERE	A.brand_id = B.brand_id
AND		A.product_id = C.product_id
--AND		C.order_id = D.order_id
GROUP BY B.brand_id, B.brand_name, YEAR.O_YEAR
ORDER BY brand_id, YEAR.O_YEAR

SELECT	brand_id
FROM	product.brand


SELECT D.STORE_NAME
FROM (
SELECT	TOP 1 A.store_name STORE_NAME, SUM(C.quantity) ASD
FROM	sale.store A, sale.orders B, sale.order_item C
WHERE	A.store_id = B.store_id
AND		B.order_id = C.order_id
AND		YEAR(order_date) = 2018
GROUP BY A.STORE_NAME
ORDER BY ASD DESC) D;


Select D.store_name
From
(select TOP 1 A.store_name , COUNT(C.quantity ) as most_sales_quantity
	from sale.store A, sale.orders B, sale.order_item C
	where A.store_id =B.store_id and B.order_id=C.order_id  and year(B.order_date)= 2018
    group by  A.store_name
	order by most_sales_quantity desc) D;

SELECT D.STORE_NAME
FROM (
SELECT	A.store_name STORE_NAME, SUM(C.quantity) ASD
FROM	sale.store A, sale.orders B, sale.order_item C
WHERE	A.store_id = B.store_id
AND		B.order_id = C.order_id
AND		YEAR(order_date) = 2018
GROUP BY A.STORE_NAME
ORDER BY ASD DESC) D;







CASE ORDER_DATE
			WHEN '2018%' THEN 2018
			WHEN '2019%' THEN 2019
			WHEN '2020%' THEN 2020
		END AS ORDER_YEAR

SELECT * 
FROM sale.orders