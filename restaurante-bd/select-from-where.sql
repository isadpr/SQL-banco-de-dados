--Liste todos os itens da tabela
select *
from itens_consumo

--Liste todos os itens de consumo e seus preços
select nome_item, preco_unit
from itens_consumo

--Liste todos os itens que custam menos de R$10.00
select nome_item, preco_unit
from itens_consumo
where preco_unit < 10

--Liste os itens que custam mais de R$5.00 e que sejam comida
select nome_item, preco_unit
from itens_consumo
where preco_unit>5 and categoria='comida' 

--Rodando o comando anterior retirando as duplicações
select distinct nome_item, preco_unit
from itens_consumo 
where preco_unit>5 and categoria='comida'
--distinct atua quando apenas TODOS os elementos sao diferentes--

--Testando o comparador de diferença
select nome_item, categoria
from itens_consumo
where categoria <> 'comida' -- <> significa DIFERENTE, também pode usar !=