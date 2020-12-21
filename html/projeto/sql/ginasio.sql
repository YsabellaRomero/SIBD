.mode columns
.headers on

PRAGMA foreign_keys = ON;
----------------------------------------------------Tables Dropped--------------------------------------------------------
drop table if exists Ocorrencia;
drop table if exists Modalidade;
drop table if exists Aula;
drop table if exists Treino_Individual;
drop table if exists Treino;
drop table if exists Contacto;
drop table if exists Treinador;
drop table if exists Socio;
drop table if exists Instalacao;
drop table if exists Pessoa;
--------------------------------------------------------------------------------------------------------------------------

create table Pessoa(
	NIF integer not null primary key,
	name text not null,
	numero_telemovel integer,
	email text not null
);

create table Socio(
	numero_conta integer unique primary key,
	NIF integer references Pessoa,
	instalacao integer not null references Instalacao,
	password text
);

create table Treinador(
	id_gym integer unique primary key,
	NIF integer references Pessoa
);

create table Instalacao(
	id integer not null primary key,
	localizacao text not null
);

create table Contacto(
	numero_telemovel integer primary key,
	email text not null,
	diretor text not null,
	gerente text not null,
	instalacao integer not null references Instalacao
);

create table Treino(
	ID integer primary key,
	dia text not null check(dia >= 1) check(dia <= 31),
	localizacao integer references Instalacao
);

create table Treino_Individual(
	ID integer primary key,
	ref_treino integer references Treino,
	treinador integer references Treinador,
	hora_inicio integer,
	hora_fim integer check(strftime('%s', hora_fim) > strftime('%s', hora_inicio))
);

create table Aula(
	ID integer primary key,
	ref_treino integer references Treino,
	treinador integer references Treinador
);

create table Modalidade(
	nome text primary key,
	ref_aula integer references Aula
);

create table Ocorrencia(
	ID_aula integer references Aula,
	modalidade text references Modalidade,
	espaco text not null,
	vagas integer check(vagas <= 20 AND vagas >= 0),
	hora_inicio integer,
	hora_fim integer check(strftime('%s', hora_fim) > strftime('%s', hora_inicio)),
	primary key(ID_aula)
);


-----------------------------------------------------INSTALAÇÕES---------------------------------------------------------
insert into Instalacao(id, localizacao) values (123, 'Boavista');
insert into Instalacao(id, localizacao) values (122, 'Matosinhos');
insert into Instalacao(id, localizacao) values (121, 'Braga');
-------------------------------------------------------------------------------------------------------------------------



-----------------------------------------------------CONTACTOS-------------------------------------------------------------------------------------------------------------------------
insert into Contacto(email, numero_telemovel, diretor, gerente, instalacao) values ('m.y.spaceboavista@gmail.com', 912345678, 'Joana Vieira', 'Pedro Santos', 123);
insert into Contacto(email, numero_telemovel, diretor, gerente, instalacao) values ('m.y.spacematosinhos@gmail.com', 912345677, 'Henrique Vieira', 'António Pedro', 122);
insert into Contacto(email, numero_telemovel, diretor, gerente, instalacao) values ('m.y.spacebraga@gmail.com', 912345676, 'Manuel Oliveira', 'Sandra Dias', 121);
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



-------------------------------------------------------PESSOAS------------------------------------------------------------------------------
-------------------------------------------------------sócios-------------------------------------------------------------------------------
insert into Pessoa(NIF, name, numero_telemovel, email) values (123456789, 'Ysabella Romero', 987654321, 'ysabellaromero@my_space.com');
insert into Pessoa(NIF, name, numero_telemovel, email) values (123456788, 'Maria Sanches', 987654322, 'mariasanches@my_space.com');
insert into Pessoa(NIF, name, numero_telemovel, email) values (123456787, 'Heber Ribeiro', 987654323, 'heberribeiro@my_space.com');
insert into Pessoa(NIF, name, email)									 values (123456786, 'Simao Quintans', 'simaoquintans@my_space.com');
insert into Pessoa(NIF, name, email) 									 values (123456785, 'Francisco Alves', 'franciscoalves@my_space.com');
insert into Pessoa(NIF, name, numero_telemovel, email) values (123456784, 'Alexandre Brás', 987654324, 'alexandrebras@my_space.com');
insert into Pessoa(NIF, name, email) 									 values (123456783, 'Bruna Abreu', 'brunabreu@my_space.com');
insert into Pessoa(NIF, name, numero_telemovel, email) values (123456782, 'Leonor Machado', 987654325, 'leonormachado@my_space.com');
insert into Pessoa(NIF, name, email) 									 values (123456781, 'Diana Santos', 'dianasantos@my_space.com');
--------------------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------treinadores----------------------------------------------------------------------------
insert into Pessoa(NIF, name, numero_telemovel, email) values (123456779, 'Francisco Monteiro', 987654311, 'franciscomonteiro@my_space.com');
insert into Pessoa(NIF, name, numero_telemovel, email) values (123456778, 'Carolina Marques', 987654312, 'carolinamarques@my_space.com');
insert into Pessoa(NIF, name, numero_telemovel, email) values (123456777, 'Loureço Pestana', 987654313, 'lourencopestana@my_space.com');
insert into Pessoa(NIF, name, numero_telemovel, email) values (123456776, 'David Maia', 987654314, 'davidmaia@my_space.com');
insert into Pessoa(NIF, name, numero_telemovel, email) values (123456775, 'Sandra Moniz', 987654315, 'sandramoniz@my_space.com');
insert into Pessoa(NIF, name, numero_telemovel, email) values (123456774, 'Kseniya Nialepka', 987654316, 'kseniyanialepka@my_space.com');
insert into Pessoa(NIF, name, numero_telemovel, email) values (123456773, 'André Melim', 987654317, 'andremelim@my_space.com');
insert into Pessoa(NIF, name, numero_telemovel, email) values (123456772, 'Carlos Pinto', 987654318, 'carlospinto@my_space.com');
insert into Pessoa(NIF, name, numero_telemovel, email) values (123456771, 'Nuno Freitas', 987654319, 'nunofreitas@my_space.com');
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------



-------------------------------------------------------SÓCIOS------------------------------------------------------------
insert into Socio(numero_conta, NIF, instalacao) values (000001, 123456789, 123);
insert into Socio(numero_conta, NIF, instalacao) values (000002, 123456788, 122);
insert into Socio(numero_conta, NIF, instalacao) values (000003, 123456787, 121);
insert into Socio(numero_conta, NIF, instalacao) values (000004, 123456786, 123);
insert into Socio(numero_conta, NIF, instalacao) values (000005, 123456785, 122);
insert into Socio(numero_conta, NIF, instalacao) values (000006, 123456784, 121);
insert into Socio(numero_conta, NIF, instalacao) values (000007, 123456783, 123);
insert into Socio(numero_conta, NIF, instalacao) values (000008, 123456782, 122);
insert into Socio(numero_conta, NIF, instalacao) values (000009, 123456781, 121);
-------------------------------------------------------------------------------------------------------------------------



-----------------------------------------------------TREINADORES---------------------------------------------------------
insert into Treinador(id_gym, NIF) values (000011, 123456779);
insert into Treinador(id_gym, NIF) values (000012, 123456778);
insert into Treinador(id_gym, NIF) values (000013, 123456777);
insert into Treinador(id_gym, NIF) values (000014, 123456776);
insert into Treinador(id_gym, NIF) values (000015, 123456775);
insert into Treinador(id_gym, NIF) values (000016, 123456774);
insert into Treinador(id_gym, NIF) values (000017, 123456773);
insert into Treinador(id_gym, NIF) values (000018, 123456772);
insert into Treinador(id_gym, NIF) values (000019, 123456771);
-------------------------------------------------------------------------------------------------------------------------
