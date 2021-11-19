SELECT	order_id, order_status,
	CASE	ORDER_STATUS
		WHEN	1 THEN	'PENDING'
		WHEN	2 THEN	'PROCESSING'
		WHEN	3 THEN	'REJECTED'
		WHEN	4 THEN	'COMPLETED'
	END	AS STATUS
FROM	sale.orders


SELECT	A.first_name, A.last_name, A.store_id,
	CASE A.store_id
		WHEN 1 THEN	'Sacramento Bikes'
		WHEN 2 THEN	'Buffalo Bikes'
		WHEN 3 THEN	'San Angelo Bikes'
	end AS STORE_NAME
FROM	sale.staff A


select order_id,order_status,
	case
	when order_status = 1 then 'Pending'
	when order_status = 2 then 'Processing'
	when order_status = 3 then 'Rejected'
	when order_status = 4 then 'Completed'
	end as status_name
from sale.orders



SELECT	A.first_name, A.last_name, A.email, 
	CASE 
		WHEN A.email LIKE '%yahoo.com'  THEN 'Yahoo'
		WHEN A.email LIKE '%hotmail.com'  THEN 'Hotmail'
		WHEN A.email LIKE '%gmail.com'  THEN 'Gmail'
		WHEN A.email IS NOT NULL THEN 'Other'
	END AS Service
FROM	sale.customer A
ORDER BY Service

SELECT	A.first_name, A.last_name, A.email, 
	CASE A.email
		WHEN LIKE '%yahoo.com'  THEN 'Yahoo'
		WHEN LIKE '%hotmail.com'  THEN 'Hotmail'
		WHEN LIKE '%gmail.com'  THEN 'Gmail'
		ELSE  'Other'
	END AS Service
FROM	sale.customer A



