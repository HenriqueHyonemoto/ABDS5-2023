-- Tabela Cliente 
create table cliente (
codigo_cliente numeric(5) not null,
nome_cliente varchar(40),
endereco varchar(40),
cidade varchar(20),
cep varchar(9),
uf char(2),
cnpj varchar(20),
ie varchar(20));

alter table cliente add constraint pk_cliente primary key (codigo_cliente);

-- Tabela vendedor 
create table vendedor (
codigo_vendedor numeric(5) not null,
nome_vendedor varchar(40) not null,
salario_fixo numeric(7,2),
faixa_comissao char(1),
senha varchar(50));

alter table vendedor add constraint pk_vendedor primary key (codigo_vendedor);


-- Tabela pedido
--Note: Uma vez que a tabela pedido faz referencia as tabelas CLIENTE e
--VENDEDOR, eu a
--criei depois de criar as tabelas referenciadas 
 

create table pedido(
num_pedido numeric(5) not null,
prazo_entrega numeric(3) not null,
codigo_cliente numeric(5) not null,
codigo_vendedor numeric(5) not null,
total_pedido    numeric(10,2),
data_pedido date );

alter table pedido add constraint pk_pedido primary key (num_pedido);

alter table pedido add constraint fk_pedido_cliente foreign key
(codigo_cliente)
                                              references cliente; 

alter table pedido add constraint fk_pedido_vendedor foreign key
(codigo_vendedor)
                                              references vendedor;                                     
--Tabela produto 
create table produto (
codigo_produto numeric(5) not null,
unidade char(3),
descricao varchar(30),
valor_venda  numeric(7,2),
valor_custo numeric(7,2),
qtde_minima numeric(5,2),
quantidade numeric (5,2),
comissao_produto numeric(5,3)
);

alter table produto add constraint pk_produto primary key (codigo_produto);



-- Tabela Item_Pedido
--Note: mesmo caso da tabela pedido 
 

create table item_pedido (
num_pedido numeric(5) not null,
codigo_produto numeric(5) not null,
quantidade numeric(3),
valor_venda numeric(7,2),
valor_custo numeric(7,2));

alter table item_pedido add constraint pk_item_pedido primary key
(num_pedido,codigo_produto);

alter table item_pedido add constraint fk_item_ped_pedi foreign key
(num_pedido)
                                              references pedido;
alter table item_pedido add constraint fk_item_ped_prod foreign key
(codigo_produto)
                                              references produto;


-- Fim das tabelas 

--Inserido dados na tabela cliente

insert into cliente 
  values (720, 'Ana', 'Rua 17 n. 19', 'Niteroi', '24358310', 'RJ',
'12113231/0001-34', '2134');

insert into cliente
  values (870, 'Flávio', 'Av. Pres. Vargas 10', 'São Paulo', '22763931', 'SP',
'22534126/9387-9', '4631');

insert into cliente
  values (110, 'Jorge', 'Rua Caiapo 13', 'Curitiba', '30078500', 'PR',
'14512764/9834-9', null);

insert into cliente 
  values (222, 'Lúcia', 'Rua Itabira 123 Loja 9', 'Belo Horizonte',
'221243491', 'MG', '28315213/9348-8', '2985');

insert into cliente 
  values (830, 'Maurício', 'Av. Paulista 1236', 'São Paulo', '3012683', 'SP',
'32816985/7465-6', '9343');

insert into cliente 
  values (130, 'Edmar', 'Rua da Praia sn', 'Salvador', '30079300', 'BA',
'23463284/234-9', '7121');

insert into cliente
  values (410, 'Rodolfo', 'Largo da lapa 27 sobrado', 'Rio de Janeiro',
'30078900', 'RJ', '12835128/2346-9', '7431');

insert into cliente 
  values (20, 'Beth', 'Av. Climério n.45', 'São Paulo', '25679300', 'SP',
'3248126/7326-8', '9280');

insert into cliente
  values (157, 'Paulo', 'T. Moraes c/3', 'Londrina', null, 'PR',
'3284223/324-2', '1923');

insert into cliente
  values (180, 'Lúcio', 'Av. Beira Mar n. 1256', 'Florianópolis', '30077500',
'SC', '12736571/2347', null);

insert into cliente 
  values (260, 'Susana', 'Rua Lopes Mendes 12', 'Niterói', '30046500', 'RJ',
'21763571/232-9', '2530');

insert into cliente 
  values (290, 'Renato', 'Rua Meireles n. 123 bl. sl.345', 'São Paulo',
'30225900', 'SP', '13276547/213-3', '9071');

insert into cliente 
  values (390, 'Sebastião', 'Rua da Igreja n.10', 'Uberaba', '30438700', 'MG',
'32176547/213-3', '9071');

insert into cliente 
  values (234, 'José', 'Quadra 3 bl. 3 sl. 1003', 'Brasilia', '22841650', 'DF',
'21763576/1232-3', '2931');

insert into cliente 
  values (500, 'Rodolfo', 'Largo do São Francisco 27 sobrado', 'São Paulo', '82679330', 'SP', '6248125/3321-7', '1290');

--inserido dados na tabela Vendedor

insert into vendedor
  values (209, 'José', 1800.00, 'C', null);

insert into vendedor
  values (111, 'Carlos', 2490.00, 'A', null);

insert into vendedor
  values (11, 'João', 2780.00, 'C', null);

insert into vendedor
  values (240, 'Antônio', 9500.00, 'C', null);

insert into vendedor
  values (720, 'Felipe', 4600.00, 'A', null);

insert into vendedor
  values (213, 'Jonas', 2300.00, 'A', null);

insert into vendedor
  values (101, 'João', 2650.00, 'C', null);

insert into vendedor
  values (310, 'Josias', 870.00, 'B', null);

insert into vendedor
  values (250, 'Maurício', 2930.00, 'B', null);

--Inserido dados na tabela Pedido
--Nota: So podemos inserir dados nesta tabela, depois de inserir dados nas
--tabelas Cliente e Vendedor

insert into pedido
  values (121,20,410,209, null, '24/09/2017');

insert into pedido
  values (120,20,410,209, null, '24/01/2017');

insert into pedido
  values (122,20,410,209, null, '24/02/2017');

insert into pedido
  values (123,20,410,209, null, '24/03/2017');

insert into pedido
  values (124,20,410,209, null, '24/04/2017');

insert into pedido
  values (125,20,410,209, null, '24/05/2017');

insert into pedido
  values (126,20,410,209, null, '24/06/2017');

insert into pedido
  values (147,20,410,209, null, '24/07/2017');

insert into pedido
  values (128,20,410,209, null, '24/08/2017');

insert into pedido
  values (129,20,410,209, null, '24/10/2017');

insert into pedido
  values (130,20,410,209, null, '24/11/2017');

insert into pedido
  values (131,20,410,209, null, '24/12/2017');

insert into pedido
  values (97,20,720,101, null, '24/09/2017');

insert into pedido
  values (101,15,720,101, null, '12/03/2019');

insert into pedido
  values (137,20,720,720, null, '27/11/2018');

insert into pedido
  values (250,20,720,720, null, '27/01/2018');

insert into pedido
  values (251,20,720,720, null, '27/02/2018');

insert into pedido
  values (252,20,720,720, null, '27/03/2018');

insert into pedido
  values (253,20,720,720, null, '27/04/2018');

insert into pedido
  values (254,20,720,720, null, '27/05/2018');

insert into pedido
  values (255,20,720,720, null, '27/06/2018');

insert into pedido
  values (256,20,720,720, null, '27/07/2018');

insert into pedido
  values (257,20,720,720, null, '27/08/2018');

insert into pedido
  values (258,20,720,720, null, '27/09/2018');

insert into pedido
  values (259,20,720,720, null, '27/10/2018');

insert into pedido
  values (260,20,720,720, null, '27/12/2018');




insert into pedido
  values (148,20,720,101, null, '08/07/2018');

insert into pedido
  values (189,15,870,213, null, '14/03/2019');

insert into pedido
  values (104,30,110,101, null, '19/08/2018');

insert into pedido
  values (203,30,830,250, null, '01/02/2018');

insert into pedido
  values (98,20,410,209, null, '06/04/2019');

insert into pedido
  values (143,30,20,111, null, '12/03/2019');

insert into pedido
  values (105,15,180,240, null,'03/11/2018');

insert into pedido
  values (111,20,260,240, null,'04/07/2017');

insert into pedido
  values (103,20,260,240, null,'01/02/2018');

insert into pedido
  values (91,20,260,11, null,'01/02/2018');

insert into pedido
  values (138,20,260,11, null,'01/02/2018');

insert into pedido
  values (108,15,290,310, null,'01/02/2018');

insert into pedido
  values (119,30,390,250, null,'01/02/2018');

insert into pedido
  values (127,10,410,11, null,'01/02/2019');

insert into pedido
  values (270,5,180,310, null,'15/09/2019');

insert into pedido
  values (200,5,180,310, null,'05/09/2019');

insert into pedido
  values (201,5,260,240, null,'06/09/2019');

insert into pedido
  values (271,7,260,240, null,'01/02/2019');

insert into pedido
  values (272,7,260,240, null,'01/01/2019');

insert into pedido
  values (273,7,260,240, null,'01/03/2019');

insert into pedido
  values (274,7,260,240, null,'01/04/2019');

insert into pedido
  values (275,7,260,240, null,'01/05/2019');

insert into pedido
  values (276,7,260,240, null,'01/06/2019');

insert into pedido
  values (277,7,260,240, null,'01/07/2019');

insert into pedido
  values (278,7,260,240, null,'01/08/2019');

insert into pedido
  values (279,7,260,240, null,'01/09/2019');

insert into pedido
  values (280,7,260,240, null,'01/10/2019');

insert into pedido
  values (281,7,260,240, null,'01/11/2019');

insert into pedido
  values (282,7,260,240, null,'01/12/2019');




--Inserido dados na tabela Produto

insert into produto
  values (25,'Kg','Queijo',5.97, null, null, null, null);

insert into produto
  values (31,'BAR','Chocolate',5.87, null, null, null, null);

insert into produto
  values (78,'L','Vinho', 7, null, null, null, null);

insert into produto
  values (22,'M','Tecido',5.11, null, null, null, null);

insert into produto
  values (30,'SAC','Açúcar',5.30, null, null, null, null);

insert into produto
  values (53,'M','Linha',6.80, null, null, null, null);

insert into produto
  values (13,'G','Ouro',11.18, null, null, null, null);

insert into produto
  values (45,'M','Madeira',5.25, null, null, null, null);

insert into produto
  values (87,'M','Cano',6.97, null, null, null, null);

insert into produto
  values (77,'M','Papel',6.05, null, null, null, null);

insert into produto
  values (79,'G','Papelão',3.15, null, null, null, null);

insert into produto
  values (81,'SAC','Cimento',23.00, null, null, null, null);




--Inserido dados na tabela Item_Pedido
--Nota: So podemos inserir dados nesta tabela, depois de inserir dados nas
--tabelas Pedido e Produto*/

insert into item_pedido
  values (120,77,18, null, null);

insert into item_pedido
  values (121,77,19, null, null);

insert into item_pedido
  values (122,79,20, null, null);

insert into item_pedido
  values (123,81,25, null, null);

insert into item_pedido
  values (124,77,26, null, null);

insert into item_pedido
  values (125,77,27, null, null);

insert into item_pedido
  values (126,79,30, null, null);

insert into item_pedido
  values (127,81,29, null, null);

insert into item_pedido
  values (128,77,28, null, null);

insert into item_pedido
  values (129,77,27, null, null);

insert into item_pedido
  values (130,79,26, null, null);

insert into item_pedido
  values (131,81,11, null, null);



insert into item_pedido
  values (250,77,18, null, null);

insert into item_pedido
  values (251,77,18, null, null);

insert into item_pedido
  values (252,79,18, null, null);

insert into item_pedido
  values (253,81,18, null, null);

insert into item_pedido
  values (254,77,18, null, null);

insert into item_pedido
  values (255,77,18, null, null);

insert into item_pedido
  values (256,79,18, null, null);

insert into item_pedido
  values (257,81,18, null, null);

insert into item_pedido
  values (258,77,18, null, null);

insert into item_pedido
  values (259,81,18, null, null);






insert into item_pedido
  values (270,81,18, null, null);

insert into item_pedido
  values (270,77,18, null, null);

insert into item_pedido
  values (271,79,18, null, null);

insert into item_pedido
  values (272,81,18, null, null);

insert into item_pedido
  values (273,77,18, null, null);

insert into item_pedido
  values (274,77,18, null, null);

insert into item_pedido
  values (275,79,18, null, null);

insert into item_pedido
  values (276,81,18, null, null);

insert into item_pedido
  values (277,77,18, null, null);

insert into item_pedido
  values (278,81,18, null, null);

insert into item_pedido
  values (279,81,18, null, null);

insert into item_pedido
  values (280,81,18, null, null);

insert into item_pedido
  values (281,81,18, null, null);

insert into item_pedido
  values (282,81,18, null, null);

insert into item_pedido
  values (282,77,18, null, null);

insert into item_pedido
  values (280,77,18, null, null);

insert into item_pedido
  values (279,31,18, null, null);





insert into item_pedido
  values (101,78,18, null, null);

insert into item_pedido
  values (101,13,5, null, null);

insert into item_pedido
  values (98,77,5, null, null);

insert into item_pedido
  values (148,45,8, null, null);

insert into item_pedido
  values (148,31,7, null, null);

insert into item_pedido
  values (148,77,3, null, null);

insert into item_pedido
  values (148,25,10, null, null);

insert into item_pedido
  values (148,78,30, null, null);

insert into item_pedido
  values (104,53,32, null, null);

insert into item_pedido
  values (203,31,6, null, null);

insert into item_pedido
  values (189,78,45, null, null);

insert into item_pedido
  values (143,31,20, null, null);

insert into item_pedido
  values (105,78,10, null, null);

insert into item_pedido
  values (111,25,10, null, null);

insert into item_pedido
  values (111,78,70, null, null);

insert into item_pedido
  values (103,53,37, null, null);

insert into item_pedido
  values (91,77,40, null, null);

insert into item_pedido
  values (138,22,10, null, null);

insert into item_pedido
  values (138,77,35, null, null);

insert into item_pedido
  values (138,53,18, null, null);

insert into item_pedido
  values (108,13,17, null, null);

insert into item_pedido
  values (119,77,40, null, null);

insert into item_pedido
  values (119,13,6, null, null);

insert into item_pedido
  values (119,22,10, null, null);

insert into item_pedido
  values (119,53,43, null, null);

insert into item_pedido
  values (137,13,8, null, null);

insert into item_pedido
  values (200,22,10, null, null);

insert into item_pedido
  values (200,13,43, null, null);

insert into item_pedido
  values (201,79,10, null, null);

insert into item_pedido
  values (201,81,45, null, null);

-- Fim inserts 

-- Confirmando alterações 

commit;
----------------------------------------------------------------------------------------------------------------------------
--5a)Monte uma consulta SQL para trazer os códigos e nomes dos clientes (tabela cliente) e vendedores (vendedor). Utilize o operador UNION. 

select codigo_cliente as "Codigos", nome_cliente "Nomes" from cliente
union
select codigo_vendedor, nome_vendedor from vendedor


--5b)Desenvolva uma consulta SQL que traga a descrição dos produtos que estão inseridos tanto na tabela produto quanto na tabela item_pedido. Utilize o operador INTERSECT. 
select descricao from produto
where codigo_produto in (select codigo_produto from produto
                         intersect
	                     select codigo_produto from item_pedido
                        )
