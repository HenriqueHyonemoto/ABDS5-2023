--1)Função que some os três parâmetros passados a ela: 
create or replace function f_soma(par1 numeric,par2 numeric,par3 numeric) returns numeric
as
$$
declare resultado numeric;
begin
resultado = par1+par2+par3;
return resultado;
end;
$$
language plpgsql;

select f_soma(5,3,7);

--2)Desenvolva uma função em que o usuário informe seu sexo por meio de parâmetro.
--Caso for M retorne ”Masculino”, se for F retorne ”Feminino”. Senão retorne ”Indefinido”:

create or replace function f_sexo(sexo char) returns text
as
$$
begin
if(sexo='m') then
return 'seu sexo é Masculino';
elseif (sexo='f') then
return 'seu sexo é Feminino';
else
return 'seu sexo é Outro';
end if;
end;
$$
language plpgsql;

select f_sexo('m')
select f_sexo('f')
select f_sexo('sus')



--3)Projete uma função que receba dois números como parâmetro e devolva a soma deles. 
--Realize a soma com o comando select (dica utilizar INTO). 

create or replace function f_soma2(par1 numeric, par2 numeric) returns numeric
as
$$
declare
soma numeric;
begin
select par1+par2 into soma;
return soma;
end;
$$
language plpgsql;

select f_soma2(4,4);

--Implemente um procedimento que receba 4 parâmetros. 
--Os dois primeiros serão números que sofrerão uma das quatro operações básicas da matemática adição, 
--subtração, multiplicação e divisão; o terceiro parâmetro será uma variável que armazenará 
--o resultado da operação e por fim, o quarto parâmetro indicará qual será a operação realizada. 
--Após implementar, teste o procedimento e veja se está funcionando corretamente.

create or replace function f_calculadora(par1 numeric, par2 numeric,par3 numeric,par4 char) returns numeric
as
$$
begin
if(par4 = '+')then
par3=par1+par2;
elsif(par4 = '-') then
par3=par1-par2;
elsif(par4 = '*' )then
par3=par1*par2;
elsif(par4 = '/')then
par3=par1/par2;
end if;
return par3;
end;
$$
language plpgsql;

select f_calculadora(4,4,0,'+'); -- =8
select f_calculadora(4,4,0,'-'); -- =0
select f_calculadora(4,4,0,'*'); -- =16
select f_calculadora(4,4,0,'/'); -- =1



