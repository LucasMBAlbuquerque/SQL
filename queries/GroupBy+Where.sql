-- USANDO O GROUP BY JUNTO COM O WHERE --

SELECT
	ColorName,
	COUNT(*) AS 'Total de Produtos'
FROM
	DimProduct
WHERE
	BrandName = 'Contoso'
GROUP BY
	ColorName
ORDER BY
	COUNT(*) DESC