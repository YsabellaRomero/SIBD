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
	dia integer not null check(dia >= 1) check(dia <= 7),
	id_gym integer references Treinador,
	localizacao integer references Instalacao
);

create table Treino_Individual(
	ID integer primary key,
	ref_treino integer references Treino,
	hora_inicio integer,
	hora_fim integer check(strftime('%s', hora_fim) > strftime('%s', hora_inicio))
);

create table Aula(
	ID integer primary key,
	ref_modalidade integer references Modalidade
);

create table Modalidade(
	nome text primary key,
	ref_treino integer references Treino
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



-------------------------------------------------------TREINOS----------------------------------------------------------
----------------------------------------------------Braga - aulas-------------------------------------------------------
insert into Treino(ID, dia, id_gym, localizacao) values(501, 1, 000011, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(502, 1, 000012, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(503, 1, 000013, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(504, 1, 000011, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(505, 1, 000012, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(506, 1, 000013, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(507, 1, 000011, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(508, 1, 000012, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(509, 2, 000013, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(510, 2, 000011, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(511, 2, 000012, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(512, 2, 000013, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(513, 2, 000011, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(514, 2, 000012, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(515, 2, 000013, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(516, 3, 000011, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(517, 3, 000012, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(518, 3, 000013, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(519, 3, 000011, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(520, 3, 000012, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(521, 3, 000013, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(522, 3, 000011, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(523, 4, 000012, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(524, 4, 000013, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(525, 4, 000011, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(526, 4, 000012, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(527, 4, 000013, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(528, 4, 000011, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(529, 4, 000012, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(530, 5, 000013, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(531, 5, 000011, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(532, 5, 000012, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(533, 5, 000013, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(534, 5, 000011, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(535, 5, 000012, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(536, 5, 000013, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(537, 6, 000011, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(538, 6, 000012, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(539, 6, 000013, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(540, 6, 000011, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(541, 6, 000012, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(542, 6, 000013, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(543, 6, 000011, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(544, 7, 000012, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(545, 7, 000013, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(546, 7, 000011, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(547, 7, 000012, 121);
------------------------------------------------------------------------------------------------------------------------
----------------------------------------------Braga - treino individual-------------------------------------------------

------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------Boavista - aulas-------------------------------------------------------
insert into Treino(ID, dia, id_gym, localizacao) values(201, 1, 000014, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(202, 1, 000015, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(203, 1, 000016, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(204, 1, 000014, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(205, 1, 000015, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(206, 1, 000016, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(207, 1, 000014, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(208, 1, 000015, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(209, 2, 000016, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(210, 2, 000014, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(211, 2, 000015, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(212, 2, 000016, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(213, 2, 000014, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(214, 2, 000015, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(215, 2, 000016, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(216, 3, 000014, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(217, 3, 000015, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(218, 3, 000016, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(219, 3, 000014, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(220, 3, 000015, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(221, 3, 000016, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(222, 3, 000014, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(223, 4, 000015, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(224, 4, 000016, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(225, 4, 000014, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(226, 4, 000015, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(227, 4, 000016, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(228, 4, 000014, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(229, 4, 000015, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(230, 5, 000016, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(231, 5, 000014, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(232, 5, 000015, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(233, 5, 000016, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(234, 5, 000014, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(235, 5, 000015, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(236, 5, 000016, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(237, 6, 000014, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(238, 6, 000015, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(239, 6, 000016, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(240, 6, 000014, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(241, 6, 000015, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(242, 6, 000016, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(243, 6, 000014, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(244, 7, 000015, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(245, 7, 000016, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(246, 7, 000014, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(247, 7, 000015, 123);
------------------------------------------------------------------------------------------------------------------------
-------------------------------------------Boavista - treino individual-------------------------------------------------

------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------Matosinhos - aulas-------------------------------------------------------
insert into Treino(ID, dia, id_gym, localizacao) values(301, 1, 000017, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(302, 1, 000018, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(303, 1, 000019, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(304, 1, 000017, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(305, 1, 000018, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(306, 1, 000019, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(307, 1, 000017, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(308, 1, 000018, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(309, 2, 000019, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(310, 2, 000017, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(311, 2, 000018, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(312, 2, 000019, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(313, 2, 000017, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(314, 2, 000018, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(315, 2, 000019, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(316, 3, 000017, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(317, 3, 000018, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(318, 3, 000019, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(319, 3, 000017, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(320, 3, 000018, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(321, 3, 000019, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(322, 3, 000017, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(323, 4, 000018, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(324, 4, 000019, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(325, 4, 000017, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(326, 4, 000018, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(327, 4, 000019, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(328, 4, 000017, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(329, 4, 000018, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(330, 5, 000019, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(331, 5, 000017, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(332, 5, 000018, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(333, 5, 000019, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(334, 5, 000017, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(335, 5, 000018, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(336, 5, 000019, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(337, 6, 000017, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(338, 6, 000018, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(339, 6, 000019, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(340, 6, 000017, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(341, 6, 000018, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(342, 6, 000019, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(343, 6, 000017, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(344, 7, 000018, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(345, 7, 000019, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(346, 7, 000017, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(347, 7, 000018, 122);
------------------------------------------------------------------------------------------------------------------------
-------------------------------------------Boavista - treino individual-------------------------------------------------

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------



------------------------------------------------------HORÁRIOS----------------------------------------------------------
----------------------------------------------------Braga - aulas-------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

----------------------------------------------Braga - treino individual-------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------Boavista - aulas-------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

-------------------------------------------Boavista - treino individual-------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------Matosinhos - aulas-------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

-------------------------------------------Boavista - treino individual-------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
