select * from cliente
select * from telcliente

--Liste os clientes(por seus nomes) e seus telefones
select nome_cliente, telefone
from cliente as c, tel_cliente as t --produto cartesiano, não terá os clientes com os seus respectivos telefones
--POR ISSO DEVE-SE UTILIZAR SELECAO (WHERE)
where t.id_cliente = c.id_cliente
and nome_cliente = 'Rodrigo' --nao pode usar WHERE duas vezes

-- obs: AS é opcional, pode deixar apenas 'cliente c'

--Liste os clientes(por seus nomes) e seus telefones (usando junção)
select nome_cliente, telefone
from cliente c join tel_cliente t on t.id_cliente = c.id_cliente --inner join
where nome_cliente = 'Rodrigo'

--Liste todos os clientes do restaurante, tendo ou nao telefone cadastrado
select nome_cliente, telefone
from cliente c left join tel_cliente t on c.id_cliente = t.id_cliente --o cliente vai manter todos os itens
--left join, right join, full join

--Liste todos os clientes que tiveram pedido e seus telefones
select nome_cliente, telefone, id_pedido
from cliente c, tel_cliente t, pedido p
where c.id_cliente = t.id_cliente
and c.id_cliente = p.id_cli

select * from pedido

--- adicionando a coluna de id_cliente
select c.id_cliente,nome_cliente, telefone, id_pedido
from cliente c, tel_cliente t, pedido p
where c.id_cliente = t.id_cliente
and c.id_cliente = p.id_cli

--Liste todos os clientes que tiveram pedido e seus telefones (usando junção)
select nome_cliente, telefone, id_pedido
from cliente c join tel_cliente t on c.id_cliente = t.id_cliente
join pedido p on c.id_cliente = p.id_cli

--Liste todos os clientes que tiveram pedido
select nome_cliente, id_pedido
from cliente c join pedido p on c.id_cliente = p.id_cli
--from cliente c natural join pedido p
-- para usar o natural join os atributos precisam ter o mesmo nome

--Operações de conjunto
select nome_item 
from itens_consumo
where categoria = 'bebida'
union all --union exclui elementos repetidos, use ALL caso queira mostrar todos os elementos
select nome_item
from itens_consumo
where categoria = 'comida'

select nome_item 
from itens_consumo
where categoria = 'bebida'
except
select nome_item
from itens_consumo
where categoria = 'comida'

--
select *
from itens_consumo 
where categoria='comida'
order by nome_item asc -- se nao deixar nada escrito a ordenação é crescente

select *
from itens_consumo 
where categoria='comida'
order by preco_unit desc
