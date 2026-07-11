/* ============================================================
   Autor: Cristian Matias de Souza
   Empresa: ciruscom informatica
   Arquivo:  CriacaoTabela.sql
   Criado:   28/06/2026 18:58
   Banco: SQLDB_1
   Descrição: Criação de Tabelas do
   ============================================================ */
-- Criando tabelas
create table Alunos
(
    id_alunos int primary key not null,
    nome varchar(200),
    data_nascimento date not null ,
    sexo varchar(1),
    data_cadastro datetime,
    login_cadastro varchar(15)
);

-- Consultando tabela
select * from Alunos;

-- Apagando tabela
drop table Alunos;

create table Situacao
(
    id_situacao int primary key ,
    situacao varchar(25) not null ,
    data_cadastro datetime,
    login_cadastro varchar(15)
);

select * from Situacao;

create table Cursos
(
    id_curso int primary key not null,
    nome varchar(200) not null,
    data_cadastro datetime not null ,
    login_cadastro varchar(15) not null
);

select * from Cursos;


create table Turmas
(
    id_turma int primary key not null ,
    id_aluno int not null,
    id_curso int not null ,
    valor_turma numeric(15,2) not null ,
    desconto numeric(3,2) not null ,
    data_inicio date not null ,
    data_termino date ,
    data_cadastro datetime not null ,
    login_cadastro varchar(15)
);

select * from Turmas;

create table Registro_Presenca
(
    id_turma int not null ,
    id_aluno int not null ,
    id_situacao int not null ,
    data_presenca date not null ,
    data_cadastro date not null ,
    login_cadastro varchar(15) not null
);

select * from Registro_Presenca;

