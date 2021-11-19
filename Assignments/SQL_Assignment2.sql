CREATE TABLE Actions(
Visitor_ID int,
Adv_Type varchar(255),
Action varchar(255));

INSERT INTO Actions
VALUES	(1,'A','Left'),
		(2,'A','Order'),
		(3,'B','Left'),
		(4,'A','Order'),
		(5,'A','Review'),
		(6,'A','Left'),
		(7,'B','Left'),
		(8,'B','Order'),
		(9,'B','Review'),
		(10,'A','Review');

SELECT *
FROM Actions

SELECT	Adv_Type, Action, COUNT(Action) Count_of_Actions
FROM	Actions
GROUP BY Adv_Type, Action
ORDER BY Adv_Type, Action;



WITH T1 AS(
SELECT Adv_Type,COUNT(Action) Count_of_Order
FROM Actions
WHERE Action = 'Order'
group by Adv_Type)


SELECT	ACT.Adv_Type Adv_Type, CAST((CAST((T1.Count_of_Order)AS float) / COUNT(Action)) AS decimal(3,2))  Conversion_Rate
FROM	Actions ACT, T1
WHERE	ACT.Adv_Type = T1.Adv_Type
GROUP BY ACT.Adv_Type,T1.Count_of_Order;

SELECT	A.Adv_Type, CAST(CAST(B.Action_Count AS float) / COUNT(A.Action) AS NUMERIC(3,2)) Order_Ratio
FROM	Actions A, (
			SELECT	Adv_Type, Action, COUNT(Action) Action_Count
			FROM	Actions
			WHERE	Action = 'Order'
			GROUP BY Adv_Type, Action) B
WHERE	A.Adv_Type = B.Adv_Type
GROUP BY A.Adv_Type, B.Action_Count






