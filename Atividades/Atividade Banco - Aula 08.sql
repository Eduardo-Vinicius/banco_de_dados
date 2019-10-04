create database SaladeAula


use SaladeAula

create table Cor (
IdCor tinyint identity(1,1),
Descricao varchar(50),

constraint pkId primary key (IdCor)

)

create table Fornecedor (

IdFornecedor tinyint identity(1,1),
Nome varchar(50), 
Telefone varchar(20),
Contato varchar(30)

constraint pkId_Fornecedor primary key (IdFornecedor)


)

create table Produto (
idProduto tinyint identity(1,1),
Codigo char(6),
Nome varchar(50),
Estoque smallint,
Descontinuado bit,
idFornecedor tinyint,
idCor tinyint

constraint pk_IdProduto primary key (idProduto)

constraint fk_Id_Fornecedor foreign key (idFornecedor)
references Fornecedor(IdFornecedor),

constraint fk_Id_Cor foreign key (idCor)
references Cor(IdCor)
)


select * from fornecedor

insert into Cor (descricao) values ('Branco'), ('Preto'), ('Azul'), ('Vermelho'), ('Amarelo')

insert into Cor(descricao) values ('Lilas'), ('Azul-Marinho'), ('Verde-Azulado')

insert into Fornecedor(Nome, Telefone, Contato)
values ('Sony', '8498-8732', 'Allan')
	  ,('Motorola', '7987-9900', 'Cristina')
	  ,('Asus', '5476-1120', 'Felipe')
	  ,('Nokia', '6755-5656', 'Fábio')



insert into Fornecedor(Nome, Telefone, Contato)
values ('Xiaomi', '2938-2398', 'Eduardo')
	  ,('TP-Link', '9328-2981', 'Davi')
	  ,('Huawei', '9221-2310', 'Lucas')
	 
insert into Produto(Codigo, nome, estoque, descontinuado, idFornecedor, idCor)
values ('XT890A', 'Asus Zenfone', 5, 0, 3, 4)
	  ,('RQ765B', 'iPhone', 0,1,4,4)
	  ,('WD528B', 'Moto X', 3,0,2,5)
	  ,('TF897A', 'Xperia', 7,1,1,1)
	  ,('RF2128', 'Moto Maxx', 2,0,2,1)

insert into Produto(Codigo, nome, estoque, descontinuado, idFornecedor, idCor)
values ('XT890A', 'Asus Zenfone', 9, 0, 3, 1)
	  ,('RQ765B', 'iPhone', 5,1,4,3)
	  ,('WD528B', 'Moto X', 10,0,2,4)
	  ,('TF897A', 'Xperia', 11,1,1,2)
	  ,('RF2128', 'Moto Maxx', 24,0,2,5)

insert into Produto(Codigo, nome, estoque, descontinuado, idFornecedor, idCor)
values ('XT890A', 'Asus Zenfone', 4, 0, 3, 2)
	  ,('RQ765B', 'iPhone', 21,1,4,1)
	  ,('WD528B', 'Moto X', 2,0,2,1)
	  ,('TF897A', 'Xperia', 15,1,1,5)
	  ,('RF2128', 'Moto Maxx', 14,0,2,2)

insert into Produto(Codigo, nome, estoque, descontinuado, idFornecedor, idCor)
values ('MI2398', 'MI 9T', 6, 0, 5, 7)
	  ,('MI2392', 'MI 9 Plus', 34, 1, 5, 7)
	  ,('MI3298', 'MI 8', 1, 0, 5, 7)
	  ,('TP3412', 'TP link29', 3, 1, 6, 6)
	  ,('TP2391', 'TP link10', 23, 0, 6, 6)
	  ,('TP1111', 'TP Link 11', 21, 1, 6, 6)
	  ,('HW2390', 'PocoPhone', 2, 0, 7, 2)
	  ,('HW9311', 'F1 POCO', 22, 0, 7, 2)
	  ,('HW8321', 'F3 Poco', 11, 0, 7, 2)
	  ,('MI2911', 'Redmi NOte7', 31, 0, 5, 7)
	  ,('MI6392', 'MI 9 Plus', 34, 1, 5, 7)
	  ,('MI3248', 'MI 8', 1, 0, 5, 7)
	  ,('TP3812', 'TP link29', 3, 1, 6, 6)
	  ,('TP2291', 'TP link10', 23, 0, 6, 6)
	  ,('TP1211', 'TP Link 11', 21, 1, 6, 6)
	  ,('HW2348', 'PocoPhone', 2, 0, 7, 2)
	  ,('HW7321', 'F1 POCO', 22, 0, 7, 2)
	  ,('HW2371', 'F3 Poco', 11, 0, 7, 2)

-- questao 9

select P.Codigo AS 'Cód. Produto', p.Nome as 'Nome do Prod.',  p.Estoque as 'Estoque' 
	  ,f.Nome as 'Fornecedor'
from  Produto as P 
		Join Fornecedor as F
			On p.idFornecedor = f.IdFornecedor
where p.Descontinuado = 1

-- questao 10

select P.Codigo AS 'Cód. Produto', p.Nome as 'Nome do Prod.',  p.Estoque as 'Estoque'
	  ,f.Nome as 'Fornecedor'
from  Produto as P 
		Join Fornecedor as F
			On p.idFornecedor = f.IdFornecedor
	
where p.Estoque between 7 and 21

--  11

select P.Codigo AS 'Cód. Produto', p.Nome as 'Nome do Prod.',  p.Estoque as 'Estoque'
	  ,f.Nome as 'Fornecedor'
	  ,c.Descricao as 'Nome da Cor'
from  Produto as P 
		Join Fornecedor as F
			On p.idFornecedor = f.IdFornecedor
		Join Cor as C
			On p.idCor = c.IdCor

-- 12 

select P.Codigo AS 'Cód. Produto', p.Nome as 'Nome do Prod.',  p.Estoque as 'Estoque'
	  ,f.Nome as 'Fornecedor'
	  ,c.Descricao as 'Nome da Cor'
from  Produto as P 
		Join Fornecedor as F
			On p.idFornecedor = f.IdFornecedor
		Join Cor as C
			On p.idCor = c.IdCor
where c.Descricao in ('Branco', 'Preto', 'Vermelho')

-- 13 

select P.Codigo AS 'Cód. Produto', p.Nome as 'Nome do Prod.',  p.Estoque as 'Estoque'
	  ,f.Nome as 'Fornecedor'
	  ,c.Descricao as 'Nome da Cor'
from  Produto as P 
		Join Fornecedor as F
			On p.idFornecedor = f.IdFornecedor
		Join Cor as C
			On p.idCor = c.IdCor
where c.Descricao != 'Azul'

-- 14

select P.Codigo AS 'Cód. Produto', p.Nome as 'Nome do Prod.',  p.Estoque as 'Estoque'
	  ,f.Nome as 'Fornecedor'
from  Produto as P 
		Join Fornecedor as F
			On p.idFornecedor = f.IdFornecedor
	
where p.Estoque < 5 or p.Estoque >= 10
order by p.Estoque

-- 15

select P.Codigo AS 'Cód. Produto', p.Nome as 'Nome do Prod.',  p.Estoque as 'Estoque', f.Contato as 'Nome do Contato'
	  ,f.Nome as 'Fornecedor'
from  Produto as P 
		Join Fornecedor as F
			On p.idFornecedor = f.IdFornecedor
	
where f.Contato like '%F%'

-- 16

select P.Codigo AS 'Cód. Produto', p.Nome as 'Nome do Prod.',  p.Estoque as 'Estoque' 
	  ,f.Contato as 'Nome do Contato' ,f.Nome as 'Fornecedor', f.Telefone as 'Telefone do Fornecedor'
from  Produto as P 
		Join Fornecedor as F
			On p.idFornecedor = f.IdFornecedor
	
where f.Telefone like '%0'
