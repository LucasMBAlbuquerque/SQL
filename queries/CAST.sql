-- EXPLICITANDO O  TIPO DE VARIAVEL --

SELECT CAST(10 AS INT)
SELECT CAST(21.45 AS FLOAT)
SELECT CAST(21.55 AS FLOAT)
SELECT CAST('24.67' AS FLOAT)
SELECT CAST('06/20/2021' AS DATETIME)

-- EXEMPLO -- 

SELECT 'O pre�o do pastel �: ' + CAST(30.99 AS VARCHAR(50))

SELECT CAST('06/20/2021' AS DATETIME) + 1 -- MAIS UM DIA