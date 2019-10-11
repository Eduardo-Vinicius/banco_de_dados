/*
Eduardo Vinicius Rodrigues Lima, 1900992
Leonardo Buzzo, 1900861
Davi Hideo Santa Rita Uemura, 1900814
Heitor Leal de Souza, 1900576
*/

use tsql2012

-- 1

select orderid as 'Numero do pedido', orderdate as 'Data do pedido',
       contactname as 'Nome do Contato', country as 'Pais'
	from sales.Customers as sales
		Join sales.Orders as orders
			on orders.custid = sales.custid

-- 2

select orderdate as 'data do pedido', contactname as 'nome do contato', 
	    firstname+' '+lastname as 'nome completo do empregado',employ.country as 'país do empregado'
		
	from sales.Orders as sales
		Join hr.Employees as employ
			on sales.empid = employ.empid
		Join Sales.Customers as cust
			on sales.custid = cust.custid

	where employ.country = 'UK'

-- 3


select orderid as 'número do pedido', orderdate as 'data do pedido', contactname as 'nome do contato do cliente',
       firstname+' '+lastname as 'nome completo do empregado', cust.country as 'país do cliente'

	from sales.Orders as sales
		Join hr.Employees as employ
			on sales.empid = employ.empid
		Join Sales.Customers as cust
			on sales.custid = cust.custid
	where cust.country = 'Brazil'
	order by orderdate desc
	 
	
-- 4 

select orderid as 'Núm. do Pedido', orderdate as 'Data do Pedido', contactname as 'Nome do Contato',
	   firstname + '' + lastname as 'Nome Completo',  employ.country as 'Pais do Empregado', ship.companyname as 'Nome da Empresa'

	   from sales.Orders as sales
		Join hr.Employees as employ
			on sales.empid = employ.empid
		Join Sales.Customers as cust
			on sales.custid = cust.custid
		Join Sales.Shippers as ship
			on sales.shipperid = ship.shipperid

	   where employ.country = 'USA' and (ship.companyname = 'Shipper ETYNR' or ship.companyname = 'Shipper GVSUA')

	   order by orderid desc

--5 

select productname as 'nome do produto', categoryname as 'nome da categoria', unitprice as 'preço do produto'
	
	from Production.Products as p
	join Production.Categories as c
	on p.categoryid = c.categoryid
where categoryname = 'BEVERAGES' AND unitprice < 30
order by unitprice


-- 6

select productname as 'Nome do Produto', companyname as 'Nome da Empresa de Entrega', qty as 'Quantidade' 

	from sales.Orders as sales
		join Sales.Shippers as ship
			on sales.shipperid = ship.shipperid
		join sales.OrderDetails as details 
			on sales.orderid = details.orderid
		join Production.Products as prod
			on details.productid = prod.productid
		
		where qty > 100
		order by productname asc, qty desc
	
-- 7

select ct.contactname as 'Nome do Contato', productname as 'Nome do Produto', qty as 'Quantidade', orderdate 'Data do Pedido', sup.city as 'Cidade do Fornecedor'
	   
	    from sales.Orders as sales
		join Sales.Customers as ct
			on sales.custid = ct.custid
		join sales.OrderDetails as dt
			on sales.orderid = dt.orderid
		join Production.Products as prod
			on dt.productid = prod.productid
		join Production.Suppliers as sup
			on prod.supplierid = sup.supplierid

		where (orderdate >= '2006-07-01' and orderdate <= '2006-07-31') and (qty >= 20 and qty <= 60) AND
			  (productname like 'Product A%' or productname like 'Product G%') and
			  sup.city in ('Stockholm', 'Sydney', 'Sandvika', 'Ravenna') 
			  order by empid desc
