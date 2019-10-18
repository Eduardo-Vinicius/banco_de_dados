select*from VendasAnuais
	where qtd = 0

	select * from Ano
--1

select count(idVendas) as qty
from VendasAnuais

--2

select sum (qtd) as QtdDeVendas
from VendasAnuais

--3

select max(qtd) as 'Max Vendas',
	   min(qtd) as 'Min. Vendas',
	   avg(qtd) as 'Média Vendas'
	from VendasAnuais

--4

select sum (qtd) as QtdDeVendas
from VendasAnuais
	join Ano as ano
		on VendasAnuais.idAnodaVenda = ano.idAno
group by ano
order by ano desc

--5

select sum(VendasAnuais.qtd) as 'Qtd de Vendas', veiculo.descricao, modelo.descricao
from VendasAnuais
	join Veiculo as veiculo
	on VendasAnuais.idVeiculo = veiculo.idVeiculo
	join Modelo as modelo
	on veiculo.idModelo = modelo.idModelo
	where veiculo.descricao = 'CG 125' and modelo.descricao = 'STD'
group by veiculo.descricao, modelo.descricao

-- 6

select min(Ano.ano) as 'Ano Fab.', f.Nome, Veiculo.descricao, modelo.descricao
from Veiculo
	join Ano as ano
		on veiculo.idAnoFabricacao = ano.idAno
	join Modelo as modelo
		on Veiculo.idModelo = modelo.idModelo
	join Fabricante as f
		on Veiculo.idFabricante = f.idFabricante
group by f.Nome, ano.ano, Veiculo.descricao, modelo.descricao
order by Ano.ano desc, modelo.descricao desc, f.Nome asc,veiculo.descricao asc

--7

select mes as 'Mês da Venda', ano as 'Ano da Venda', sum(qtd) as soma, max(qtd) as 'máximo ano', min(qtd) as 'minimo ano', avg(qtd) as 'média ano'
from VendasAnuais
	join mes as mes
	on VendasAnuais.idMesdaVenda = mes.idMes
	join ano as ano
	on VendasAnuais.idAnodaVenda = ano.idAno
where ano.ano = 2000
group by mes, ano
order by ano asc, mes asc

-- 8

select mes as 'Mês da Venda', ano as 'Ano da Venda', sum(qtd) as soma, max(qtd) as 'máximo ano', min(qtd) as 'minimo ano', avg(qtd) as 'média ano'
from VendasAnuais
	join mes as mes
	on VendasAnuais.idMesdaVenda = mes.idMes
	join ano as ano
	on VendasAnuais.idAnodaVenda = ano.idAno
where ano.ano = 2000
group by mes, ano
having avg(qtd) >=500
order by ano asc, mes asc

