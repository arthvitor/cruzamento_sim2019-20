-- CRIAÇÃO DE VIEWS PARA TRATAMENTO DOS BANCOS DE DADOS

-- 1. tratando a planilha do CID-10 para se adaptar ao banco de dados principal

CREATE VIEW cid10n as
SELECT replace(codigo, ".", "") as codigon, descricao
FROM cid10

-- 2. cruzando descrição do CID-10 com a base do SIM (diminuição do custo computacional)
--2019
CREATE VIEW causamorte2019 as
SELECT 
	s.CAUSABAS as causa_morte, 
	c.descricao as descricao_morte,
	count(s.CAUSABAS) as soma_morte
FROM sim2019 as s
INNER JOIN cid10n as c
on causa_morte = codigon
GROUP by causa_morte
ORDER by soma_morte DESC

--2020
CREATE VIEW causamorte2020 as
SELECT 
	s.CAUSABAS as causa_morte, 
	c.descricao as descricao_morte,
	count(s.CAUSABAS) as soma_morte
FROM sim2020 as s
INNER JOIN cid10n as c
on causa_morte = codigon
GROUP by causa_morte
ORDER by soma_morte DESC

-- 3. criação de view do banco de dados principal com datas tratadas
-- 2019
CREATE VIEW sim2019_c as
SELECT
	CASE
		WHEN length(DTOBITO) = 7 THEN printf("0%d", DTOBITO)
		ELSE printf("%d", DTOBITO) 
	END as data_correta,
	*
FROM sim2019

-- 2020
CREATE VIEW sim2020_c as
SELECT
	CASE
		WHEN length(DTOBITO) = 7 THEN printf("0%d", DTOBITO)
		ELSE printf("%d", DTOBITO) 
	END as data_correta,
	*
FROM sim2020
