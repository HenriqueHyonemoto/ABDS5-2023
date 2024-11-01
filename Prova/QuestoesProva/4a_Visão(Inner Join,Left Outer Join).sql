--View


create table alunov (
id integer not null,
ra varchar(10) not null, 
nome varchar(40) not null, 
ender varchar(40) not null, 
cidade varchar(40) not null
);

create table aluno_grad (
id integer not null,
ano_curso varchar(20) not null
);

create table aluno_pos (
id integer not null,
orientador varchar(20)
);

create table cursa (
cursa_alu_id integer not null, 
cursa_alu_discip integer not null, 
cursa_nota1 numeric(6,2), 
cursa_nota2 numeric(6,2), 
cursa_nota3 numeric(6,2), 
cursa_nota4 numeric(6,2)
);

create table discip (
disc_id integer not null,
disc_codigo varchar(5) not null,
disc_descricao varchar(20)
);


insert into alunov
values (1, 'RA1', 'João', 'Rua A', 'Votuporanga');

insert into alunov
values (2, 'RA2', 'Pedro', 'Rua XX', 'Votuporanga');

insert into alunov
values (3, 'RA41', 'José', 'Rua YY', 'Macedônia');

insert into aluno_grad
values (2, 'ano3');

insert into aluno_grad
values (1, 'ano2');

insert into aluno_pos
values (3, 'Manoel');

insert into discip
values (1, 'D1', 'Banco de Dados');

insert into discip
values (2, 'D2', 'Estrutura de Dados');

insert into cursa
values (1, 1, 5,6,8,3);

insert into cursa
values (1, 2, 6,6,6,6);

insert into cursa
values (1, 3, 10,6,8,10);

insert into cursa
values (2, 1, 6,1,8,10);

insert into cursa
values (2, 2, 2,2,6,7.5);

--Inserindo tabelas para uso de sequencias

create table seq_funcionario (
id_func bigint,
cpf varchar(11),
nome varchar(40),
ender varchar(30),
cidade varchar(20),
salario numeric (8,2),
constraint pk_seq_funcionario primary key(id_func));

create table seq_salario_registro (
id_salreg bigint,
id_func bigint,
salario numeric(8,2),
data_aumento date,
constraint pk_seq_salario_registro  primary key(id_salreg),
constraint fk_seq_salario_registro_seq_funcionario foreign key(id_func)
			references seq_funcionario);
create sequence sid_func;


insert into seq_funcionario
values (nextval('sid_func'), '4321', 'João da Silva', 'Rua das flores,78',
				'Votuporanga', 65765.87);

insert into seq_funcionario
values (nextval('sid_func'), '4321', 'Maria da Silva', 'Rua das flores,78',
				'Votuporanga', 65765.87);


create sequence sid_salreg;

insert into seq_salario_registro
values (nextval('sid_salreg'), (select id_func from seq_funcionario
				where cpf = '1234'), 
			       (select salario from seq_funcionario
				where cpf = '1234'),
				current_date);

--Inserindo alunos repetidos para uso do Union all

insert into alunov
 values (7, 'Marcos', '8898-2318', 'R. Itália, 785', 'São Paulo', 'SP', '20/09/2009');

insert into alunov
 values (8, 'Marcos', '9213-2931', 'R. América, 432', 'Campinas', 'SP', '01/06/2010');

--Inserindo INSTRUTOR repetidos para uso do INTERSECT
insert into Instrutor
  values (5, 'Marcos', '711-9966', '17/09/2020');

-- Fim 

--1)Criar visão em que aparece somente os alunos de Votuporanga 
create view v_alunosVotu as
select nome from alunov where cidade = 'Votuporanga';

select * from v_alunosVotu;

--2)Crie uma visão para um relatório que informe o ra, nome e o ano dos alunos de graduação:

create view v_infograd as
select ra,nome,ano_curso from alunov alv
inner join aluno_grad alg
on alv.id = alg.id;

select * from v_infograd;
--3)Crie uma visão que informe os nome  es dos alunos de pós-graduação e os nomes de seus respectivos orientadores 
create view v_alg_ori as
select nome,orientador from alunov alv inner join
aluno_pos alp
on alv.id=alp.id

select * from v_alg_ori;

--4)Crie uma visão para um relatório que informe o nome dos alunos; se o aluno for de graduação, informe o ano; se for de pós, informe seu orientador. create view v_rel_aluno 
create view v_posgradinfo as
select nome, ano_curso, orientador from alunov alv
left outer join aluno_grad alg
on alv.id = alg.id
left outer join aluno_pos alp
on alv.id = alp.id;

select * from v_posgradinfo;
