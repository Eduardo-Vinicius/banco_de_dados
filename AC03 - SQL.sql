/* PARTICIPANTES

Eduardo Vinicius Rodrigues Lima, 1900992
Leonardo Buzzo, 1900861
Davi Hideo Santa Rita Uemura, 1900814


*/

use Concessionaria
go


create table Ano
(
	idAno tinyint Identity(1,1),
	ano smallint,
	constraint id_ano primary key (idAno)
)

create table Mes
(
	idMes tinyint Identity(15,3),
	mes tinyint,
	constraint id_mes primary key (idMes)
)


create table Modelo
(
	idModelo tinyint Identity(1,1),
	descricao varchar(50) not null,
	constraint id_modelo primary key (idModelo)
)



create table  Fabricante
(
	idFabricante tinyint Identity(1,1),
	Nome varchar(50) not null,
	Cidade varchar(50) not null,
	Endereco varchar(100),
	UF char(2),
	Telefone varchar(20),
	Contato varchar(50) not null,

	constraint id_fabricante primary key (idFabricante)
)


create table Veiculo
(
	idVeiculo smallint Identity (1,1),
	descricao varchar(50) not null,
	valor decimal(9	,2) not null,
	dataCompra date not null,
	idModelo tinyint,
	idFabricante tinyint,
	idAno tinyint,

	constraint id_veiculo primary key (idVeiculo),

	constraint fkModelo foreign key (idModelo)
	references Modelo(idModelo),

	constraint fkFabricante foreign key (idFabricante)
	references Fabricante(idFabricante),

	constraint fkAno foreign key (idAno)
	references Ano(idAno)
)


create table VendasAnuais
(
	idVendas smallint Identity(1,1),
	qtd smallint not null,
	idVeiculo smallint,
	idAnodaVenda tinyint,
	idMesdaVenda tinyint,

	constraint idVendas primary key (idVendas),

	constraint fkVeiculo foreign key (idVeiculo)
	references Veiculo(idVeiculo),

	constraint fkAnodaVenda foreign key (idAnodaVenda)
	references Ano(idAno),

	constraint fkMesdaVenda foreign key (idMesdaVenda)
	references Mes(idMes)
	
)

alter table modelo alter column descricao varchar(30) not null
alter table veiculo alter column descricao varchar(30) not null

alter table veiculo add StatusVeiculo varchar (20)


alter table fabricante drop column contato



ALTER TABLE Veiculo add constraint dfStatusVeiculo DEFAULT ('Ativo') for StatusVeiculo


ALTER TABLE VendasAnuais Add Constraint ckqtd CHECK (qtd between 1 and 10000)




insert ano (ano) values (2016), (2017), (2018), (2019)




insert Modelo (descricao) values ('LST'), ('KS'), ('RS')





alter table Mes alter column descricaoMes varchar(9)
go

insert mes (mes) values (1), (2), (3), (4), (5), (6), (7), (8), (9), (10), (11), (12);

go

update Mes set descricaoMes = 'Janeiro'
	where mes = 1;
update Mes set descricaoMes = 'Fevereiro'
	where mes = 2;
update Mes set descricaoMes = 'Março'
	where mes = 3;
update Mes set descricaoMes = 'Abril'
	where mes = 4;
update Mes set descricaoMes = 'Maio'
	where mes = 5;
update Mes set descricaoMes = 'Junho'
	where mes = 6;
update Mes set descricaoMes = 'Julho'
	where mes = 7;
update Mes set descricaoMes = 'Agosto'
	where mes = 8;
update Mes set descricaoMes = 'Setembro'
	where mes = 9;
update Mes set descricaoMes = 'Outubro'
	where mes = 10;
update Mes set descricaoMes = 'Novembro'
	where mes = 11;
update Mes set descricaoMes = 'Dezembro'
	where mes = 12;






insert Fabricante (nome, cidade, endereco, uf, telefone)
	values ('Triumph', 'São Paulo', 'Av. Miguel Avelar', 'SP', '(11) 98371-2842')

insert Fabricante (nome, cidade, endereco, uf, telefone)
	values ('KTM', 'Rio de Janeiro', 'R. Copacabana 192', 'RJ', '(21) 93842-1272')

insert Fabricante (nome, cidade, endereco, uf, telefone)
	values ('Kymco', 'Bahia', 'Rua Djalma Passos', 'BA', '(73) 93481-9382')





insert into Veiculo (descricao, valor, dataCompra, idModelo, idFabricante, idAno)
	values ('Tiger Explorer', 40000, getdate(), 1, 1, 1)

insert into Veiculo (descricao, valor, dataCompra, idModelo, idFabricante, idAno)
	values ('ECX 450,', 20000, getdate(), 2, 2, 2)

insert into Veiculo (descricao, valor, dataCompra, idModelo, idFabricante, idAno)
	values ('Dowtown', 22900, getdate(), 3, 3, 3)



/* Foi inserido o valor 21, por conta do DROP antigo, o ID iniciava-se em 21 */
insert into VendasAnuais (qtd, idVeiculo, idAnodaVenda, idMesdaVenda) 
	values (30, 1, 1, 21)
	
/* Foi inserido o valor 27, por conta do DROP antigo, o ID iniciava-se em 21 */
insert into VendasAnuais (qtd, idVeiculo, idAnodaVenda, idMesdaVenda) 
	values (27, 3, 3, 27)



update modelo
set descricao = 'GTX'
	where descricao = 'LST'




delete from vendasanuais
	where idVendas = 1
go

delete from Veiculo
	where idveiculo = 1
go


