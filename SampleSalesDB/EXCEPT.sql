

SELECT	brand_id, brand_name
FROM	product.product
WHERE	(
			SELECT	DISTINCT brand_id
			FROM	product.product
			WHERE	model_year = 2018

			EXCEPT

			SELECT	DISTINCT brand_id
			FROM	product.product
			WHERE	model_year = 2019
			)


SELECT	brand_id, brand_name
FROM	product.brand
WHERE	brand_id IN (
					SELECT	brand_id
					FROM	product.product
					WHERE	model_year = 2018
					EXCEPT
					SELECT	brand_id
					FROM	product.product
					WHERE	model_year = 2019
					)

SELECT	A.product_id, A.product_NAME
FROM	product.product A
WHERE	A.product_id IN (
		SELECT	A.product_id
		FROM	product.product A, sale.order_item B, sale.orders C
		WHERE	A.product_id = B.product_id
		AND		B.order_id = C.order_id
		AND		C.order_date LIKE '2019%'

		except

		SELECT	A.product_id
		FROM	product.product A, sale.order_item B, sale.orders C
		WHERE	A.product_id = B.product_id
		AND		B.order_id = C.order_id
		AND		C.order_date NOT LIKE '2019%'
		);


SELECT	*
FROM	sale.orders



