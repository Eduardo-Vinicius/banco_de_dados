/* PARTICIPANTES

Eduardo Vinicius Rodrigues Lima, 1900992
Leonardo Buzzo, 1900861
Davi Hideo Santa Rita Uemura, 1900814
Lucas Oliveira Cristovam de Souza, 1900824

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
	valor decimal(6,2) not null,
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
