CREATE TABLE ORDER_TBL
(
ORDER_ID TINYINT NOT NULL,
CUSTOMER_ID TINYINT NOT NULL,
CUSTOMER_NAME VARCHAR(50),
ORDER_DATE DATE,
EST_DELIVERY_DATE DATE--estimated delivery date
);
INSERT ORDER_TBL VALUES (1, 1, 'Adam', GETDATE()-10, GETDATE()-5 ),
						(2, 2, 'Smith',GETDATE()-8, GETDATE()-4 ),
						(3, 3, 'John',GETDATE()-5, GETDATE()-2 ),
						(4, 4, 'Jack',GETDATE()-3, GETDATE()+1 ),
						(5, 5, 'Owen',GETDATE()-2, GETDATE()+3 ),
						(6, 6, 'Mike',GETDATE(), GETDATE()+5 ),
						(7, 7, 'Rafael',GETDATE(), GETDATE()+5 ),
						(8, 8, 'Johnson',GETDATE(), GETDATE()+5 )

--

CREATE TABLE ORDER_DELIVERY
(
ORDER_ID TINYINT NOT NULL,
DELIVERY_DATE DATE -- tamamlanan delivery date
);
SET NOCOUNT ON
INSERT ORDER_DELIVERY VALUES (1, GETDATE()-6 ),
				(2, GETDATE()-2 ),
				(3, GETDATE()-2 ),
				(4, GETDATE() ),
				(5, GETDATE()+2 ),
				(6, GETDATE()+3 ),
				(7, GETDATE()+5 ),
				(8, GETDATE()+5 )

--

SELECT * FROM dbo.ORDER_DELIVERY

SELECT * FROM dbo.ORDER_TBL

--

CREATE FUNCTION dbo.fn_statuoforders(@ORDER_ID INT)
RETURNS VARCHAR(10)
AS
BEGIN
	DECLARE @ORDER_STATUS VARCHAR(10)
	DECLARE @EST_DEL_DATE DATE
	DECLARE @DEL_DATE DATE

	SELECT	@EST_DEL_DATE = EST_DELIVERY_DATE
	FROM	ORDER_TBL
	WHERE	ORDER_ID = @ORDER_ID

	SELECT	@DEL_DATE = DELIVERY_DATE
	FROM	ORDER_DELIVERY
	WHERE	ORDER_ID = @ORDER_ID

	IF @DEL_DATE > @EST_DEL_DATE
		SET	@ORDER_STATUS = 'LATE'
	ELSE IF @DEL_DATE < @EST_DEL_DATE
		SET	@ORDER_STATUS = 'EARLY'
	ELSE
		SET	@ORDER_STATUS = 'ON TIME'
	RETURN @ORDER_STATUS
END

--

SELECT	*, dbo.fn_statuoforders(ORDER_ID) ORDER_STATUS
FROM	ORDER_TBL



