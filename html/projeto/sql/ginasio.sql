.mode columns
.headers on

PRAGMA foreign_keys = ON;
----------------------------------------------------Tables Dropped--------------------------------------------------------
drop table if exists Treinador_Aula;
drop table if exists Descricao;
drop table if exists Aula;
drop table if exists Treinador_Treino_Individual;
drop table if exists Treino_Individual;
drop table if exists Treino;
drop table if exists Contacto;
drop table if exists Pesquisa;
drop table if exists Instalacao;
drop table if exists Treinador;
drop table if exists Socio;
drop table if exists Pessoa;
--------------------------------------------------------------------------------------------------------------------------

create table Pessoa(
	numero_conta integer unique primary key autoincrement,
	NIF integer,
	name text not null,
	numero_telemovel integer
);

create table Socio(
	ID integer references Pessoa,
	password text,
	primary key(ID)
);

create table Treinador(
	ID integer references Pessoa,
	primary key(ID)
);

create table Instalacao(
	localizacao text not null primary key
);

create table Pesquisa(
	num_socio integer references Socio,
	localizacao text references Instalacao,
	primary key(num_socio)
);

create table Contacto(
	email text not null primary key,
	numero_telemovel integer not null,
	diretor text not null,
	gerente text not null,
	localizacao text not null references Instalacao
);

create table Treino(
	ID text primary key,
	dia text not null check(dia >= 1) check(dia <= 31),
	localizacao text references Instalacao
);

create table Treino_Individual(
	ID text references Treino,
	hora_inicio integer,
	hora_fim integer check(strftime('%s', hora_fim) > strftime('%s', hora_inicio)),
	primary key(ID)
);

create table Treinador_Treino_Individual(
	ID_treino text references Treino_Individual,
	ID_treinador integer references Treinador,
	primary key(ID_treino)
);

create table Aula(
	ID text references Treino,
	modalidade text not null,
	espaco text not null,
	primary key(ID)
);

create table Descricao(
	aula text references Aula,
	treinador text not null,
	vagas integer check(vagas <= 20),
	hora_inicio integer,
	hora_fim integer check(strftime('%s', hora_fim) > strftime('%s', hora_inicio)),
	primary key(aula)
);

create table Treinador_Aula(
	aula text references Descricao,
	ID_treinador integer references Treinador,
	primary key(aula)
);

-------------------------------------------------------PESSOAS-------------------------------------------------------------
-------------------------------------------------------sócios------------------------------------------------------------
insert into Pessoa(numero_conta, NIF, name, numero_telemovel) values (000001, 123456789, 'Ysabella Romero', 987654321);
insert into Pessoa(numero_conta, NIF, name, numero_telemovel) values (000002, 123456788, 'Maria Sanches', 987654322);
insert into Pessoa(numero_conta, NIF, name, numero_telemovel) values (000003, 123456787, 'Heber Ribeiro', 987654322);
insert into Pessoa(numero_conta, NIF, name, numero_telemovel) values (000004, 123456786, 'Simao Quintans', 987654322);
insert into Pessoa(numero_conta, NIF, name, numero_telemovel) values (000005, 123456785, 'Francisco Alves', 987654322);
insert into Pessoa(numero_conta, NIF, name, numero_telemovel) values (000006, 123456784, 'Alexandre Brás', 987654322);
insert into Pessoa(numero_conta, NIF, name, numero_telemovel) values (000007, 123456783, 'Bruna Abreu', 987654322);
insert into Pessoa(numero_conta, NIF, name, numero_telemovel) values (000008, 123456782, 'Leonor Machado', 987654322);
-------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------treinadores---------------------------------------------------------
insert into Pessoa(numero_conta, NIF, name, numero_telemovel) values (000011, 123456789, 'Francisco Monteiro', 987654311);
insert into Pessoa(numero_conta, NIF, name, numero_telemovel) values (000012, 123456788, 'Carolina Marques', 987654312);
insert into Pessoa(numero_conta, NIF, name, numero_telemovel) values (000013, 123456787, 'Loureço Pestana', 987654312);
insert into Pessoa(numero_conta, NIF, name, numero_telemovel) values (000014, 123456786, 'David Maia', 987654312);
insert into Pessoa(numero_conta, NIF, name, numero_telemovel) values (000015, 123456785, 'Carolina Marques', 987654312);
insert into Pessoa(numero_conta, NIF, name, numero_telemovel) values (000016, 123456784, 'Hugo Santos', 987654312);
insert into Pessoa(numero_conta, NIF, name, numero_telemovel) values (000017, 123456783, 'André Melim', 987654312);
insert into Pessoa(numero_conta, NIF, name, numero_telemovel) values (000018, 123456782, 'Carlos Pinto', 987654312);
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------



----------------------------------------------DADOS DE CADA UTILIZADOR---------------------------------------------------
--insert into Dados_Utilizador(numero_conta, email, password) values (201706655, 'ysabellaromero5@gmail.com', '123cenas');
--insert into Dados_Utilizador(numero_conta, email, password) values (201783929, 'martim_dias@gmail.com', '123lalala');
-------------------------------------------------------------------------------------------------------------------------



-----------------------------------------------PESQUISA DA INFORMAÇAO----------------------------------------------------
--insert into Informacao(NIF, numero_conta) values (247330353, 201706655);
--insert into Informacao(NIF, numero_conta) values (237827193, 201783929);
-------------------------------------------------------------------------------------------------------------------------



-----------------------------------------------------INSTALAÇÕES---------------------------------------------------------
insert into Instalacao(localizacao) values ('Boavista');
insert into Instalacao(localizacao) values ('Matosinhos');
insert into Instalacao(localizacao) values ('Braga');
-------------------------------------------------------------------------------------------------------------------------



-----------------------------------------------------CONTACTOS-------------------------------------------------------------------------------------------------------------------------
insert into Contacto(email, numero_telemovel, diretor, gerente, localizacao) values ('m.y.spaceboavista@gmail.com', 912345678, 'Joana Vieira', 'Pedro Santos', 'Boavista');
insert into Contacto(email, numero_telemovel, diretor, gerente, localizacao) values ('m.y.spacematosinhos@gmail.com', 912345677, 'Henrique Vieira', 'António Pedro', 'Matosinhos');
insert into Contacto(email, numero_telemovel, diretor, gerente, localizacao) values ('m.y.spacebraga@gmail.com', 912345676, 'Manuel Oliveira', 'Sandra Dias', 'Braga');
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
