-- EXERCICIOS USANDO JOIN --

SELECT
	ProductKey AS 'ID Produto',
	ProductName AS 'Nome Produto',
	ProductSubcategoryName AS 'Nome Subcategoria'
FROM
	DimProduct
INNER JOIN DimProductSubcategory
	ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey

-- 2 --

SELECT
	ProductCategoryName AS 'Nome Categoria',
	ProductSubCategoryKey AS 'ID Subcategoria',
	ProductSubCategoryName AS 'Nome Subcategoria'
FROM
	DimProductSubcategory
LEFT JOIN DimProductCategory
	ON DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey

-- 3 --

SELECT
	StoreKey AS 'ID Loja',
	StoreName AS 'Nome Loja',
	EmployeeCount AS 'Qtd. Funcionarios',
	ContinentName AS 'Nome Continente',
	RegionCountryName AS 'Pais'
FROM
	DimStore
LEFT JOIN DimGeography
	ON DimStore.GeographyKey = DimGeography.GeographyKey

-- 4 --

SELECT * FROM DimProduct
SELECT * FROM DimProductCategory
SELECT * FROM DimProductSubcategory

SELECT
	ProductName,
	ProductCategoryDescription
FROM
	DimProduct
LEFT JOIN DimProductSubcategory
	ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
		LEFT JOIN DimProductCategory
			ON DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey

-- 5 --

SELECT TOP(100) * FROM FactStrategyPlan;
SELECT TOP(100) * FROM DimAccount

SELECT
	StrategyPlanKey,
	DateKey,
	AccountName,
	Amount
FROM
	FactStrategyPlan
INNER JOIN DimAccount
	ON FactStrategyPlan.AccountKey = DimAccount.AccountKey

-- 6 --

SELECT TOP(100) * FROM FactStrategyPlan
SELECT TOP(100) * FROM DimScenario

SELECT
	StrategyPlanKey,
	DateKey,
	ScenarioName,
	Amount
FROM
	FactStrategyPlan
INNER JOIN DimScenario
	ON FactStrategyPlan.ScenarioKey = DimScenario.ScenarioKey

-- 7 --

SELECT TOP(100) * FROM DimProduct
SELECT TOP(100) * FROM DimProductSubcategory

SELECT
	ProductName,
	ProductSubCategoryName
FROM
	DimProduct
RIGHT JOIN DimProductSubcategory
	ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
WHERE ProductName IS NULL

-- 8 --

SELECT TOP(100) * FROM DimChannel
SELECT TOP(100) * FROM DimProduct

SELECT
	DISTINCT BrandName,
	ChannelName
FROM
	DimProduct CROSS JOIN DimChannel
WHERE BrandName IN ('Contoso','Fabrikam','Litware')

-- 9 --

SELECT TOP(100) * FROM FactOnlineSales
SELECT TOP(100) * FROM DimPromotion

SELECT TOP(1000)
	OnlineSalesKey,
	DateKey,
	PromotionName,
	SalesAmount
FROM
	FactOnlineSales
INNER JOIN DimPromotion
	ON FactOnlineSales.PromotionKey = DimPromotion.PromotionKey
WHERE
	PromotionName <> 'No Discount'
ORDER BY DateKey ASC

-- 10 --

SELECT TOP(100)
	SalesKey,
	ChannelName,
	StoreName,
	ProductName,
	SalesAmount
FROM
	FactSales
INNER JOIN DimChannel
	ON FactSales.channelKey = DimChannel.ChannelKey
		INNER JOIN DimStore
			ON FactSales.StoreKey = DimStore.StoreKey
				INNER JOIN DimProduct
					ON FactSales.ProductKey = DimProduct.ProductKey
ORDER BY SalesAmount DESC