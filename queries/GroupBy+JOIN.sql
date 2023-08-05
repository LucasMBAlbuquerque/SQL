-- GROUP BY + JOIN

SELECT
	SUM(SalesQuantity) AS 'Total Vendido',
	CalendarYear AS 'Ano'
FROM
	FactSales
INNER JOIN DimDate
	ON FactSales.DateKey = DimDate.Datekey
WHERE MONTH(FactSales.DateKey) = 01
GROUP BY CalendarYear
HAVING SUM(SalesQuantity) >=1200000

--COMANDO COM O MESMO RETORNO, MAIS DEVAGAR

SELECT
	SUM(SalesQuantity) AS 'Total Vendido',
	CalendarYear AS 'Ano'
FROM
	FactSales
INNER JOIN DimDate
	ON FactSales.DateKey = DimDate.Datekey
WHERE CalendarMonthLabel = 'January'
GROUP BY CalendarYear
HAVING SUM(SalesQuantity) >=1200000