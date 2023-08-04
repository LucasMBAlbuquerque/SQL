-- USANDO O HAVING COM GROUP BY --

SELECT
	BrandName AS 'Marca',
	COUNT(BrandName) AS 'Total Por Marca'
FROM
	DimProduct
GROUP BY
	BrandName
HAVING
	COUNT(BrandName) >= 200
ORDER BY
	COUNT(BrandName) DESC