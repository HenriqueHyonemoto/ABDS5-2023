------Banco de dados acadêmico -----------------------

CREATE TABLE Instrutor (
  inst_codigo numeric(5)   NOT NULL ,
  inst_nome varchar(40)    ,
  inst_telefone varchar(15)    ,
  inst_dataadmissao DATE      ,
PRIMARY KEY(inst_codigo));


/*Inserindo Instrutores */
insert into Instrutor
 values (1, 'Maria Carolina', '344-8788', '1/2/2017');
  
insert into Instrutor
  values (2, 'Pedro Paula', '274-9018', '8/3/2016');
  
insert into Instrutor
  values (3, 'Augusto Lemos', '722-1300', '12/11/2017');
  
insert into Instrutor
  values (4, 'Monica Silveira', '212-7938', '30/11/2017');

commit;


----Tabela Curso ---------------

CREATE TABLE Curso (
  cur_Cod numeric(5)   NOT NULL ,
  cur_Nome VARCHAR(40)    ,
  cur_CargaHoraria numeric(5,2)    ,
  cur_ValorCurso numeric(7,2)    ,
  cur_PreRequisito numeric(5)      ,
PRIMARY KEY(cur_Cod));


/*Inserindo curso */
insert into Curso
 values (1, 'Introducao a Logica de Programação', 32, 800, null); 
insert into Curso
 values (2, 'Fundamentos de Modelagem de Dados', 40, 950, null); 
insert into Curso
 values (3, 'Redes I',40 ,1200 , null); 
insert into Curso
 values (4, 'Introducao a Sistemas Operacionais', 32 ,670 , null); 
insert into Curso
 values (5, 'Análise Orientada por Objetos',40 ,890 , null);
insert into Curso
 values (6, 'Delphi:Recurso Basicos', 24,400 , 1);
insert into Curso
 values (7, 'Delphi: Acesso a Banco de Dados',24 ,400, 1);
insert into Curso
 values (8, 'Oracle:SQL*PLUS e SQL', 32,750 , null);
insert into Curso
 values (9, 'Oracle:PL/SQL', 24, 750, null);
insert into Curso
 values (10, 'Redes II', 32,1000 , 3);


CREATE TABLE Aluno (
  alu_Matricula numeric(5)   NOT NULL ,
  alu_Nome varchar(40)    ,
  alu_Tel varchar(15)    ,
  alu_Ender varchar(40)    ,
  alu_Cidade varchar(30)    ,
  alu_UF CHAR(2)    ,
  alu_DataNascimento DATE      ,
PRIMARY KEY(alu_Matricula));


/*Inserindo Alunos */
insert into Aluno
 values (1, 'Marcos Silva Hydra', '3474-2318', 'R. Adolfo Lutz, 27/902', 'São Paulo', 'SP', '10/03/2003');
insert into Aluno
 values (2, 'Otávio Ramos Oliveira', '399-1490', 'R. Albert Einsten, 13', 'Votuporanga', 'SP', '12/05/2003');
insert into Aluno
 values (3, 'Wellington Machado', '655-1138', 'Av. do Contorno', 'Linhares', 'ES', '10/08/2004');
insert into Aluno
 values (4, 'Tadeu Mauro Alencar', '311-4671', 'T. Orquideas', 'Barbacena', 'MG' ,'05/02/2004');
insert into Aluno
 values (5, 'Luis Firmino Rios', '211-6600', 'Av. Conceicao Silva', 'Uberaba', 'MG', '19/07/2005');
 insert into Aluno
 values (6, 'Ademar Silveira Barros', '6588-6600', 'Rua das Acácias', 'Votuporanga', 'SP', '27/11/2005');


commit;




CREATE TABLE Turma (
  tur_CodTur numeric(5)   NOT NULL ,
  tur_CodigoCurso numeric(5)   NOT NULL ,
  tur_CodigoInstrutor numeric(5)   NOT NULL ,
  tur_PrecoHoraTur NUMERIC(4,2)    ,
  tur_SalaTur INTEGER      ,
PRIMARY KEY(tur_CodTur),
  FOREIGN KEY(tur_CodigoCurso)  REFERENCES Curso,
  FOREIGN KEY(tur_CodigoInstrutor)  REFERENCES Instrutor);


/*Inserindo Turmas*/
insert into Turma
 values (1,1,1,20,2);
insert into Turma
 values (2,1,2,20,5);
insert into Turma
 values (3,2,3,25,4);
insert into Turma
 values (4,3,4,20,4);
insert into Turma
 values (5,3,3,20,6);
insert into Turma
 values (7,7,3,25,1);
insert into Turma
 values (8,5,4,40,8);

commit;

CREATE TABLE Historico (
  hist_Matriculaaluno numeric(5)   NOT NULL ,
  hist_CodigoTurma numeric(5)   NOT NULL ,
  hist_NotaBim1 numeric(3,1)    ,
  hist_NotaBim2 numeric(3,1)    ,
  hist_Presenca numeric(3,1)      ,
PRIMARY KEY(hist_Matriculaaluno, hist_CodigoTurma),
  FOREIGN KEY(hist_Matriculaaluno)   REFERENCES Aluno,
  FOREIGN KEY (hist_CodigoTurma) REFERENCES Turma);


/*Inserindo Historico*/
insert into Historico
 values (1,1,7.5, 7.0, 50);
insert into Historico
 values (5,2,7, 6.0, 70);
insert into Historico
 values (1,5,6, 6.0, 80);
insert into Historico
 values (1,4,9, 8.5, 75);
insert into Historico
 values (4,2,3, 4.0, 90);
insert into Historico
 values (3,2,5.5, 5.5, 80);

commit;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--4)Monte a consulta em SQL para um relatório que traga os nomes dos instrutores que não são homônimos dos alunos (usando o Except). 

select inst_nome from instrutor
except
select alu_nome from aluno