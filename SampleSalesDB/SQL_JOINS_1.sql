SELECT P.product_name, C.category_name
FROM product.product P
INNER JOIN product.category C ON P.category_id = C.category_id
;

-- List employees of stores with their store inf.

SELECT first_name, last_name, store_name
FROM sale.staff STF
INNER JOIN sale.store AS ST ON STF.store_id = ST.store_id
;

-- Write a query that returns products which have never been ordered.


SELECT A.product_id, A.product_name, B.order_id
FROM product.product A
LEFT JOIN sale.order_item B ON A.product_id = B.product_id
WHERE order_id IS NULL
;

-- Report the stok status of the products that product ID is greater than 310 in the stores.


SELECT P.product_id, P.product_name, S.store_id, S.quantity
FROM product.product P
LEFT JOIN product.stock S ON p.product_id = S.product_id
WHERE P.product_id > 310
ORDER BY S.store_id, s.quantity
;

SELECT P.product_id, P.product_name, S.store_id, S.quantity
FROM product.stock S
RIGHT JOIN product.product P ON p.product_id = S.product_id
WHERE P.product_id > 310
ORDER BY S.store_id, s.quantity
;

-- Report the orders inf. made by all staffs.

SELECT A.staff_id, A.first_name, A.last_name, B.*
FROM sale.staff A
LEFT JOIN sale.orders B ON A.staff_id = B.staff_id
ORDER BY B.order_id;

-- White a query that returns stock and order inf. together for all products. (TOP 20)

SELECT A.*, B.order_id, B.list_price
FROM product.stock A
FULL OUTER JOIN sale.order_item B ON A.product_id = B.product_id
ORDER BY product_id

