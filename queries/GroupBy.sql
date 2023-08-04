--USANDO O GROUP BY

SELECT BrandName AS 'Nome Da Marca', COUNT(*) AS 'Qtd.Total'
FROM DimProduct
GROUP BY BrandName
ORDER BY COUNT(*) DESC;

--

SELECT
	StoreType,
	SUM(EmployeeCount) AS 'Contagem'
FROM 
	DimStore
GROUP BY
	StoreType
ORDER BY
	SUM(EmployeeCount) DESC;

--

SELECT
	BrandName,
	AVG(UnitCost) AS 'Media'
FROM
	DimProduct
GROUP BY
	BrandName
ORDER BY
	AVG(UnitCost) DESC

--

SELECT
	ClassName,
	MAX(UnitPrice) AS 'Preco Maximo'
FROM
	DimProduct
GROUP BY
	ClassName
ORDER BY
	MAX(UnitPrice) DESC