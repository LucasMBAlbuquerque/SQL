-- USANDO UNION --

-- UNION REMOVE AS DUPLICATAS. UNION ALL RETORNA TODOS OS DADOS INCLUSIVE AS DUPLICATAS

SELECT
	FirstName,
	BirthDate
FROM
	DimCustomer
WHERE Gender = 'F'
UNION ALL
SELECT
	FirstName,
	BirthDate
from
	DimCustomer
WHERE Gender = 'M'