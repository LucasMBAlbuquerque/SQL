-- USANDO O LEFT (OUTER) JOIN--

SELECT
	PRODUCTKEY,
	PRODUCTNAME,
	DIMPRODUCT.ProductSubcategoryKey,
	PRODUCTSUBCATEGORYNAME
FROM
	DIMPRODUCT
LEFT JOIN DimProductSubcategory
	ON DIMPRODUCT.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey

SELECT
	PRODUCTKEY,
	PRODUCTNAME,
	DIMPRODUCT.ProductSubcategoryKey,
	PRODUCTSUBCATEGORYNAME
FROM
	DIMPRODUCT
INNER JOIN DimProductSubcategory
	ON DIMPRODUCT.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey

-- USANDO O RIGHT JOIN--

SELECT
	PRODUCTKEY,
	PRODUCTNAME,
	DIMPRODUCT.ProductSubcategoryKey,
	PRODUCTSUBCATEGORYNAME
FROM
	DIMPRODUCT
RIGHT JOIN DimProductSubcategory
	ON DIMPRODUCT.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey

-- USANDO MULTIPLOS INNER JOIN--

SELECT
	ProductKey,
	ProductName,
	DimProduct.ProductSubcategoryKey,
	ProductCategoryName
FROM
	DimProduct
INNER JOIN DimProductSubcategory
	ON DimProduct.ProductSubcategoryKey = DimProduct.ProductSubcategoryKey
		INNER JOIN DimProductCategory
			ON DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey