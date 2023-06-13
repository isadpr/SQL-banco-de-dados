select * from itens_consumo; --projecao na algebra relacional--
update itens_consumo set preco_unit = 10.00 where id_item=3;

update itens_consumo set preco_unit = 10.99 where id_item=3 or id_item=2;
update itens_consumo set preco_unit = 11.99 where id_item in (2,3);

update itens_consumo set preco_unit = 9.50 where id_item not in (2,3);

update itens_consumo set preco_unit = 15.00, descricao='tamanho grande com cheddar e bacon' where id_item=3;
update itens_consumo set nome_item = 'hamburguer' where id_item=3;

update itens_consumo set preco_unit = 5.90, descricao='mate copo 300ml' where id_item=5;
update itens_consumo set preco_unit = 9.50 where id_item not in (2,3);

--where = condicao (filtro) --