-- 1 -- a

SELECT
	SUM(SalesQuantity) AS 'Qtd. Vendas',
	AVG(SalesQuantity) AS 'Media Vendas',
	ChannelName  AS 'Nome do Canal'
FROM
	FactSales
INNER JOIN DimChannel
	ON FactSales.channelKey = DimChannel.ChannelKey
GROUP BY ChannelName
ORDER BY SUM(SalesQuantity) DESC

-- 1 -- b

SELECT
	SUM(SalesQuantity) AS 'Total Vendas',
	SUM(ReturnQuantity) AS 'Total devolvidos',
	StoreName AS 'Nome da Loja'
FROM
	FactSales
INNER JOIN DimStore
	ON FactSales.StoreKey = DimStore.StoreKey
GROUP BY StoreName

-- 1 -- c

SELECT
	CalendarYear AS 'Ano',
	CalendarMonthLabel AS 'Mes',
	SUM(SalesAmount) AS 'Faturamento Total'
FROM
	FactSales
INNER JOIN DimDate
	ON FactSales.DateKey = DimDate.Datekey
GROUP BY CalendarYear, CalendarMonth, CalendarMonthLabel
ORDER BY CalendarYear, CalendarMonth

-- 2 -- a

SELECT
	ColorName AS 'Cor do Produto',
	SUM(SalesQuantity) AS 'Qtd. Vendidas'
FROM
	FactSales
INNER JOIN DimProduct
	ON FactSales.ProductKey = DimProduct.ProductKey
GROUP BY ColorName
ORDER BY SUM(SalesQuantity) DESC

-- 2 -- b

SELECT
	ColorName AS 'Cor do Produto',
	SUM(SalesQuantity) AS 'Qtd. Vendidas'
FROM
	FactSales
INNER JOIN DimProduct
	ON FactSales.ProductKey = DimProduct.ProductKey
GROUP BY ColorName
HAVING SUM(SalesQuantity) > 3000000
ORDER BY SUM(SalesQuantity) DESC

-- 3 --

SELECT
	ProductCategoryName AS 'Nome Categoria Produto',
	SUM(FactSales.SalesQuantity) AS 'Qtd. Vendas'
FROM
	FactSales
INNER JOIN DimProduct
	ON FactSales.ProductKey = DimProduct.ProductKey
		INNER JOIN DimProductSubCategory
			ON DimProduct.ProductSubcategoryKey=DimProductSubcategory.ProductSubcategoryKey
				INNER JOIN DimProductCategory
					ON DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey
GROUP BY ProductCategoryName

-- 4 -- a

SELECT
	FirstName 'Nome',
	LastName 'Sobrenome',
	FactOnlineSales.CustomerKey 'Cliente ID',
	SUM(SalesQuantity) AS 'Qtd. Vendas'
FROM
	FactOnlineSales
INNER JOIN DimCustomer
	ON FactOnlineSales.CustomerKey = DimCustomer.CustomerKey
WHERE CustomerType = 'Person'
GROUP BY FirstName, LastName, FactOnlineSales.CustomerKey
ORDER BY SUM(SalesQuantity) DESC

---- 4 -- b

SELECT TOP(10)
	ProductName 'Nome Produto',
	SUM(SalesQuantity) 'Qtd. Vendas'
FROM
	FactOnlineSales
INNER JOIN DimProduct
	ON FactOnlineSales.ProductKey = DimProduct.ProductKey
WHERE FactOnlineSales.CustomerKey = 7665
GROUP BY ProductName
ORDER BY SUM(SalesQuantity) DESC

-- 5 --

SELECT
	Gender 'Sexo',
	SUM(SalesQuantity) 'Qtd. Vendas'
FROM
	FactOnlineSales
INNER JOIN DimCustomer
	ON FactOnlineSales.CustomerKey = DimCustomer.CustomerKey
WHERE CustomerType = 'Person'
GROUP BY Gender
HAVING Gender IS NOT NULL -- Caso queira so os F e M.

-- 6 --

SELECT
	AVG(AverageRate) 'Taxa Media',
	CurrencyDescription
FROM
	FactExchangeRate
INNER JOIN DimCurrency
	ON FactExchangeRate.CurrencyKey = DimCurrency.CurrencyKey
GROUP BY CurrencyDescription
HAVING AVG(AverageRate) BETWEEN 10 AND 100
--HAVING AVG(AverageRate) >=10 AND AVG(AverageRate) <=100 - OUTRA OPCAO

-- 7 --

SELECT
	ScenarioName 'Cenario',
	SUM(Amount) 'Total'
FROM
	FactStrategyPlan
INNER JOIN DimScenario
	ON FactStrategyPlan.ScenarioKey = DimScenario.ScenarioKey
GROUP BY ScenarioName
HAVING ScenarioName IN ('Actual','Budget')
--HAVING ScenarioName <> 'Forecast' -- OUTRA FORMA

-- 8 --

SELECT
	SUM(Amount) 'Cenario Total',
	AVG(Amount) 'Cenario Medio',
	CalendarYear 'Ano'
FROM
	FactStrategyPlan
INNER JOIN DimDate
	ON FactStrategyPlan.Datekey = DimDate.Datekey
GROUP BY CalendarYear

-- 9 --

SELECT
	ProductSubCategoryName 'Subcategoria',
	COUNT(*) 'Qtd. Produtos'
FROM
	DimProduct
INNER JOIN DimProductSubcategory
	ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
WHERE
	DimProduct.ColorName = 'Silver' AND DimProduct.BrandName = 'Contoso'
GROUP BY
	ProductSubcategoryName

-- 10 --

SELECT
	BrandName 'Nome Produto',
	ProductSubCategoryName 'Nome Subcategoria',
	COUNT(*) 'Qtd. Produtos'
FROM
	DimProduct
INNER JOIN DimProductSubcategory
	ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
GROUP BY BrandName, ProductSubcategoryName
ORDER BY BrandName