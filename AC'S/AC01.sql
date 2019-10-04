/* PARTICIPANTES
Eduardo Vinicius Rodrigues Lima, 1900992
Leonardo Buzzo, 1900861
Davi Hideo Santa Rita Uemura, 1900814
Lucas Oliveira Cristovam de Souza, 1900824
Heitor Leal de Souza, 1900576
*/


/*

Exercicio 1: 

A:(tinyint,1 byte)

B:(char, n bytes)

C:(date, 3 bytes)

D:decimal/numeric 5-17 bytes)

E:(varchar, n+2 bytes)

*/





-- exercicio 2

select orderid as 'Número dos Pedidos',
	   orderdate as 'Data do Pedido',
	   freight as 'Frete'
	from SALES.Orders
	where (orderdate >= '20060701' and orderdate <= '20060731' or
		  orderdate >= '20061001' and orderdate <= '20061031') and
		  (freight <= 41.34 or freight >= 146.06)

	order by freight desc, orderdate asc

-- exercicio 3

select shipname as 'nome de entrega', freight as 'valores de frete'
	from sales.orders
where (not shipname LIKE '%ship%') and (freight <=11.61 and freight >= 4.56)
order by freight desc 

		  

-- exercicio 4


select empid as 'Número do Funcionário',
	   firstname + ' ' + lastname as 'Nome e Sobrenome',
	   birthdate as 'Data de Nascimento',
	   hiredate as 'Data de Contrato'
	   from HR.Employees
	   where not (country = 'UK')  and (hiredate < '20040101') and (birthdate >= '19691231')

select * from hr.Employees
	where empid = 3


-- exercicio 5


select orderid as 'números dos pedidos', shipcity as 'cidade', orderdate as 'data de pedido'
from sales.orders
where (shipcity = 'graz') and (orderdate = '20071210' or orderdate = '20071211' or
							   orderdate = '20071215')


select orderid as 'Número do Pedido',
	   productid as 'Numero do Produto',
	   unitprice * qty as 'Valor do Item do Pedido',
	   discount as 'Desconto'
	    from sales.OrderDetails
where orderid = '10771' or orderid = '10773' or orderid = '10776'
