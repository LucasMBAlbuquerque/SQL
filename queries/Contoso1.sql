--SELECT * FROM FactOnlineSales WHERE TotalCost > 1000 AND StoreKey='306';
--SELECT DISTINCT ColorName FROM DimProduct;

--SELECT * FROM DimEmployee;

--SELECT 
--DISTINCT DepartmentName AS Departamento
--	DimEmployee;

-- USANDO O ORDER BY--

-- SELECIONANDO TOP 100 LOJAS PELA QUANTIDADE DE FUNCIONARIOS, DECRESCENTE.

--SELECT TOP(100) * FROM DimStore ORDER BY EmployeeCount DESC;

-- SELECIONANDO AS 10 PRIMEIRAS LINHAS DE DIMPRODUCT E ORDENANDO DE ACORDO COM O UNITCOST.

--SELECT TOP (10) ProductName, UnitCost, Weight FROM DimProduct ORDER BY UnitCost DESC, Weight DESC;

-- USANDO O GROUP BY--

--SELECT BrandName AS 'Nome Da Marca', COUNT(*) AS 'Qtd.Total'
--FROM DimProduct
--GROUP BY BrandName
--ORDER BY COUNT(*) DESC;

--SELECT
--	StoreType,
--	SUM(EmployeeCount) AS 'Contagem'
--FROM 
--	DimStore
--GROUP BY
--	StoreType
--ORDER BY
--	SUM(EmployeeCount) DESC;

--SELECT
--	BrandName,
--	AVG(UnitCost) AS 'Media'
--FROM
--	DimProduct
--GROUP BY
--	BrandName
--ORDER BY
--	AVG(UnitCost) DESC

--SELECT * FROM DimProduct;

--SELECT
--	ClassName,
--	MAX(UnitPrice) AS 'Preco Maximo'
--FROM
--	DimProduct
--GROUP BY
--	ClassName
--ORDER BY
--	MAX(UnitPrice) DESC

-- USANDO O GROUP BY JUNTO COM O WHERE --

--SELECT * FROM DimProduct;

--SELECT
--	ColorName,
--	COUNT(*) AS 'Total de Produtos'
--FROM
--	DimProduct
--WHERE
--	BrandName = 'Contoso'
--GROUP BY
--	ColorName
--ORDER BY
--	COUNT(*) DESC

-- USANDO O HAVING COM GROUP BY --

--SELECT * FROM DimProduct;

--SELECT
--	BrandName AS 'Marca',
--	COUNT(BrandName) AS 'Total Por Marca'
--FROM
--	DimProduct
--GROUP BY
--	BrandName
--HAVING
--	COUNT(BrandName) >= 200
--ORDER BY
--	COUNT(BrandName) DESC

-- USANDO O JOIN --

--SELECT TOP(1000) * FROM FactSales
--SELECT * FROM DimChannel

--SELECT
--	ChannelKey,
--	SUM(SalesQuantity) AS 'Qnt. Vendida'
--FROM
--	FactSales
--GROUP BY
--	ChannelKey

-- USANDO O LEFT (OUTER) JOIN--
-- USANDO MULTIPLOS INNER JOIN--

--SELECT ProductKey, ProductName, ProductSubcategoryKey FROM DimProduct;
--SELECT ProductSubcategoryKey, ProductSubcategoryName, ProductCategoryKey FROM DimProductSubcategory;
--SELECT ProductcategoryKey, ProductCategoryName FROM DimProductCategory

--SELECT
--	ProductKey,
--	ProductName,
--	DimProduct.ProductSubcategoryKey,
--	ProductCategoryName
--FROM
--	DimProduct
--INNER JOIN DimProductSubcategory
--	ON DimProduct.ProductSubcategoryKey = DimProduct.ProductSubcategoryKey
--		INNER JOIN DimProductCategory
--			ON DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey

-- USANDO UNION --

-- UNION REMOVE AS DUPLICATAS. UNION ALL RETORNA TODOS OS DADOS INCLUSIVE AS DUPLICATAS

--SELECT
--	FirstName,
--	BirthDate
--FROM
--	DimCustomer
--WHERE Gender = 'F'
--UNION ALL
--SELECT
--	FirstName,
--	BirthDate
--from
--	DimCustomer
--WHERE Gender = 'M'

-- EXERCICIOS USANDO JOIN --

--SELECT
--	ProductKey AS 'ID Produto',
--	ProductName AS 'Nome Produto',
--	ProductSubcategoryName AS 'Nome Subcategoria'
--FROM
--	DimProduct
--INNER JOIN DimProductSubcategory
--	ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey

-- 2 --

--SELECT
--	ProductCategoryName AS 'Nome Categoria',
--	ProductSubCategoryKey AS 'ID Subcategoria',
--	ProductSubCategoryName AS 'Nome Subcategoria'
--FROM
--	DimProductSubcategory
--LEFT JOIN DimProductCategory
--	ON DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey

-- 3 --

--SELECT
--	StoreKey AS 'ID Loja',
--	StoreName AS 'Nome Loja',
--	EmployeeCount AS 'Qtd. Funcionarios',
--	ContinentName AS 'Nome Continente',
--	RegionCountryName AS 'Pais'
--FROM
--	DimStore
--LEFT JOIN DimGeography
--	ON DimStore.GeographyKey = DimGeography.GeographyKey

-- 4 --

--SELECT * FROM DimProduct
--SELECT * FROM DimProductCategory
--SELECT * FROM DimProductSubcategory

--SELECT
--	ProductName,
--	ProductCategoryDescription
--FROM
--	DimProduct
--LEFT JOIN DimProductSubcategory
--	ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
--		LEFT JOIN DimProductCategory
--			ON DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey

-- 5 --

--SELECT TOP(100) * FROM FactStrategyPlan;
--SELECT TOP(100) * FROM DimAccount

--SELECT
--	StrategyPlanKey,
--	DateKey,
--	AccountName,
--	Amount
--FROM
--	FactStrategyPlan
--INNER JOIN DimAccount
--	ON FactStrategyPlan.AccountKey = DimAccount.AccountKey

-- 6 --

--SELECT TOP(100) * FROM FactStrategyPlan
--SELECT TOP(100) * FROM DimScenario

--SELECT
--	StrategyPlanKey,
--	DateKey,
--	ScenarioName,
--	Amount
--FROM
--	FactStrategyPlan
--INNER JOIN DimScenario
--	ON FactStrategyPlan.ScenarioKey = DimScenario.ScenarioKey

-- 7 --

--SELECT TOP(100) * FROM DimProduct
--SELECT TOP(100) * FROM DimProductSubcategory

--SELECT
--	ProductName,
--	ProductSubCategoryName
--FROM
--	DimProduct
--RIGHT JOIN DimProductSubcategory
--	ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
--WHERE ProductName IS NULL

-- 8 --

--SELECT TOP(100) * FROM DimChannel
--SELECT TOP(100) * FROM DimProduct

--SELECT
--	DISTINCT BrandName,
--	ChannelName
--FROM
--	DimProduct CROSS JOIN DimChannel
--WHERE BrandName IN ('Contoso','Fabrikam','Litware')

-- 9 --

--SELECT TOP(100) * FROM FactOnlineSales
--SELECT TOP(100) * FROM DimPromotion

--SELECT TOP(1000)
--	OnlineSalesKey,
--	DateKey,
--	PromotionName,
--	SalesAmount
--FROM
--	FactOnlineSales
--INNER JOIN DimPromotion
--	ON FactOnlineSales.PromotionKey = DimPromotion.PromotionKey
--WHERE
--	PromotionName <> 'No Discount'
--ORDER BY DateKey ASC

-- 10 --

--SELECT TOP(100)
--	SalesKey,
--	ChannelName,
--	StoreName,
--	ProductName,
--	SalesAmount
--FROM
--	FactSales
--INNER JOIN DimChannel
--	ON FactSales.channelKey = DimChannel.ChannelKey
--		INNER JOIN DimStore
--			ON FactSales.StoreKey = DimStore.StoreKey
--				INNER JOIN DimProduct
--					ON FactSales.ProductKey = DimProduct.ProductKey
--ORDER BY SalesAmount DESC

-- GROUP BY + JOIN

--SELECT
--	SUM(SalesQuantity) AS 'Total Vendido',
--	CalendarYear AS 'Ano'
--FROM
--	FactSales
--INNER JOIN DimDate
--	ON FactSales.DateKey = DimDate.Datekey
--WHERE MONTH(FactSales.DateKey) = 01
--GROUP BY CalendarYear
--HAVING SUM(SalesQuantity) >=1200000

--COMANDO COM O MESMO RETORNO, MAIS DEVAGAR

--SELECT
--	SUM(SalesQuantity) AS 'Total Vendido',
--	CalendarYear AS 'Ano'
--FROM
--	FactSales
--INNER JOIN DimDate
--	ON FactSales.DateKey = DimDate.Datekey
--WHERE CalendarMonthLabel = 'January'
--GROUP BY CalendarYear
--HAVING SUM(SalesQuantity) >=1200000


-- 1 -- a

--SELECT TOP(100) * FROM FactSales
--SELECT TOP(100) * FROM DimChannel

--SELECT
--	SUM(SalesQuantity) AS 'Qtd. Vendas',
--	AVG(SalesQuantity) AS 'Media Vendas',
--	ChannelName  AS 'Nome do Canal'
--FROM
--	FactSales
--INNER JOIN DimChannel
--	ON FactSales.channelKey = DimChannel.ChannelKey
--GROUP BY ChannelName
--ORDER BY SUM(SalesQuantity) DESC

-- 1 -- b

--SELECT TOP(100) * FROM FactSales
--SELECT TOP(100) * FROM DimStore

--SELECT
--	SUM(SalesQuantity) AS 'Total Vendas',
--	SUM(ReturnQuantity) AS 'Total devolvidos',
--	StoreName AS 'Nome da Loja'
--FROM
--	FactSales
--INNER JOIN DimStore
--	ON FactSales.StoreKey = DimStore.StoreKey
--GROUP BY StoreName

-- 1 -- c

--SELECT
--	CalendarYear AS 'Ano',
--	CalendarMonthLabel AS 'Mes',
--	SUM(SalesAmount) AS 'Faturamento Total'
--FROM
--	FactSales
--INNER JOIN DimDate
--	ON FactSales.DateKey = DimDate.Datekey
--GROUP BY CalendarYear, CalendarMonth, CalendarMonthLabel
--ORDER BY CalendarYear, CalendarMonth

-- 2 -- a

--SELECT TOP(100) * FROM DimProduct
--SELECT TOP(100) * FROM FactSales

--SELECT
--	ColorName AS 'Cor do Produto',
--	SUM(SalesQuantity) AS 'Qtd. Vendidas'
--FROM
--	FactSales
--INNER JOIN DimProduct
--	ON FactSales.ProductKey = DimProduct.ProductKey
--GROUP BY ColorName
--ORDER BY SUM(SalesQuantity) DESC

-- 2 -- b

--SELECT
--	ColorName AS 'Cor do Produto',
--	SUM(SalesQuantity) AS 'Qtd. Vendidas'
--FROM
--	FactSales
--INNER JOIN DimProduct
--	ON FactSales.ProductKey = DimProduct.ProductKey
--GROUP BY ColorName
--HAVING SUM(SalesQuantity) > 3000000
--ORDER BY SUM(SalesQuantity) DESC

-- 3 --

--SELECT TOP(100) * FROM DimProduct
--SELECT TOP(100) * FROM FactSales
--SELECT TOP(100) * FROM DimProductSubCategory
--SELECT TOP(100) * FROM DimProductCategory

--SELECT
--	ProductCategoryName AS 'Nome Categoria Produto',
--	SUM(FactSales.SalesQuantity) AS 'Qtd. Vendas'
--FROM
--	FactSales
--INNER JOIN DimProduct
--	ON FactSales.ProductKey = DimProduct.ProductKey
--		INNER JOIN DimProductSubCategory
--			ON DimProduct.ProductSubcategoryKey=DimProductSubcategory.ProductSubcategoryKey
--				INNER JOIN DimProductCategory
--					ON DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey
--GROUP BY ProductCategoryName

-- 4 -- a

--SELECT TOP(100) * FROM FactOnlineSales
--SELECT TOP(100) * FROM DimCustomer

--SELECT
--	FirstName 'Nome',
--	LastName 'Sobrenome',
--	FactOnlineSales.CustomerKey 'Cliente ID',
--	SUM(SalesQuantity) AS 'Qtd. Vendas'
--FROM
--	FactOnlineSales
--INNER JOIN DimCustomer
--	ON FactOnlineSales.CustomerKey = DimCustomer.CustomerKey
--WHERE CustomerType = 'Person'
--GROUP BY FirstName, LastName, FactOnlineSales.CustomerKey
--ORDER BY SUM(SalesQuantity) DESC

---- 4 -- b

--SELECT TOP(100) * FROM DimProduct
--SELECT TOP(100) * FROM FactOnlineSales
--SELECT TOP(100) * FROM DimCustomer

--SELECT TOP(10)
--	ProductName 'Nome Produto',
--	SUM(SalesQuantity) 'Qtd. Vendas'
--FROM
--	FactOnlineSales
--INNER JOIN DimProduct
--	ON FactOnlineSales.ProductKey = DimProduct.ProductKey
--WHERE FactOnlineSales.CustomerKey = 7665
--GROUP BY ProductName
--ORDER BY SUM(SalesQuantity) DESC

-- 5 --

--SELECT TOP(100) * FROM FactOnlineSales
--SELECT TOP(100) * FROM DimCustomer

--SELECT
--	Gender 'Sexo',
--	SUM(SalesQuantity) 'Qtd. Vendas'
--FROM
--	FactOnlineSales
--INNER JOIN DimCustomer
--	ON FactOnlineSales.CustomerKey = DimCustomer.CustomerKey
--WHERE CustomerType = 'Person'
--GROUP BY Gender
--HAVING Gender IS NOT NULL -- Caso queira so os F e M.

-- 6 --

--SELECT TOP(100) * FROM FactExchangeRate
--SELECT TOP(100) * FROM DimCurrency

--SELECT
--	AVG(AverageRate) 'Taxa Media',
--	CurrencyDescription
--FROM
--	FactExchangeRate
--INNER JOIN DimCurrency
--	ON FactExchangeRate.CurrencyKey = DimCurrency.CurrencyKey
--GROUP BY CurrencyDescription
--HAVING AVG(AverageRate) BETWEEN 10 AND 100
--HAVING AVG(AverageRate) >=10 AND AVG(AverageRate) <=100 - OUTRA OPCAO

-- 7 --

--SELECT TOP(100) * FROM FactStrategyPlan
--SELECT TOP(100) * FROM DimScenario

--SELECT
--	ScenarioName 'Cenario',
--	SUM(Amount) 'Total'
--FROM
--	FactStrategyPlan
--INNER JOIN DimScenario
--	ON FactStrategyPlan.ScenarioKey = DimScenario.ScenarioKey
--GROUP BY ScenarioName
--HAVING ScenarioName IN ('Actual','Budget')
--HAVING ScenarioName <> 'Forecast' -- OUTRA FORMA

-- 8 --

--SELECT TOP(100) * FROM FactStrategyPlan
--SELECT TOP(100) * FROM DimDate

--SELECT
--	SUM(Amount) 'Cenario Total',
--	AVG(Amount) 'Cenario Medio',
--	CalendarYear 'Ano'

--FROM
--	FactStrategyPlan
--INNER JOIN DimDate
--	ON FactStrategyPlan.Datekey = DimDate.Datekey
--GROUP BY CalendarYear

-- 9 --

--SELECT TOP(100) * FROM DimProduct
--SELECT TOP(100) * FROM DimProductSubcategory

--SELECT
--	ProductSubCategoryName 'Subcategoria',
--	COUNT(*) 'Qtd. Produtos'
--FROM
--	DimProduct
--INNER JOIN DimProductSubcategory
--	ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
--WHERE
--	DimProduct.ColorName = 'Silver' AND DimProduct.BrandName = 'Contoso'
--GROUP BY
--	ProductSubcategoryName

-- 10 --

--SELECT TOP(100) * FROM DimProduct
--SELECT TOP(100) * FROM DimProductSubcategory

--SELECT
--	BrandName 'Nome Produto',
--	ProductSubCategoryName 'Nome Subcategoria',
--	COUNT(*) 'Qtd. Produtos'
--FROM
--	DimProduct
--INNER JOIN DimProductSubcategory
--	ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
--GROUP BY BrandName, ProductSubcategoryName
--ORDER BY BrandName

-- MODULO 9 --

-- VERIFICANDO O TIPO DE VARIAVEL --

--SELECT SQL_VARIANT_PROPERTY(10, 'BaseType')
--SELECT SQL_VARIANT_PROPERTY(49.50, 'BaseType')
--SELECT SQL_VARIANT_PROPERTY('Lucas', 'BaseType')
--SELECT SQL_VARIANT_PROPERTY('20/06/2021', 'BaseType')

-- EXPLICITANDO O  TIPO DE VARIAVEL --

--SELECT CAST(10 AS INT)
--SELECT CAST(21.45 AS FLOAT)
--SELECT CAST(21.55 AS FLOAT)
--SELECT CAST('24.67' AS FLOAT)
--SELECT CAST('06/20/2021' AS DATETIME)

-- EXEMPLO -- 

--SELECT 'O preço do pastel é: ' + CAST(30.99 AS VARCHAR(50))

--SELECT CAST('06/20/2021' AS DATETIME) + 1 -- MAIS UM DIA

-- USANDO O FORMAT --

--a) Numericos:
--SELECT FORMAT(1000, 'N')
--SELECT FORMAT(1000, 'G')

--b) Personalizados:
--SELECT FORMAT(123456789, '###-##-####')

--c) Data:
--SELECT FORMAT(CAST('06/23/2020' AS DATETIME), 'dd/MMMM/yyyy')
--SELECT FORMAT(CAST('03/21/2021' AS DATETIME), 'dddd')

-- EXERCICIO --

--SELECT 'A data de validade do produto é: ' + FORMAT(CAST('04/17/2021' AS DATETIME), 'dd/MMM/yyyy')

-- DECLARANDO VARIAVEIS --

--DECLARE @VAR INT
--SET @VAR = 10
--SELECT @VAR

-- DECLARE UMA VARIAVEIS

--DECLARE @IDADE FLOAT
--SET @IDADE = 30
--SELECT @IDADE AS 'Idade'

--DECLARE @PRECO FLOAT
--SET @PRECO = 10.89
--SELECT @PRECO 'Preco'

--DECLARE @NOME VARCHAR(10)
--SET @NOME = 'Mateus'
--SELECT @NOME 'Nome'

--DECLARE @DATA DATETIME
--SET @DATA = FORMAT(CAST('12/18/2022' AS DATETIME), 'dd/MMMM/yyyy')
--SELECT @DATA AS 'Data'

-- DECLARANDO VARIAS VARIAVEIS

--DECLARE @VAR1 INT = 10,
--		@TEXTO VARCHAR(30) = 'Um texto qualquer',
--		@DATA DATETIME = '12/18/2022'

--SELECT @VAR1, @TEXTO, @DATA

-- USANDO VARIAVEIS CRIADAS EM CONSULTAS --

--DECLARE @VARDESCONTO FLOAT = 0.35

--SELECT
--	ProductKey 'ID',
--	ProductName 'Nome',
--	UnitPrice 'Preco unitario',
--	UnitPrice * (1 - @VARDESCONTO) 'Preco Desconto'
--FROM
--	DimProduct

-- USANDO O PRINT --

--SELECT COUNT(*) FROM DimProduct
--SET NOCOUNT OFF
--DECLARE @VARLOJASON INT = (SELECT COUNT(*) FROM DimStore WHERE Status = 'On'), @VARLOJASOFF INT = (SELECT COUNT(*) FROM DimStore WHERE Status = 'Off')

--SELECT @VARLOJASON 'Lojas Abertas', @VARLOJASOFF 'Lojas Fechadas'

--PRINT 'O total de lojas abertas é de: ' + CAST(@VARLOJASON AS VARCHAR)
--PRINT 'O total de lojas fechadas é de: ' + CAST(@VARLOJASOFF AS VARCHAR)

-- AMARZENANDO EM UMA VARIÁVEL UM REGISTRO DE UMA CONSULTA --
-- QUAL É O NOME DO PRODUTO QUE TEVE A MAIOR QUANTIDADE VENDIDA EM UMA UNICA VENDA DA TABELA FACSALES.

--DECLARE @VARPRODUTOMAISVENDIDO INT
--DECLARE @VARTOTALMAISVENDIDO INT
--DECLARE @VARNOMEPRODUTOMAISVENDIDO VARCHAR(50)

--SELECT TOP(1)
--	@VARPRODUTOMAISVENDIDO = FactSales.ProductKey,
--	@VARTOTALMAISVENDIDO = SalesQuantity,
--	@VARNOMEPRODUTOMAISVENDIDO = ProductName
--FROM 
--	FactSales
--INNER JOIN DimProduct
--	ON FactSales.ProductKey = DimProduct.ProductKey
--ORDER BY SalesQuantity DESC

--PRINT @VARPRODUTOMAISVENDIDO
--PRINT @VARTOTALMAISVENDIDO
--PRINT @VARNOMEPRODUTOMAISVENDIDO

-- PRINTAR NA TELA UMA LISTA COM OS NOMES DAS FUNCIONARIAS DO DEPARTAMENTO DE MARKETING --

--SELECT
--	FirstName,
--	DepartmentName
--FROM
--	DimEmployee
--WHERE DepartmentName = 'Marketing' AND Gender = 'F'

---- SOLUCAO --

--DECLARE @VARLISTANOMES VARCHAR(50) = ''

--SELECT
--	@VARLISTANOMES = @VARLISTANOMES + FirstName + ', ' + CHAR(10)
--FROM
--	DimEmployee
--WHERE DepartmentName = 'Marketing' AND Gender = 'F'

--PRINT LEFT(@VARLISTANOMES, DATALENGTH(@VARLISTANOMES) -3) -- COM O CHAR(10) É 3

-- VARIAVEIS GLOBAIS --

--SELECT * FROM DimProduct
--SELECT @@ROWCOUNT

-- EXERCICIOS DE VARIAVEIS 1--

--DECLARE @VALOR1 INT = 10, @VALOR2 INT = 5, @VALOR3 INT = 34, @VALOR4 INT = 7
--DECLARE @SOMA INT = @VALOR1 + @VALOR2
--DECLARE @SUBTRACAO INT = @VALOR3 - @VALOR2
--DECLARE @MULTIPLICACAO INT = @VALOR1*@VALOR4
--DECLARE @DIVISAO FLOAT = CAST(@VALOR3 AS FLOAT)/CAST(@VALOR4 AS FLOAT)
--SELECT @SOMA
--SELECT @SUBTRACAO
--SELECT @MULTIPLICACAO
--SELECT ROUND(@DIVISAO, 2)

-- EXERCICIOS DE VARIAVEIS 2--

--DECLARE @PRODUTO VARCHAR(10) = 'Celular'
--DECLARE @QUANTIDADE INT = 12
--DECLARE @PRECO FLOAT = 9.99
--DECLARE @FATURAMENTO FLOAT = CAST(@QUANTIDADE AS FLOAT)*CAST(@PRECO AS FLOAT)
--SELECT @PRODUTO 'Produto', @QUANTIDADE 'Quantidade', @PRECO 'Preco', @FATURAMENTO 'Faturamento'

-- EXERCICIO DE VARIAVEIS --

--SELECT
--	*
--FROM 
--	DimStore
--WHERE
--	YEAR(CloseDate) = 2008

--SELECT
--	*
--FROM 
--	DimStore
--WHERE
--	FORMAT(CloseDate, 'yyyy') = 2008

--DECLARE @VARLISTALOJAS VARCHAR(50) = ''

--SELECT
--	@VARLISTALOJAS = @VARLISTALOJAS + StoreName + ', '
--FROM
--	DimStore
--WHERE
--	YEAR(CloseDate) = 2008

--PRINT 'As lojas fechadas no ano de 2008 foram: ' + LEFT(@VARLISTALOJAS, DATALENGTH(@VARLISTALOJAS) -3) + '.'

-- EXERCICIO DE VARIAVEIS --

--SELECT * FROM DimProduct
--SELECT * FROM DimProductSubcategory

--DECLARE @VARNOMESUBCATEGORIA VARCHAR(50) = 'Lamps'
--DECLARE @VARIDSUBCATEGORIA INT = (SELECT ProductSubCategoryKey FROM DimProductSubcategory WHERE ProductSubcategoryName = @VARNOMESUBCATEGORIA)

--SELECT
--	*
--FROM
--	DimProduct
--WHERE
--	ProductSubcategoryKey = @VARIDSUBCATEGORIA

-- LEN E DATALENGTH --

--SELECT LEN('SQL HASHTAG   ') 'len' ,DATALENGTH('SQL HASHTAG   ') 'datalength'

-- CONCAT --

--SELECT * FROM DimCustomer

--SELECT
--	FirstName 'Nome',
--	LastName 'Sobrenome',
--	CONCAT(FirstName,' ' + LastName) 'Nome Completo',
--	EmailAddress 'Email'
--FROM
--	DimCustomer

-- LEFT E RIGHT --

--SELECT * FROM DimProduct

--SELECT LEFT('Product0101001',7) 'Left', RIGHT('Product0101001',7) 'Right'

--SELECT
--	ProductName 'Produto',
--	UnitPrice 'Preco',
--	LEFT(StyleName, 7) 'Codigo1',
--	RIGHT(StyleName, 7) 'Codigo2'
--FROM
--	DimProduct

-- REPLACE --
-- No texto 'O excel é o melhor', substitua 'excel' por 'sql'

--SELECT REPLACE('O excel é o melhor', 'excel', 'sql')

-- substituir F por Feminino e M por Masculino na coluna de sexo --

--SELECT * FROM DimCustomer

--SELECT
--	FirstName 'Nome',
--	LastName 'Sobrenome',
--	Gender 'Sexo (abrev)',
--	REPLACE(REPLACE(Gender, 'M', 'Masculino'), 'F', 'Feminino') 'Sexo' -- SE TROCAR M POR F NA SEQUENCIA, IRA DAR ERRADO
--FROM
--	DimCustomer

-- TRANSLATE --

SELECT TRANSLATE('10.241/444.124k23/1','./k','abc')
--SELECT TRANSLATE('ABCD-490123','ABCD','WXYZ')

-- STUFF --

--SELECT STUFF('VBA Impressionador', 1, 3, 'Excel')

-- USANDO O FORMAT --

----NOME
--SELECT FORMAT(5123,'G')
----NUMERO
--SELECT FORMAT(5123,'N')
----MOEDA
--SELECT FORMAT(5123,'C')
----DATA
--SELECT FORMAT(CAST('04/23/2020' AS DATETIME), 'dd/MMMM/yyyy', 'pt-BR')

-- USANDO O CHARINDEX --

--SELECT 'RAQUEL MORENO' AS 'NOME'
--SELECT CHARINDEX('MORENO', 'RAQUEL MORENO')
--SELECT SUBSTRING('RAQUEL MORENO',8,6) AS 'SOBRENOME'

-- COMBINANDO AS FUNCOES CHARINDEX E SUBSTRING --

--SELECT CHARINDEX(' ','BERNARDO CAVALCANTI') AS 'POSICAO'

--DECLARE @VARNOME VARCHAR(50) = 'BERNARDO CAVALCANTI'
--SELECT SUBSTRING(@VARNOME,CHARINDEX(' ', @VARNOME) + 1, 20)
--SELECT SUBSTRING('RAQUEL MONTEIRO',CHARINDEX(' ', 'RAQUEL MONTEIRO') + 1, 20)

-- USANDO O TRIM, RTRIM E LTRIM --

--DECLARE @VARCODIGO VARCHAR(50) = '   ABC123      '

--SELECT
--	TRIM(@VARCODIGO), LTRIM(@VARCODIGO), RTRIM(@VARCODIGO)

--SELECT
--	DATALENGTH(TRIM(@VARCODIGO)), DATALENGTH(LTRIM(@VARCODIGO)), DATALENGTH(RTRIM(@VARCODIGO))

-- USANDO O DATEFROMPARTS --

--DECLARE @VARDIA INT = 15, @VARMES INT = 6, @VARANO INT = 2021

--SELECT
--	DATEFROMPARTS(@VARANO,@VARMES,@VARDIA) AS 'Data'

-- USANDO O GETDATE, SYSDATETIME, DATENAME E DATEPART

--SELECT GETDATE()
--SELECT SYSDATETIME()

--DECLARE @VARDATA DATETIME = GETDATE()

--RETORNA EM TEXTO
--SELECT
--	DATENAME(DAY, @VARDATA),
--	DATENAME(MONTH, @VARDATA),
--	DATENAME(YEAR, @VARDATA),
--	DATENAME(DAYOFYEAR, @VARDATA)

--RETORNA EM NUMERO
--SELECT
--	DATEPART(DAY, @VARDATA),
--	DATEPART(MONTH, @VARDATA),
--	DATEPART(YEAR, @VARDATA),
--	DATEPART(DAYOFYEAR, @VARDATA)

-- DATEADD E DATEDIFF --

--DECLARE @VARDATA1 DATETIME = '07/10/2020', @VARDATA2 DATETIME = '03/05/2020', @VARDATA3 DATETIME = '11/14/2021'

---- DATEADD 30 DIAS

--SELECT
--	DATEADD(DAY, 30, @VARDATA1),
--	DATEADD(DAY, -30,@VARDATA1)

---- DATEDIFF

--SELECT
--	DATEDIFF(DAY, @VARDATA1, @VARDATA2),
--	DATEDIFF(DAY,@VARDATA2,@VARDATA3),
--	DATEDIFF(MONTH, @VARDATA2,@VARDATA3)

-- EXERCICIOS BLOCK17 --

-- 1 a

SELECT
	ProductName 'Nome Produto',
	LEN(ProductName) 'Qtd. Caracteres'
FROM
	DimProduct
ORDER BY
	LEN(ProductName) DESC

-- b

SELECT
	AVG(LEN(ProductName)) 'Media Caracteres'
FROM
	DimProduct

-- c

SELECT
	ProductName,
	REPLACE(REPLACE(ProductName, BrandName, ''), ColorName, '')
FROM
	DimProduct

-- d

SELECT
	AVG(LEN(REPLACE(REPLACE(ProductName, BrandName, ''), ColorName, '')))
FROM
	DimProduct

-- 2 --

SELECT * FROM DimProduct

SELECT
	TRANSLATE(StyleName, '0123456789', 'ABCDEFGHIJ') 'Style Name'
FROM
	DimProduct

-- 3 --

SELECT * FROM DimEmployee
SELECT
	FirstName + ' ' + LastName 'Nome Completo',
	EmailAddress 'Email',
	REPLACE(EmailAddress, '@contoso.com', '') 'ID',
	LEFT(EmailAddress, CHARINDEX('@', EmailAddress) - 1) 'ID2',
	UPPER(FirstName) + DATENAME(DAYOFYEAR, BirthDate) 'SENHA'
FROM
	DimEmployee

-- USANDO CASE --

DECLARE @VARNOTA FLOAT = 5

SELECT
	CASE
		WHEN @VARNOTA >=6 THEN 'Aprovado'
		ELSE 'Reprovado'
	END 'Situacao'

DECLARE @VARDATAVENCIMENTO DATETIME = '03/10/2022', @VARDATAATUAL DATETIME = '04/30/2020'

SELECT
	CASE
		WHEN @VARDATAATUAL > @VARDATAVENCIMENTO THEN 'Produto Vencido'
		ELSE 'Produto consumivel'
	END 'Situacao'

SELECT
	CustomerKey 'ID',
	FirstName 'Nome',
	Gender 'Sexo',
	CASE 
		WHEN Gender = 'M' THEN 'Masculino'
		WHEN Gender = 'F' THEN 'Feminino'
		ELSE 'Empresa'
	END 'Sexo (CASE)'
FROM
	DimCustomer

DECLARE @VARNOTA2 FLOAT = 4

SELECT
	CASE
		WHEN @VARNOTA2 >=6 THEN 'Aprovado'
		WHEN @VARNOTA2 >=4 THEN 'Prova Final'
		ELSE 'Reprovado'
	END 'Situacao'

DECLARE @VARPRECO FLOAT = 30000

SELECT
	CASE
		WHEN @VARPRECO >=40000 THEN 'Luxo'
		WHEN @VARPRECO >=10000 THEN 'Economico'
		ELSE 'Basico'
	END 'Categoria'

-- USANDO CASE, AND E OR --

-- a

SELECT
	ProductName,
	BrandName,
	ColorName,
	UnitPrice,
	CASE
		WHEN BrandName = 'Contoso' AND ColorName = 'Red' THEN 0.1
		ELSE 0
	END 'Desconto'
FROM
	DimProduct

-- b

SELECT
	ProductName,
	BrandName,
	ColorName,
	UnitPrice,
	CASE
		WHEN BrandName = 'Litware' OR BrandName = 'Fabrikam' THEN 0.05
		ELSE 0
	END 'Desconto'
FROM
	DimProduct

-- CASE COMPOSTO, CASE ANINHADO --

SELECT * FROM DimEmployee

SELECT
	FirstName,
	Title,
	SalariedFlag,
	CASE
		WHEN Title = 'Sales Group Manager' THEN
		CASE
			WHEN SalariedFlag = 1 THEN 0.3
			ELSE 0.2
		END
		WHEN Title = 'Sales Region Manager' THEN 0.15
		WHEN Title = 'Sales State Manager' THEN 0.07
		ELSE 0.02
	END
FROM
	DimEmployee

-- CASE ADITIVO --

-- USANDO IF E IIF--

DECLARE @VARCLASSIFICACAO INT = 9

SELECT
	IIF(@VARCLASSIFICACAO >= 5, 'Risco Alto', 'Risco Baixo')

-- EXERCICIO COM IIF--

SELECT * FROM DimCustomer

SELECT
	CustomerKey,
	CustomerType,
	IIF(CustomerType = 'Person', FirstName, CompanyName) 'Cliente'
FROM
	DimCustomer

-- IIF COMPOSTO --

SELECT * FROM DimProduct

SELECT
	PRODUCTKEY,
	PRODUCTNAME,
	STOCKTYPENAME,
	IIF(STOCKTYPENAME = 'High', 'João', IIF(STOCKTYPENAME = 'Mid', 'Maria', 'Luiz')) 'Responsável'
FROM
	DIMPRODUCT

-- EXERCICIOS --

-- 1 --

DECLARE @DESCONTOECONOMY FLOAT = 0.05, @DESCONTOREGULAR FLOAT = 0.07, @DESCONTODELUXE FLOAT = 0.09

SELECT
	ProductName,
	ProductKey,
	CASE
		WHEN ClassName = 'Economy' THEN @DESCONTOECONOMY
		WHEN ClassName = 'Regular' THEN @DESCONTOREGULAR
		ELSE @DESCONTODELUXE
	END 'Desconto',
	CASE
		WHEN ClassName = 'Economy' THEN UnitPrice*(1 - @DESCONTOECONOMY)
		WHEN ClassName = 'Regular' THEN UnitPrice*(1 - @DESCONTOREGULAR)
		ELSE UnitPrice*(1 - @DESCONTODELUXE)
	END 'Preco com desconto'
FROM DimProduct

-- 2 --

SELECT * FROM DIMPRODUCT

SELECT
	BrandName,
	COUNT(BrandName) 'Qtd. Produtos',
	CASE
		WHEN COUNT(BrandName) >= 500 THEN 'CATEGORIA A'
		WHEN COUNT(BrandName) >= 100 THEN 'CATEGORIA B'
		ELSE 'CATEGORIA C'
	END 'Categoria'
FROM DIMPRODUCT
GROUP BY BrandName

-- 3 --

SELECT * FROM DIMSTORE

SELECT
	EmployeeCount 'Qtd. Funcionarios',
	StoreName 'Nome Loja',
	CASE
		WHEN EmployeeCount >=50 THEN 'ACIMA DE 50 FUNCIONARIOS'
		WHEN EMPLOYEECOUNT >=40 THEN 'ENTRE 40 E 50 FUNCIONARIOS'
		WHEN EMPLOYEECOUNT >=30 THEN 'ENTRE 30 E 40 FUNCIONARIOS'
		WHEN EMPLOYEECOUNT >=20 THEN 'ENTRE 20 E 30 FUNCIONARIOS'
		WHEN EMPLOYEECOUNT >=10 THEN 'ENTRE 10 E 20 FUNCIONARIOS'
		ELSE 'ABAIXO DE 10 FUNCIONARIOS'
	END 'Status'
FROM DIMSTORE

-- 4 --

SELECT
	ProductSubCategoryname 'Nome subcategoria',
	ROUND(100*AVG(Weight), 2) 'Peso Medio',
	CASE
		WHEN ROUND(100*AVG(Weight), 2) >= 1000 THEN 'ROTA 2'
		ELSE 'ROTA 1'
	END 'Rota'
FROM
	DIMPRODUCT
INNER JOIN DIMPRODUCTSUBCATEGORY
	ON DIMPRODUCT.ProductSubcategoryKey = DIMPRODUCTSUBCATEGORY.ProductSubcategoryKey
GROUP BY PRODUCTSUBCATEGORYNAME

-- 5 --

SELECT * FROM DIMCUSTOMER

SELECT
	FIRSTNAME 'Nome',
	GENDER 'Sexo',
	TOTALCHILDREN 'Qtd. Filhos',
	EMAILADDRESS 'EMAIL',
	CASE
		WHEN TOTALCHILDREN = 0 THEN 'Caminhão de Prêmios'
		WHEN GENDER = 'M' THEN 'Pai do Ano'
		ELSE 'Mãe do Ano'
	END 'Ação de Marketing'
FROM
	DimCustomer

-- 6 --

SELECT * FROM DIMSTORE

SELECT
	STORENAME,
	OPENDATE,
	closedate,
	CASE
		WHEN CloseDate IS NULL THEN DATEDIFF(DAY, OPENDATE, GETDATE())
		ELSE DATEDIFF(DAY, OPENDATE, CloseDate)
	END 'Dias Abertos'
FROM
	DIMSTORE
ORDER BY
CASE
	WHEN CloseDate IS NULL THEN DATEDIFF(DAY, OPENDATE, GETDATE())
	ELSE DATEDIFF(DAY, OPENDATE, CloseDate)
END DESC

-- SQL VIEW --

SELECT * FROM DimCustomeR

GO
CREATE VIEW vwClientes AS
SELECT
	FIRSTNAME,
	EMAILADDRESS,
	BIRTHDATE
FROM
	DIMCUSTOMER
GO
SELECT * FROM vwClientes

GO
CREATE VIEW vwProdutos AS
SELECT
	PRODUCTKEY 'ID',
	PRODUCTNAME 'NOME',
	ProductSubcategoryKEY 'ID SUB',
	BRANDNAME 'MARCA',
	UNITPRICE 'PRECO'
FROM
	DIMPRODUCT
GO

-- USE: PARA MUDAR O BANCO DE DADOS USADO --

-- ALTER VIEW --

SELECT * FROM vwClientes

GO
ALTER VIEW vwClientes AS
SELECT
	FIRSTNAME 'Nome',
	EMAILADDRESS 'E-mail',
	BIRTHDATE 'Data Nascimento',
	GENDER 'Sexo'
FROM
	DIMCUSTOMER
WHERE GENDER = 'F'
GO
SELECT * FROM vwClientes

-- DROP VIEW --

DROP VIEW vwClientes

-- EXERCICIOS VIEW --

-- a --
GO
CREATE VIEW vwProdutos AS
SELECT
	ProductName 'Nome Produto',
	ColorName 'Cor',
	UnitPrice 'Preco',
	UnitCost 'Custo'
FROM
	DIMPRODUCT
GO

SELECT * FROM vwProdutos

-- 2 --

GO
CREATE VIEW vwClientes AS
SELECT
	FIRSTNAME,
	GENDER,
	EMAILADDRESS 'EMAIL',
	FORMAT(YEARLYINCOME, 'C') 'RENDA ANUAL',
	CONCAT(FIRSTNAME, ' ', LASTNAME) 'NOME COMPLETO',
	REPLACE(REPLACE(GENDER, 'M', 'MASCULINO'), 'F', 'FEMININO') 'GENERO'
FROM
	DIMCUSTOMER
GO

SELECT * FROM VWCLIENTES

-- 4 --

GO
CREATE VIEW VWTOTALVENDIDOSPRODUTOS AS
SELECT
	SUM(SALESQUANTITY) 'TOTAL VENDIDA',
	PRODUCTNAME 'NOME PRODUTO'
FROM
	FACTSALES
INNER JOIN DIMPRODUCT
	ON FACTSALES.ProductKey = DIMPRODUCT.ProductKey
GROUP BY PRODUCTNAME
GO

SELECT * FROM VWTOTALVENDIDOSPRODUTOS

GO
ALTER VIEW VWPRODUTOS AS
SELECT
	ProductName 'Nome Produto',
	ColorName 'Cor',
	BRANDNAME 'Marca',
	UnitPrice 'Preco',
	UnitCost 'Custo'
FROM
	DIMPRODUCT
GO

-- 6 --
-- a --
GO
CREATE VIEW VW6A AS
SELECT
	BRANDNAME 'MARCA',
	COUNT(*) 'QTD PRODUTOS'
FROM
	DIMPRODUCT
GROUP BY BRANDNAME
GO

SELECT * FROM VW6A

-- b --

GO
ALTER VIEW VW6A AS
SELECT
	BRANDNAME 'MARCA',
	COUNT(*) 'QTD PRODUTOS',
	SUM(WEIGHT) 'PESO TOTAL'
FROM
	DIMPRODUCT
GROUP BY BRANDNAME
GO

SELECT * FROM VW6A

-- c --
DROP VIEW VW6A

-- CRUD --
CREATE DATABASE TESTE
DROP DATABASE TESTE

CREATE DATABASE BDImpressionador

USE BDImpressionador

-- CRIANDO TABELA --

CREATE TABLE Produtos(
id_produto INT,
nome_produto varchar(200),
data_validade datetime,
preco_produto float
)

SELECT * FROM Produtos

-- ADICIONANDO DADOS NA TABELA --

INSERT INTO Produtos(id_produto, nome_produto, data_validade, preco_produto)
SELECT
	ProductKey,
	ProductName,
	AvailableForSaleDate,
	UnitPrice
FROM
	ContosoRetailDW.dbo.DimProduct

SELECT * FROM PRODUTOS

--DROP TABLE PRODUTOS

INSERT INTO Produtos(id_produto,nome_produto,data_validade,preco_produto)
VALUES
	(1, 'Arroz', '12/31/2021', 22.50),
	(2, 'Feijão', '11/20/2022', 8.99)

INSERT INTO PRODUTOS(data_validade,id_produto,preco_produto)
VALUES
	('05/31/2023', 3, 33.99)

UPDATE PRODUTOS
SET nome_produto = 'Macarrão'
WHERE id_produto = 3

-- DUAS FORMAS DE DELETAR ITENS DE UMA TABELA --

DELETE PRODUTOS
WHERE id_produto = 3

DELETE FROM PRODUTOS
WHERE id_produto = 3

-- EXEMPLO --

CREATE TABLE Funcionarios(
	id_funcionario INT,
	nome_funcionario varchar(100),
	salario FLOAT,
	data_nascimento DATETIME
)

INSERT INTO Funcionarios(id_funcionario,nome_funcionario,salario, data_nascimento)
VALUES
	(1, 'Lucas', 1500, '03/20/1990'),
	(2, 'Andressa', 2300, '12/07/1988'),
	(3, 'Felipe', 4000, '02/13/1993'),
	(4, 'Marcelo', 7100, '04/10/1993'),
	(5, 'Carla', 3200, '09/02/1986'),
	(6, 'Juliana', 5500, '01/21/1989'),
	(7, 'Mateus', 1900, '11/02/1993')

SELECT * FROM FUNCIONARIOS

ALTER TABLE Funcionarios
ADD Cargo VARCHAR(100), Bonus FLOAT

UPDATE Funcionarios
SET Cargo = 'Analista', Bonus = 0.15
WHERE id_funcionario = 1

ALTER TABLE Funcionarios
ALTER COLUMN Salario INT

INSERT INTO Funcionarios(id_funcionario,nome_funcionario,salario, data_nascimento)
VALUES
	(8, 'Sandra', 3900, '05/09/1990'),
	(9, 'André', 1000, '03/13/1994'),
	(10, 'Julio', 4700, '05/07/1992')

SELECT * FROM FUNCIONARIOS

ALTER TABLE Funcionarios
DROP COLUMN Cargo, Bonus

-- exercicios crud --

CREATE DATABASE BD_Teste
DROP DATABASE BD_Teste

CREATE DATABASE Exercicios

USE Exercicios

-- SUBQUERIES --
USE ContosoRetailDW
-- 1 --
SELECT
	*
FROM
	DIMPRODUCT
WHERE UNITPRICE > (SELECT AVG(UNITPRICE) FROM DIMPRODUCT)

-- 2 --

SELECT
	*
FROM
	DIMPRODUCT
WHERE UNITCOST >= (SELECT AVG(UNITCOST) FROM DIMPRODUCT)

-- 3 --

SELECT * FROM DIMPRODUCT
WHERE ProductSubcategoryKey = 
	(SELECT PRODUCTSUBCATEGORYKEY FROM DimProductSubcategory WHERE ProductSubcategoryName = 'Televisions')

-- 4 --

SELECT
	*
FROM
	FACTSALES
WHERE STOREKEY IN (
	SELECT
		STOREKEY
	FROM
		DIMSTORE
	WHERE EmployeeCount >= 100
)

-- exemplo any, some e all --

-- exist --

SELECT COUNT(*) FROM DimProduct

SELECT TOP(100) * FROM FACTSALES

-- mesmos resultados --
SELECT
	PRODUCTKEY,
	PRODUCTNAME
FROM
	DIMPRODUCT
WHERE EXISTS(
	SELECT
		PRODUCTKEY
	FROM
		FACTSALES
	WHERE
		DATEKEY = '01/01/2007'
		AND FACTSALES.ProductKey = DimProduct.ProductKey
)

SELECT
	PRODUCTKEY,
	PRODUCTNAME
FROM
	DIMPRODUCT
WHERE PRODUCTKEY = ANY(
	SELECT
		PRODUCTKEY
	FROM
		FACTSALES
	WHERE
		DATEKEY = '01/01/2007'
		--AND FACTSALES.ProductKey = DimProduct.ProductKey
)

SELECT
	PRODUCTKEY,
	PRODUCTNAME,
	(SELECT COUNT(PRODUCTKEY) FROM FACTSALES WHERE FactSales.ProductKey = DimProduct.ProductKey) 'Qtd. Vendas'
FROM
	DIMPRODUCT

-- subqueries from --

SELECT
	COUNT(*)
FROM
	DIMPRODUCT
WHERE
	BRANDNAME = 'Contoso'
--
SELECT
	COUNT(*)
FROM
	(SELECT * FROM DIMPRODUCT WHERE BRANDNAME = 'Contoso') AS T

-- subqueries aninhadas --

SELECT 
	DISTINCT YEARLYINCOME
FROM
	DIMCUSTOMER
WHERE CUSTOMERTYPE = 'Person'
ORDER BY YEARLYINCOME DESC

SELECT
	CUSTOMERKEY,
	FIRSTNAME,
	LASTNAME,
	YEARLYINCOME
FROM
	DIMCUSTOMER
WHERE YEARLYINCOME = 160000

SELECT
	CUSTOMERKEY,
	FIRSTNAME,
	LASTNAME,
	YEARLYINCOME
FROM
	DIMCUSTOMER
WHERE YEARLYINCOME = (
	SELECT 
		MAX(YEARLYINCOME)
	FROM
		DIMCUSTOMER 
	WHERE YearlyIncome < (
			SELECT
				MAX(YearlyIncome)
			FROM
				DIMCUSTOMER
			WHERE CUSTOMERTYPE = 'Person'))

