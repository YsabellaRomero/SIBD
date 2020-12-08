.mode columns
.headers on

PRAGMA foreign_keys = ON;

----------------------------------------------------Tables Dropped--------------------------------------------------------
drop table if exists Descricao;
drop table if exists Aula;
drop table if exists Treino_Individual;
drop table if exists Treino;
drop table if exists Contacto;
drop table if exists Pesquisa;
drop table if exists Instalacao;
drop table if exists Informacao;
drop table if exists Dados_Utilizador;
drop table if exists Pessoa;
--------------------------------------------------------------------------------------------------------------------------

create table Pessoa(
	NIF integer primary key autoincrement,
	name text not null,
	address text not null,
	numero_telemovel integer
);

create table Dados_Utilizador(
	numero_conta integer unique primary key autoincrement,
	email text not null,
	password text not null
);

create table Informacao(
	NIF integer references Pessoa,
	numero_conta integer references Dados_Utilizador,
	primary key(NIF)
);

create table Instalacao(
	localizacao text not null primary key
);

create table Pesquisa(
	numero_conta integer references Informacao,
	localizacao text references Instalacao,
	primary key(numero_conta)
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
	treinador text not null,
	hora_inicio integer,
	hora_fim integer check(strftime('%s', hora_fim) > strftime('%s', hora_inicio)),
	primary key(ID)
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


-----------------------------------------------------SÓCIOS--------------------------------------------------------------
--insert into Pessoa(NIF, name, address, numero_telemovel) values (247330353, 'Ana Romero', 'Residencia', 926379613);
--insert into Pessoa(NIF, name, address, numero_telemovel) values (237827193, 'Martim Dias', 'Ali', 9182493920);
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
insert into Instalacao(localizacao) values ('Alameda');
insert into Instalacao(localizacao) values ('Benfica');
insert into Instalacao(localizacao) values ('Coimbra');
-------------------------------------------------------------------------------------------------------------------------



-----------------------------------------------------CONTACTOS-------------------------------------------------------------------------------------------------------------------------
insert into Contacto(email, numero_telemovel, diretor, gerente, localizacao) values ('m.y.spaceboavista@gmail.com', 912345678, 'Joana Vieira', 'Pedro Santos', 'Boavista');
insert into Contacto(email, numero_telemovel, diretor, gerente, localizacao) values ('m.y.spacematosinhos@gmail.com', 912345677, 'Henrique Vieira', 'António Pedro', 'Matosinhos');
insert into Contacto(email, numero_telemovel, diretor, gerente, localizacao) values ('m.y.spacebraga@gmail.com', 912345676, 'Manuel Oliveira', 'Sandra Dias', 'Braga');
insert into Contacto(email, numero_telemovel, diretor, gerente, localizacao) values ('m.y.spacealameda@gmail.com', 912345675, 'Bárbara Rodrigues', 'Maria Abreu','Alameda');
insert into Contacto(email, numero_telemovel, diretor, gerente, localizacao) values ('m.y.spacebenfica@gmail.com', 912345674, 'Roberto Silva', 'Orlando Monteiro','Benfica');
insert into Contacto(email, numero_telemovel, diretor, gerente, localizacao) values ('m.y.spacecoimbraa@gmail.com', 912345673, 'Hélder Santos', 'José Ribeiro', 'Coimbra');
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
