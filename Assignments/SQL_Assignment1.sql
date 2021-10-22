CREATE TABLE assignment1
(
Sender_ID int,
Receiver_ID int,
Amount int,
Transaction_Date date
)
;


INSERT INTO assignment1 (Sender_ID, Receiver_ID, Amount, Transaction_Date)
values 
(55, 22, 500, '2021-05-18'),
(11, 33, 350, '2021-05-19'),
(22, 11, 650, '2021-05-19'),
(22, 33, 900, '2021-05-20'),
(33, 11, 500, '2021-05-21'),
(33, 22, 750, '2021-05-21'),
(11, 44, 300,  '2021-05-22')
;

select *
from assignment1;

SELECT	Sender_ID, SUM(amount) AS send_amount
FROM	assignment1
GROUP BY Sender_ID;



SELECT	Receiver_ID, SUM(amount) AS receive_amount
FROM	assignment1
GROUP BY Receiver_ID;


SELECT	COALESCE(S.Sender_ID, R.Receiver_ID) Account_ID, 
		COALESCE(R.receive_amount, 0)-COALESCE(S.send_amount, 0) Net_Change
FROM	(
		SELECT	Sender_ID, SUM(amount) AS send_amount
		FROM	assignment1
		GROUP BY Sender_ID
		) S
FULL OUTER JOIN	
		(
		SELECT	Receiver_ID, SUM(amount) AS receive_amount
		FROM	assignment1
		GROUP BY Receiver_ID
		) R
ON		S.Sender_ID = R.Receiver_ID;