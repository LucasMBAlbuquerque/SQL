-- USANDO O FORMAT --

--a) Numericos:
SELECT FORMAT(1000, 'N')
SELECT FORMAT(1000, 'G')

--b) Personalizados:
SELECT FORMAT(123456789, '###-##-####')

--c) Data:
SELECT FORMAT(CAST('06/23/2020' AS DATETIME), 'dd/MMMM/yyyy')
SELECT FORMAT(CAST('03/21/2021' AS DATETIME), 'dddd')

-- EXERCICIO --

SELECT 'A data de validade do produto é: ' + FORMAT(CAST('04/17/2021' AS DATETIME), 'dd/MMM/yyyy')