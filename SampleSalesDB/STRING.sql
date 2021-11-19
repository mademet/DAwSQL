--CHARINDEX

SELECT	CHARINDEX('C', 'XCHARACTER') --RETURNS THE FIRST

SELECT	CHARINDEX('C', 'CHARACTER', 2) --RETURNS AFTER 2

--PATINDEX

SELECT	PATINDEX('CT', 'CHARACTER') --CANT USE WITHOUT %

SELECT	PATINDEX('%CT%', 'CHARACTER')

SELECT	PATINDEX('%R', 'CHARACTER')

SELECT	PATINDEX('___R%', 'CHARACTER') --IF YOU KNOW THE AMOUNT OF CHARACTERS IN ANY WHERE

--LEFT - RIGHT

SELECT	LEFT ('CHARACTER', 3) --RETURNS 3 CHAR FROM LEFT,

SELECT	RIGHT ('CHARACTER', 4) --RETURNS 4 CHAR FROM RIGHT,

--SUBSTRING

SELECT SUBSTRING('CHARACTER', 2, 4)

--LOWER - UPPER

SELECT LOWER('CHARACTER')

SELECT UPPER(SUBSTRING('character', 1, 1)) + LOWER(SUBSTRING('character', 2, LEN('character')))

--SPRING_SPLIT

SELECT VALUE FROM string_split('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do 
eiusmod tempor incididunt ut labore et dolore magna aliqua.', ' ') LOREM

--TRIM L&R

SELECT TRIM(',' FROM (replace(LOREM.value, '.', ','))) LOREM_TRIM
FROM
(SELECT value
FROM string_split('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', ' ')) LOREM







