create table obra(
	id_obra bigint,
	codigo varchar(4) unique,
	descricao varchar(30),
	constraint pk_id_obra primary key (id_obra)
);

create table maquina(
	id_maquina bigint,
	codigo varchar(4)unique,
	marca varchar(20),
	constraint pk_id_maquina primary key (id_maquina)
);

create table usa(
	id_usa bigint,
	id_obra bigint,
	id_maquina bigint,
	data_do_uso date,
	constraint pk_usa primary key (id_usa),
	constraint fk_id_obra foreign key (id_obra) references obra,
	constraint fk_id_maquina foreign key (id_maquina) references maquina 
);

create sequence sid_obra;
create sequence sid_maquina;
create sequence sid_usa;


insert into obra values (nextval('sid_obra'),'O001','Primeira Obra'),
                        (nextval('sid_obra'),'O002','Segunda Obra');
						
insert into maquina values (nextval('sid_maquina'),'M001','Primeira Maquina'),	
                           (nextval('sid_maquina'),'M002','Segunda Maquina');
						   


insert into usa values (nextval('sid_usa'),
					   (select id_obra from obra where codigo = 'O001'),
					   (select id_maquina from maquina where codigo = 'M001'),
					   '01/01/2001'),
					   
					   (nextval('sid_usa'),
					   (select id_obra from obra where codigo = 'O001'),
					   (select id_maquina from maquina where codigo = 'M002'),
					   '01/02/2001'),
					   
					   (nextval('sid_usa'),
					   (select id_obra from obra where codigo = 'O002'),
					   (select id_maquina from maquina where codigo = 'M001'),
					   '02/01/2001'),
					   
					   (nextval('sid_usa'),
					   (select id_obra from obra where codigo = 'O002'),
					   (select id_maquina from maquina where codigo = 'M002'),
					   '02/02/2001');

insert into usa values (nextval('sid_usa'),
					   (select id_obra from obra where codigo = 'O001'),
					   (select id_maquina from maquina where codigo = 'M002'),
					   '02/02/2001');
--3a) Uma visão que mostre a descrição da obra, a máquina utilizada e a data do uso. Ordene pela descrição da obra. 
create or replace view v_uso as
select descricao, marca, data_do_uso from obra ob
inner join usa us
on us.id_obra = ob.id_obra
inner join maquina maq
on maq.id_maquina = us.id_maquina
order by ob.descricao;

select * from v_uso;

--3b) Uma visão que mostre a descrição da obra e a quantidade de máquinas utilizadas. 
create or replace view v_contador as
select descricao , count(maq.codigo) from obra ob
inner join usa us
on ob.id_obra = us.id_obra
inner join maquina maq
on maq.id_maquina = us.id_maquina
group by 1;

select * from v_contador;

