--Apresente ps clientes que fizeram pedido de modo ordenado
select * 
from cliente, pedido
where cliente.idcliente = pedido.idcli
order by nomecliente

select distinct nomecliente
from cliente join pedido on cliente.idcliente = pedido.idcli
order by nomecliente
--Chamou o join precisa da cláusula ON

select distinct nomecliente, dtpedido
from cliente c join pedido p on c.idcliente = p.idcli
order by nomecliente desc, dtpedido desc

--Concatenação de strings
select nomecliente ||' '|| dtpedido as concatenacao
from cliente c join pedido p on c.idcliente = p.idcli
order by nomecliente desc, dtpedido desc

--Apresentar os clientes que tenham telefone no Rio de Janeiro (DDD21)
select nomecliente, telefone
from cliente c join telcliente t on c.idcliente = t.idcliente
where telefone like '21%'

select nomecliente, telefone, c.idcliente
from cliente c join telcliente t on c.idcliente = t.idcliente
where telefone not like '21%'
--pode-se utilizar o comando not like

select idpedido, motivocancel
from pedido
where motivocancel like '%atraso%'

--Apresente os pedidos que não possuem motivo de cancelamento
select idpedido, motivocancel
from pedido 
where motivocancel is null

--Apresente os pedidos que possuem motivo de cancelamento
select idpedido, motivocancel
from pedido 
where motivocancel is not null

--Funções de agregação
--Apresente quantos pedidos tem motivo de cancelamento
select count(*)
from pedido
where motivocancel is not null

--Apresente quantos clientes possuem pedidos
select count(distinct idcliente) as qtdcliente, count(idpedido) as qtdpedido
from cliente join pedido on cliente.idcliente = pedido.idcli

--Apresente quantos itens de consumo tem no restaurante
select count(iditem)
from itemconsumo

--Apresente quantos itens de consumo sejam comida
select count(iditem)
from itemconsumo 
where categoria = 'comida'

--Apresente quantos itens têm em cada categoria
select count(iditem)
from itemconsumo
group by categoria

--Apresente o preço médio por categoria
select categoria, avg(precounit)
from itemconsumo
group by categoria

--Apresente o preco medio por categoria abaixo de 10,00
select categoria, avg(precounit) as media
from itemconsumo
group by categoria
having avg(precounit) < 10

--Qual o mais preço do restaurante?
select max(precounit)
from itemconsumo

--Qual o menor preço do restaurante?
select min(precounit)
from itemconsumo

--Qual o maio preço, menor preço e preço médio no restaurante?
select max(precounit) as maior_preco, min(precounit) as menor_preco, avg(precounit) as preco_medio
from itemconsumo

--Qual é o produto que tem o maior valor no restaurante?
select max(precounit)
from itemconsumo

--Consultas aninhadas
select atributo1
from tabela
where x IN (select x
           from
           where)
           
--Sintaxe EXIST

    
--Clientes que têm telefone e fizeram pedido
select distinct nomecliente
from cliente c, telcliente t
where c.idcliente = t.idcliente
and c.idcliente in (select idcli
                   from pedido)

 
--Clientes que têm telefone e não fizeram pedido
select distinct nomecliente 
from cliente c, telcliente t
where c.idcliente = t.idcliente
and c.idcliente not in (select idcli
                    from pedido)
 
 
select * from itemconsumo
update itemconsumo set precounit = 5 where id=6

select nomeitem
from itemconsumo 
where precounit in (select max (precounit)
                   from itemconsumo)

