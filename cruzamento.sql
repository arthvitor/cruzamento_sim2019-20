-- CRUZAMENTOS BIVARIADOS DO BANCO DE DADOS

-- 1. mortes por estado (geral, CID F e CID F10)

SELECT 
	count(s.CAUSABAS) as "tot_morte", 
	i.state as estado, 
	"2019" as ano,
	"TODOS" as CID
FROM sim2019_c as s
INNER JOIN ibge as i
ON s.CODMUNRES = substr(i.city_ibge_code, 1, 6)
GROUP by i.state

UNION

SELECT 
	count(s.CAUSABAS) as "tot_morte",
	i.state as estado, 
	"2020" as ano,
	"TODOS" as CID
FROM sim2020_c as s
INNER JOIN ibge as i
ON s.CODMUNRES = substr(i.city_ibge_code, 1, 6)
GROUP by i.state

UNION

-- f
SELECT 
	count(s.CAUSABAS) as "tot_morte",
	i.state as estado, 
	"2019" as ano,
	"F" as CID
FROM sim2019_c as s
INNER JOIN ibge as i
ON s.CODMUNRES = substr(i.city_ibge_code, 1, 6)
WHERE CAUSABAS like "%F%"
GROUP by i.state

UNION

SELECT 
	count(s.CAUSABAS) as "tot_morte",
	i.state as estado, 
	"2020" as ano,
	"F" as CID
FROM sim2020_c as s
INNER JOIN ibge as i
ON s.CODMUNRES = substr(i.city_ibge_code, 1, 6)
WHERE CAUSABAS like "%F%"
GROUP by i.state

UNION

-- f10
SELECT 
	count(s.CAUSABAS) as "tot_morte",
	i.state as estado, 
	"2019" as ano,
	"F10" as CID
FROM sim2019_c as s
INNER JOIN ibge as i
ON s.CODMUNRES = substr(i.city_ibge_code, 1, 6)
WHERE CAUSABAS like "%F10%"
GROUP by i.state

UNION

SELECT 
	count(s.CAUSABAS) as "tot_morte",
	i.state as estado, 
	"2020" as ano,
	"F10" as CID
FROM sim2020_c as s
INNER JOIN ibge as i
ON s.CODMUNRES = substr(i.city_ibge_code, 1, 6)
WHERE CAUSABAS like "%F10%"
GROUP by i.state

-- 2. Mortes por escolidade (geral, CID F e CID F10)

SELECT 
	a.escolaridade as escola,
	a.morte_tot as "2019",
	b.morte_tot as "2020",
	"TODOS" as CID
FROM escolaridade_2019 as a
INNER JOIN escolaridade_2020 as b
on a.escolaridade = b.escolaridade

UNION

-- f
SELECT 
	c.escolaridade as escola,
	c.morte_tot as "2019",
	d.morte_tot as "2020",
	"F" as CID
FROM escolaridade_2019_f as c
INNER JOIN escolaridade_2020_f as d
on c.escolaridade = d.escolaridade

UNION

-- f10
SELECT 
	e.escolaridade as escola,
	e.morte_tot as "2019",
	f.morte_tot as "2020",
	"F10" as CID
FROM escolaridade_2019_f10 as e
INNER JOIN escolaridade_2020_f10 as f
on e.escolaridade = f.escolaridade

-- 3. Mortes por sexo (geral, CID F e CID F10)

SELECT 
	s.SEXO as Sexo,
	s.tot_morte as "2019",
	t.tot_morte as "2022",
	"TODOS" as CID
FROM sexo_morte_2019 as s
INNER JOIN sexo_morte_2020 as t
on s.SEXO = t.SEXO

UNION

-- f
SELECT 
	s.SEXO as Sexo,
	s.tot_morte as "2019",
	t.tot_morte as "2022",
	"F" as CID
FROM sexo_morte_2019_f as s
INNER JOIN sexo_morte_2020_f as t
on s.SEXO = t.SEXO

UNION

-- f10
SELECT 
	s.SEXO as Sexo,
	s.tot_morte as "2019",
	t.tot_morte as "2022",
	"F10" as CID
FROM sexo_morte_2019_f10 as s
INNER JOIN sexo_morte_2020_f10 as t
on s.SEXO = t.SEXO
