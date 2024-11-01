--Agencia
create table agencia(
cod_age    integer not null,
nome_age   varchar(40),
cidade_age varchar(40),
fundos_age numeric(10,2),
constraint pk_agencia primary key (cod_age));


--Cliente
create table clientecor(
cod_cli    integer not null,
nome_cli   varchar(40),
rua_cli    varchar(40),
cidade_cli varchar(30),
constraint pk_clientecor primary key (cod_cli));

--Emprestimo 
create table emprestimo(
cod_age_emp	  integer not null,
numero_emp 	  varchar(10) not null,
valor_emp	  numeric(10,2),
constraint pk_emprestimo primary key (cod_age_emp, numero_emp));

alter table emprestimo add constraint fk_emp_agencia foreign key(cod_age_emp)
references agencia;

--Devedor 
create table devedor (
cod_cli_dev	    integer not null,
cod_age_emp_dev     integer not null,
numero_emp_dev	    varchar(10) not null,
constraint pk_devedor primary key (cod_cli_dev, cod_age_emp_dev,
numero_emp_dev));

alter table devedor add constraint fk_dev_cli 
  foreign key(cod_cli_dev) references clientecor;

alter table devedor add constraint fk_dev_emprest 
  foreign key(cod_age_emp_dev,numero_emp_dev) references emprestimo;

--Conta 
create table conta(
cod_age_con	integer not null,
numero_con	varchar(10) not null,
saldo_con	numeric(10,2),
constraint pk_conta primary key (cod_age_con,numero_con));

alter table conta add constraint fk_conta_agencia foreign key(cod_age_con) 
  references agencia;

--Depositante 
create table depositante(
cod_cli_dep	integer not null,
cod_age_con_dep	integer not null,
numero_con_dep	varchar(10) not null,
constraint pk_depositante primary
key(cod_cli_dep,cod_age_con_dep,numero_con_dep));

alter table depositante add constraint fk_dep_cli 
  foreign key(cod_cli_dep) references clientecor;

alter table depositante add constraint fk_dep_conta
  foreign key(cod_age_con_dep,numero_con_dep) references conta;

--INSERTS

--Agencia 

insert into agencia
values (1,'Macedônia','Macedônia', 500000); 

insert into agencia
values (2,'Vila Neri','São Carlos', 1600000); 

insert into agencia
values (3,'Anhagabahú','São Paulo', 5000000); 

insert into agencia
 values (4,'Centro','Araraquara', 300000); 

--Cliente 
insert into clientecor
values (1, 'Jones', 'Main','São Carlos');

insert into clientecor
values (2, 'Smith', 'North','Araraquara');

insert into clientecor
values (3, 'Turner', 'Putman','Votuporanga');

insert into clientecor
values (4, 'Adams', 'Spring', 'Araraquara');

insert into clientecor
values (5, 'Johnson', 'Alma', 'Palo Alto');

insert into clientecor
values (6, 'Hayes', 'Main', 'Harrison');

insert into clientecor
values (7, 'Williams', 'Nassau', 'Princeton');



--Conta 
insert into conta
values (1,'A-101',500);

insert into conta
values (2,'A-215',700);

insert into conta
values (3,'A-102',400);

insert into conta
values (4,'A-201',900);

insert into conta
values (4,'A-217',750);


--Depositante 
insert into depositante
values (5, 1,'A-101');

insert into depositante
values (2, 2,'A-215');

insert into depositante
values (6, 3,'A-102');

insert into depositante
values (5, 4, 'A-201');

insert into depositante
values (1, 4, 'A-217');

--Emprestimo 
insert into emprestimo
values (1,'L-17',1000);

insert into emprestimo
values (3,'L-15',1500);

insert into emprestimo
values (1,'L-14',1500);

insert into emprestimo
values (2,'L-93',500);

insert into emprestimo
values (3,'L-16',1300);

----Devedor 
insert into Devedor
values (1,1,'L-17');

insert into Devedor
values (6,3,'L-15');

insert into Devedor
values (7,2,'L-93');

insert into Devedor
values (1,3,'L-16');

insert into Devedor
values (4,3,'L-15');

------------------------------------------------------------------------------------------------------------------------------------------

--2)view sobre a tabela cliente com os campos nome_cliente, endereco e cidade: (faça insert into v_dados_cliente values (’Francisco Silva’, ’Rua das Araras’, ’Votuporanga’); 
--Perceba que houve erro, pois o código_cliente não estava presente na view. Apague a view (DROP TABLE) e recrie-a adicionando esse campo e tente inserir o cliente com o código 3210.

create view v_cliente as
select cod_cli,nome_cli,rua_cli from clientecor;

insert into v_cliente values (8,'NomeTesteVisao','Rua Das Ruas')

select * from v_cliente;