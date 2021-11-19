-- Data Types
CREATE TABLE t_date_time (
	A_time time,
	A_date date,
	A_smalldatetime smalldatetime,
	A_datetime datetime,
	A_datetime2 datetime2,
	A_datetimeoffset datetimeoffset
	)

SELECT	*
FROM	t_date_time

SELECT GETDATE()

INSERT	t_date_time
VALUES	(GETDATE(), GETDATE(), GETDATE(), GETDATE(), GETDATE(), GETDATE())

SELECT	*
FROM	t_date_time

SELECT CONVERT(DATE, GETDATE(), 6)

SELECT CONVERT(varchar, GETDATE(), 6)

SELECT CONVERT(DATE, '25 Oct 21', 1)

SELECT YEAR(GETDATE())

SELECT	A_date,
		DATENAME(WEEKDAY, A_date) [weekDAY],
		DAY (A_date) [DAY2],
		MONTH(A_date) [month],
		YEAR (A_date) [year],
		DATEPART(WEEK , A_DATE) WEEK,
		A_Time,
		DATEPART (NANOSECOND, A_time)
FROM	t_date_time



