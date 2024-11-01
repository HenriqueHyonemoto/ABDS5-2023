--1)Crie o modelo físico das relações 
--correntista = {cpf, nome, data_nasc, cidade, uf} 
--conta_corrente {num_conta, cpf_correntista (fk), saldo}. 
--drop table correntista
create table correntista(
	cpf varchar(11) unique,
	nome varchar(40),
	data_nasc date,
	cidade varchar(40),
	uf char(2)	,
constraint pk_cpf primary key(cpf)	
)
--drop table conta_corrente
create table conta_corrente(
	num_conta integer,
	cpf_correntista varchar(11),
	saldo numeric,
	constraint pk_num_conta primary key (num_conta),
	constraint fk_cpf_correntista foreign key (cpf_correntista) references correntista
)


--(a) Uma conta corrente só pode ser aberta com saldo mínimo inicial de R$ 500,00. 

alter table conta_corrente add constraint ck_saldo check(saldo>=500);

--(b) Os correntistas devem ser maiores que 18 anos. Para isso, você deve comparar a data de nascimento com a data atual. No Postgres, para saber a idade atual, use a função ((CURRENT_DATE - data_nasc)/365>=18) ou use a função (AGE(CURRENT_DATE, data_nasc) >= ’18 Y’)). 

alter table correntista add constraint ck_idade check ((current_date-data_nasc)/365>=18);

--Testes

--Funciona
insert into correntista values ('43523143289','turmeric','11/04/1998','sao paulo','sp');
--Não deve funcionar
insert into correntista values ('41523143289','rafa','11/04/2007','sao paulo','sp');

--Funciona
insert into conta_corrente values('1','43523143289',501);
--Não deve funcionar
insert into conta_corrente values('1','43523143289',300);