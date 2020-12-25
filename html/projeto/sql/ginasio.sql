.mode columns
.headers on

PRAGMA foreign_keys = ON;
----------------------------------------------------Tables Dropped--------------------------------------------------------
drop table if exists Ocorrencia;
drop table if exists Aula;
drop table if exists Modalidade;
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
	vaga integer check(vaga>=0 AND vaga<=1),
	hora_inicio integer,
	hora_fim integer check(strftime('%s', hora_fim) > strftime('%s', hora_inicio))
);

create table Aula(
	ID integer primary key,
	id_modalidade integer references Modalidade,
	ref_treino integer references Treino
);

create table Modalidade(
	ID integer primary key,
	nome text not null
);

create table Ocorrencia(
	ID_aula integer references Aula,
	ID_modalidade integer references Modalidade,
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
insert into Treino(ID, dia, id_gym, localizacao) values(601, 1, 000012, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(602, 1, 000011, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(603, 1, 000013, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(604, 1, 000011, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(605, 1, 000012, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(606, 1, 000013, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(607, 2, 000012, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(608, 2, 000011, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(609, 2, 000013, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(610, 3, 000013, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(611, 3, 000012, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(612, 3, 000011, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(613, 4, 000011, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(614, 4, 000012, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(615, 4, 000013, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(616, 4, 000011, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(617, 4, 000012, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(618, 4, 000013, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(619, 5, 000011, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(620, 5, 000012, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(621, 5, 000013, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(622, 6, 000013, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(623, 6, 000011, 121);
insert into Treino(ID, dia, id_gym, localizacao) values(624, 6, 000012, 121);
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
insert into Treino(ID, dia, id_gym, localizacao) values(701, 1, 000015, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(702, 1, 000014, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(703, 1, 000016, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(704, 1, 000014, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(705, 1, 000015, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(706, 1, 000016, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(707, 2, 000015, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(708, 2, 000014, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(709, 2, 000016, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(710, 3, 000016, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(711, 3, 000015, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(712, 3, 000014, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(713, 4, 000014, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(714, 4, 000015, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(715, 4, 000016, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(716, 4, 000014, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(717, 4, 000015, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(718, 4, 000016, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(719, 5, 000014, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(720, 5, 000015, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(721, 5, 000016, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(722, 6, 000016, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(723, 6, 000014, 123);
insert into Treino(ID, dia, id_gym, localizacao) values(724, 6, 000015, 123);
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
insert into Treino(ID, dia, id_gym, localizacao) values(801, 1, 000018, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(802, 1, 000017, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(803, 1, 000019, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(804, 1, 000017, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(805, 1, 000018, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(806, 1, 000019, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(807, 2, 000018, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(808, 2, 000017, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(809, 2, 000019, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(810, 3, 000019, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(811, 3, 000018, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(812, 3, 000017, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(813, 4, 000017, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(814, 4, 000018, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(815, 4, 000019, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(816, 4, 000017, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(817, 4, 000018, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(818, 4, 000019, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(819, 5, 000017, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(820, 5, 000018, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(821, 5, 000019, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(822, 6, 000019, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(823, 6, 000017, 122);
insert into Treino(ID, dia, id_gym, localizacao) values(824, 6, 000018, 122);
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------



------------------------------------------------------HORÁRIOS----------------------------------------------------------
----------------------------------------------------Braga - aulas-------------------------------------------------------
insert into Modalidade(ID, nome) values(1001, 'Zumba');
insert into Modalidade(ID, nome) values(1002, 'Pilates');
insert into Modalidade(ID, nome) values(1003, 'Cardio');
insert into Modalidade(ID, nome) values(1004, 'Crossfit');
insert into Modalidade(ID, nome) values(1005, 'Crossfit');
insert into Modalidade(ID, nome) values(1006, 'Zumba');
insert into Modalidade(ID, nome) values(1007, 'Cardio');
insert into Modalidade(ID, nome) values(1008, 'Pilates');
insert into Modalidade(ID, nome) values(1009, 'Pilates');
insert into Modalidade(ID, nome) values(1010, 'Cardio');
insert into Modalidade(ID, nome) values(1011, 'Crossfit');
insert into Modalidade(ID, nome) values(1012, 'Pilates');
insert into Modalidade(ID, nome) values(1013, 'Zumba');
insert into Modalidade(ID, nome) values(1014, 'Cardio');
insert into Modalidade(ID, nome) values(1015, 'Zumba');
insert into Modalidade(ID, nome) values(1016, 'Crossfit');
insert into Modalidade(ID, nome) values(1017, 'Cardio');
insert into Modalidade(ID, nome) values(1018, 'Pilates');
insert into Modalidade(ID, nome) values(1019, 'Crossfit');
insert into Modalidade(ID, nome) values(1020, 'Zumba');
insert into Modalidade(ID, nome) values(1021, 'Cardio');
insert into Modalidade(ID, nome) values(1022, 'Pilates');
insert into Modalidade(ID, nome) values(1023, 'Crossfit');
insert into Modalidade(ID, nome) values(1024, 'Zumba');
insert into Modalidade(ID, nome) values(1025, 'Pilates');
insert into Modalidade(ID, nome) values(1026, 'Cardio');
insert into Modalidade(ID, nome) values(1027, 'Zumba');
insert into Modalidade(ID, nome) values(1028, 'Crossfit');
insert into Modalidade(ID, nome) values(1029, 'Cardio');
insert into Modalidade(ID, nome) values(1030, 'Pilates');
insert into Modalidade(ID, nome) values(1031, 'Cardio');
insert into Modalidade(ID, nome) values(1032, 'Crossfit');
insert into Modalidade(ID, nome) values(1033, 'Zumba');
insert into Modalidade(ID, nome) values(1034, 'Cardio');
insert into Modalidade(ID, nome) values(1035, 'Pilates');
insert into Modalidade(ID, nome) values(1036, 'Crossfit');
insert into Modalidade(ID, nome) values(1037, 'Zumba');
insert into Modalidade(ID, nome) values(1038, 'Pilates');
insert into Modalidade(ID, nome) values(1039, 'Cardio');
insert into Modalidade(ID, nome) values(1040, 'Crossfit');
insert into Modalidade(ID, nome) values(1041, 'Zumba');
insert into Modalidade(ID, nome) values(1042, 'Cardio');
insert into Modalidade(ID, nome) values(1043, 'Pilates');
insert into Modalidade(ID, nome) values(1044, 'Pilates');
insert into Modalidade(ID, nome) values(1045, 'Crossfit');
insert into Modalidade(ID, nome) values(1046, 'Cardio');
insert into Modalidade(ID, nome) values(1047, 'Zumba');

insert into Aula(ID, id_modalidade, ref_treino) values(4001, 1001, 501);
insert into Aula(ID, id_modalidade, ref_treino) values(4002, 1002, 502);
insert into Aula(ID, id_modalidade, ref_treino) values(4003, 1003, 503);
insert into Aula(ID, id_modalidade, ref_treino) values(4004, 1004, 504);
insert into Aula(ID, id_modalidade, ref_treino) values(4005, 1005, 505);
insert into Aula(ID, id_modalidade, ref_treino) values(4006, 1006, 506);
insert into Aula(ID, id_modalidade, ref_treino) values(4007, 1007, 507);
insert into Aula(ID, id_modalidade, ref_treino) values(4008, 1008, 508);
insert into Aula(ID, id_modalidade, ref_treino) values(4009, 1009, 509);
insert into Aula(ID, id_modalidade, ref_treino) values(4010, 1010, 510);
insert into Aula(ID, id_modalidade, ref_treino) values(4011, 1011, 511);
insert into Aula(ID, id_modalidade, ref_treino) values(4012, 1012, 512);
insert into Aula(ID, id_modalidade, ref_treino) values(4013, 1013, 513);
insert into Aula(ID, id_modalidade, ref_treino) values(4014, 1014, 514);
insert into Aula(ID, id_modalidade, ref_treino) values(4015, 1015, 515);
insert into Aula(ID, id_modalidade, ref_treino) values(4016, 1016, 516);
insert into Aula(ID, id_modalidade, ref_treino) values(4017, 1017, 517);
insert into Aula(ID, id_modalidade, ref_treino) values(4018, 1018, 518);
insert into Aula(ID, id_modalidade, ref_treino) values(4019, 1019, 519);
insert into Aula(ID, id_modalidade, ref_treino) values(4020, 1020, 520);
insert into Aula(ID, id_modalidade, ref_treino) values(4021, 1021, 521);
insert into Aula(ID, id_modalidade, ref_treino) values(4022, 1022, 522);
insert into Aula(ID, id_modalidade, ref_treino) values(4023, 1023, 523);
insert into Aula(ID, id_modalidade, ref_treino) values(4024, 1024, 524);
insert into Aula(ID, id_modalidade, ref_treino) values(4025, 1025, 525);
insert into Aula(ID, id_modalidade, ref_treino) values(4026, 1026, 526);
insert into Aula(ID, id_modalidade, ref_treino) values(4027, 1027, 527);
insert into Aula(ID, id_modalidade, ref_treino) values(4028, 1028, 528);
insert into Aula(ID, id_modalidade, ref_treino) values(4029, 1029, 529);
insert into Aula(ID, id_modalidade, ref_treino) values(4030, 1030, 530);
insert into Aula(ID, id_modalidade, ref_treino) values(4031, 1031, 531);
insert into Aula(ID, id_modalidade, ref_treino) values(4032, 1032, 532);
insert into Aula(ID, id_modalidade, ref_treino) values(4033, 1033, 533);
insert into Aula(ID, id_modalidade, ref_treino) values(4034, 1034, 534);
insert into Aula(ID, id_modalidade, ref_treino) values(4035, 1035, 535);
insert into Aula(ID, id_modalidade, ref_treino) values(4036, 1036, 536);
insert into Aula(ID, id_modalidade, ref_treino) values(4037, 1037, 537);
insert into Aula(ID, id_modalidade, ref_treino) values(4038, 1038, 538);
insert into Aula(ID, id_modalidade, ref_treino) values(4039, 1039, 539);
insert into Aula(ID, id_modalidade, ref_treino) values(4040, 1040, 540);
insert into Aula(ID, id_modalidade, ref_treino) values(4041, 1041, 541);
insert into Aula(ID, id_modalidade, ref_treino) values(4042, 1042, 542);
insert into Aula(ID, id_modalidade, ref_treino) values(4043, 1043, 543);
insert into Aula(ID, id_modalidade, ref_treino) values(4044, 1044, 544);
insert into Aula(ID, id_modalidade, ref_treino) values(4045, 1045, 545);
insert into Aula(ID, id_modalidade, ref_treino) values(4046, 1046, 546);
insert into Aula(ID, id_modalidade, ref_treino) values(4047, 1047, 547);

insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(4001, 1001, 'E1', 20, strftime('%s', '08:30'), strftime('%s', '09:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(4002, 1002, 'E2', 20, strftime('%s', '09:30'), strftime('%s', '10:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(4003, 1003, 'E1', 20, strftime('%s', '09:30'), strftime('%s', '10:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(4004, 1004, 'E1', 20, strftime('%s', '12:30'), strftime('%s', '13:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(4005, 1005, 'E1', 20, strftime('%s', '15:30'), strftime('%s', '16:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(4006, 1006, 'E2', 20, strftime('%s', '15:30'), strftime('%s', '16:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(4007, 1007, 'E1', 20, strftime('%s', '17:30'), strftime('%s', '18:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(4008, 1008, 'E2', 20, strftime('%s', '19:30'), strftime('%s', '20:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(4009, 1009, 'E2', 20, strftime('%s', '08:30'), strftime('%s', '09:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(4010, 1010, 'E1', 20, strftime('%s', '09:30'), strftime('%s', '10:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(4011, 1011, 'E1', 20, strftime('%s', '11:30'), strftime('%s', '12:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(4012, 1012, 'E2', 20, strftime('%s', '11:30'), strftime('%s', '12:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(4013, 1013, 'E1', 20, strftime('%s', '13:30'), strftime('%s', '14:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(4014, 1014, 'E1', 20, strftime('%s', '15:30'), strftime('%s', '16:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(4015, 1015, 'E2', 20, strftime('%s', '16:30'), strftime('%s', '17:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(4016, 1016, 'E2', 20, strftime('%s', '10:30'), strftime('%s', '11:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(4017, 1017, 'E1', 20, strftime('%s', '10:30'), strftime('%s', '11:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(4018, 1018, 'E2', 20, strftime('%s', '12:30'), strftime('%s', '13:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(4019, 1019, 'E1', 20, strftime('%s', '15:30'), strftime('%s', '16:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(4020, 1020, 'E2', 20, strftime('%s', '15:30'), strftime('%s', '16:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(4021, 1021, 'E1', 20, strftime('%s', '17:30'), strftime('%s', '18:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(4022, 1022, 'E2', 20, strftime('%s', '19:30'), strftime('%s', '20:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(4023, 1023, 'E1', 20, strftime('%s', '08:30'), strftime('%s', '09:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(4024, 1024, 'E1', 20, strftime('%s', '10:30'), strftime('%s', '11:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(4025, 1025, 'E2', 20, strftime('%s', '11:30'), strftime('%s', '12:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(4026, 1026, 'E1', 20, strftime('%s', '13:30'), strftime('%s', '14:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(4027, 1027, 'E2', 20, strftime('%s', '16:30'), strftime('%s', '17:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(4028, 1028, 'E1', 20, strftime('%s', '16:30'), strftime('%s', '17:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(4029, 1029, 'E1', 20, strftime('%s', '18:30'), strftime('%s', '19:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(4030, 1030, 'E2', 20, strftime('%s', '09:30'), strftime('%s', '10:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(4031, 1031, 'E1', 20, strftime('%s', '10:30'), strftime('%s', '11:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(4032, 1032, 'E2', 20, strftime('%s', '10:30'), strftime('%s', '11:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(4033, 1033, 'E1', 20, strftime('%s', '12:30'), strftime('%s', '13:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(4034, 1034, 'E1', 20, strftime('%s', '14:30'), strftime('%s', '15:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(4035, 1035, 'E2', 20, strftime('%s', '16:30'), strftime('%s', '17:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(4036, 1036, 'E1', 20, strftime('%s', '19:30'), strftime('%s', '20:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(4037, 1037, 'E1', 20, strftime('%s', '09:30'), strftime('%s', '10:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(4038, 1038, 'E2', 20, strftime('%s', '10:30'), strftime('%s', '11:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(4039, 1039, 'E1', 20, strftime('%s', '12:30'), strftime('%s', '13:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(4040, 1040, 'E1', 20, strftime('%s', '14:30'), strftime('%s', '15:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(4041, 1041, 'E2', 20, strftime('%s', '14:30'), strftime('%s', '15:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(4042, 1042, 'E1', 20, strftime('%s', '16:30'), strftime('%s', '17:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(4043, 1043, 'E1', 20, strftime('%s', '18:30'), strftime('%s', '19:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(4044, 1044, 'E1', 20, strftime('%s', '08:30'), strftime('%s', '09:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(4045, 1045, 'E1', 20, strftime('%s', '10:30'), strftime('%s', '11:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(4046, 1046, 'E2', 20, strftime('%s', '12:30'), strftime('%s', '13:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(4047, 1047, 'E2', 20, strftime('%s', '14:30'), strftime('%s', '15:30'));
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

----------------------------------------------Braga - treino individual------------------------------------------------------------------------------------------------
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(7001, 601, 1, strftime('%s', '08:30'), strftime('%s', '09:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(7002, 602, 1, strftime('%s', '10:30'), strftime('%s', '11:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(7003, 603, 1, strftime('%s', '13:30'), strftime('%s', '14:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(7004, 604, 1, strftime('%s', '14:30'), strftime('%s', '15:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(7005, 605, 1, strftime('%s', '17:30'), strftime('%s', '18:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(7006, 606, 1, strftime('%s', '19:30'), strftime('%s', '20:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(7007, 607, 1, strftime('%s', '08:30'), strftime('%s', '09:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(7008, 608, 1, strftime('%s', '12:30'), strftime('%s', '13:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(7009, 609, 1, strftime('%s', '14:30'), strftime('%s', '15:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(7010, 610, 1, strftime('%s', '09:30'), strftime('%s', '10:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(7011, 611, 1, strftime('%s', '12:30'), strftime('%s', '13:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(7012, 612, 1, strftime('%s', '13:30'), strftime('%s', '14:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(7013, 613, 1, strftime('%s', '08:30'), strftime('%s', '09:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(7014, 614, 1, strftime('%s', '11:30'), strftime('%s', '12:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(7015, 615, 1, strftime('%s', '13:30'), strftime('%s', '14:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(7016, 616, 1, strftime('%s', '14:30'), strftime('%s', '15:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(7017, 617, 1, strftime('%s', '16:30'), strftime('%s', '17:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(7018, 618, 1, strftime('%s', '18:30'), strftime('%s', '19:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(7019, 619, 1, strftime('%s', '08:30'), strftime('%s', '09:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(7020, 620, 1, strftime('%s', '12:30'), strftime('%s', '13:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(7021, 621, 1, strftime('%s', '14:30'), strftime('%s', '15:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(7022, 622, 1, strftime('%s', '08:30'), strftime('%s', '09:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(7023, 623, 1, strftime('%s', '12:30'), strftime('%s', '13:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(7024, 624, 1, strftime('%s', '18:30'), strftime('%s', '19:30'));
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------Boavista - aulas------------------------------------------------------------------------------------------------------
insert into Modalidade(ID, nome) values(2001, 'Zumba');
insert into Modalidade(ID, nome) values(2002, 'Pilates');
insert into Modalidade(ID, nome) values(2003, 'Cardio');
insert into Modalidade(ID, nome) values(2004, 'Crossfit');
insert into Modalidade(ID, nome) values(2005, 'Crossfit');
insert into Modalidade(ID, nome) values(2006, 'Zumba');
insert into Modalidade(ID, nome) values(2007, 'Cardio');
insert into Modalidade(ID, nome) values(2008, 'Pilates');
insert into Modalidade(ID, nome) values(2009, 'Pilates');
insert into Modalidade(ID, nome) values(2010, 'Cardio');
insert into Modalidade(ID, nome) values(2011, 'Crossfit');
insert into Modalidade(ID, nome) values(2012, 'Pilates');
insert into Modalidade(ID, nome) values(2013, 'Zumba');
insert into Modalidade(ID, nome) values(2014, 'Cardio');
insert into Modalidade(ID, nome) values(2015, 'Zumba');
insert into Modalidade(ID, nome) values(2016, 'Crossfit');
insert into Modalidade(ID, nome) values(2017, 'Cardio');
insert into Modalidade(ID, nome) values(2018, 'Pilates');
insert into Modalidade(ID, nome) values(2019, 'Crossfit');
insert into Modalidade(ID, nome) values(2020, 'Zumba');
insert into Modalidade(ID, nome) values(2021, 'Cardio');
insert into Modalidade(ID, nome) values(2022, 'Pilates');
insert into Modalidade(ID, nome) values(2023, 'Crossfit');
insert into Modalidade(ID, nome) values(2024, 'Zumba');
insert into Modalidade(ID, nome) values(2025, 'Pilates');
insert into Modalidade(ID, nome) values(2026, 'Cardio');
insert into Modalidade(ID, nome) values(2027, 'Zumba');
insert into Modalidade(ID, nome) values(2028, 'Crossfit');
insert into Modalidade(ID, nome) values(2029, 'Cardio');
insert into Modalidade(ID, nome) values(2030, 'Pilates');
insert into Modalidade(ID, nome) values(2031, 'Cardio');
insert into Modalidade(ID, nome) values(2032, 'Crossfit');
insert into Modalidade(ID, nome) values(2033, 'Zumba');
insert into Modalidade(ID, nome) values(2034, 'Cardio');
insert into Modalidade(ID, nome) values(2035, 'Pilates');
insert into Modalidade(ID, nome) values(2036, 'Crossfit');
insert into Modalidade(ID, nome) values(2037, 'Zumba');
insert into Modalidade(ID, nome) values(2038, 'Pilates');
insert into Modalidade(ID, nome) values(2039, 'Cardio');
insert into Modalidade(ID, nome) values(2040, 'Crossfit');
insert into Modalidade(ID, nome) values(2041, 'Zumba');
insert into Modalidade(ID, nome) values(2042, 'Cardio');
insert into Modalidade(ID, nome) values(2043, 'Pilates');
insert into Modalidade(ID, nome) values(2044, 'Pilates');
insert into Modalidade(ID, nome) values(2045, 'Crossfit');
insert into Modalidade(ID, nome) values(2046, 'Cardio');
insert into Modalidade(ID, nome) values(2047, 'Zumba');

insert into Aula(ID, id_modalidade, ref_treino) values(5001, 2001, 201);
insert into Aula(ID, id_modalidade, ref_treino) values(5002, 2001, 202);
insert into Aula(ID, id_modalidade, ref_treino) values(5003, 2001, 203);
insert into Aula(ID, id_modalidade, ref_treino) values(5004, 2001, 204);
insert into Aula(ID, id_modalidade, ref_treino) values(5005, 2001, 205);
insert into Aula(ID, id_modalidade, ref_treino) values(5006, 2001, 206);
insert into Aula(ID, id_modalidade, ref_treino) values(5007, 2001, 207);
insert into Aula(ID, id_modalidade, ref_treino) values(5008, 2001, 208);
insert into Aula(ID, id_modalidade, ref_treino) values(5009, 2001, 209);
insert into Aula(ID, id_modalidade, ref_treino) values(5010, 2001, 210);
insert into Aula(ID, id_modalidade, ref_treino) values(5011, 2001, 211);
insert into Aula(ID, id_modalidade, ref_treino) values(5012, 2001, 212);
insert into Aula(ID, id_modalidade, ref_treino) values(5013, 2001, 213);
insert into Aula(ID, id_modalidade, ref_treino) values(5014, 2001, 214);
insert into Aula(ID, id_modalidade, ref_treino) values(5015, 2001, 215);
insert into Aula(ID, id_modalidade, ref_treino) values(5016, 2001, 216);
insert into Aula(ID, id_modalidade, ref_treino) values(5017, 2001, 217);
insert into Aula(ID, id_modalidade, ref_treino) values(5018, 2001, 218);
insert into Aula(ID, id_modalidade, ref_treino) values(5019, 2001, 219);
insert into Aula(ID, id_modalidade, ref_treino) values(5020, 2001, 220);
insert into Aula(ID, id_modalidade, ref_treino) values(5021, 2001, 221);
insert into Aula(ID, id_modalidade, ref_treino) values(5022, 2001, 222);
insert into Aula(ID, id_modalidade, ref_treino) values(5023, 2001, 223);
insert into Aula(ID, id_modalidade, ref_treino) values(5024, 2001, 224);
insert into Aula(ID, id_modalidade, ref_treino) values(5025, 2001, 225);
insert into Aula(ID, id_modalidade, ref_treino) values(5026, 2001, 226);
insert into Aula(ID, id_modalidade, ref_treino) values(5027, 2001, 227);
insert into Aula(ID, id_modalidade, ref_treino) values(5028, 2001, 228);
insert into Aula(ID, id_modalidade, ref_treino) values(5029, 2001, 229);
insert into Aula(ID, id_modalidade, ref_treino) values(5030, 2001, 230);
insert into Aula(ID, id_modalidade, ref_treino) values(5031, 2001, 231);
insert into Aula(ID, id_modalidade, ref_treino) values(5032, 2001, 232);
insert into Aula(ID, id_modalidade, ref_treino) values(5033, 2001, 233);
insert into Aula(ID, id_modalidade, ref_treino) values(5034, 2001, 234);
insert into Aula(ID, id_modalidade, ref_treino) values(5035, 2001, 235);
insert into Aula(ID, id_modalidade, ref_treino) values(5036, 2001, 236);
insert into Aula(ID, id_modalidade, ref_treino) values(5037, 2001, 237);
insert into Aula(ID, id_modalidade, ref_treino) values(5038, 2001, 238);
insert into Aula(ID, id_modalidade, ref_treino) values(5039, 2001, 239);
insert into Aula(ID, id_modalidade, ref_treino) values(5040, 2001, 240);
insert into Aula(ID, id_modalidade, ref_treino) values(5041, 2001, 241);
insert into Aula(ID, id_modalidade, ref_treino) values(5042, 2001, 242);
insert into Aula(ID, id_modalidade, ref_treino) values(5043, 2001, 243);
insert into Aula(ID, id_modalidade, ref_treino) values(5044, 2001, 244);
insert into Aula(ID, id_modalidade, ref_treino) values(5045, 2001, 245);
insert into Aula(ID, id_modalidade, ref_treino) values(5046, 2001, 246);
insert into Aula(ID, id_modalidade, ref_treino) values(5047, 2001, 247);

insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(5001, 2001, 'E1', 20, strftime('%s', '08:30'), strftime('%s', '09:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(5002, 2002, 'E2', 20, strftime('%s', '09:30'), strftime('%s', '10:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(5003, 2003, 'E1', 20, strftime('%s', '09:30'), strftime('%s', '10:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(5004, 2004, 'E1', 20, strftime('%s', '12:30'), strftime('%s', '13:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(5005, 2005, 'E1', 20, strftime('%s', '15:30'), strftime('%s', '16:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(5006, 2006, 'E2', 20, strftime('%s', '15:30'), strftime('%s', '16:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(5007, 2007, 'E1', 20, strftime('%s', '17:30'), strftime('%s', '18:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(5008, 2008, 'E2', 20, strftime('%s', '19:30'), strftime('%s', '20:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(5009, 2009, 'E2', 20, strftime('%s', '08:30'), strftime('%s', '09:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(5010, 2010, 'E1', 20, strftime('%s', '09:30'), strftime('%s', '10:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(5011, 2011, 'E1', 20, strftime('%s', '11:30'), strftime('%s', '12:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(5012, 2012, 'E2', 20, strftime('%s', '11:30'), strftime('%s', '12:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(5013, 2013, 'E1', 20, strftime('%s', '13:30'), strftime('%s', '14:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(5014, 2014, 'E1', 20, strftime('%s', '15:30'), strftime('%s', '16:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(5015, 2015, 'E2', 20, strftime('%s', '16:30'), strftime('%s', '17:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(5016, 2016, 'E2', 20, strftime('%s', '10:30'), strftime('%s', '11:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(5017, 2017, 'E1', 20, strftime('%s', '10:30'), strftime('%s', '11:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(5018, 2018, 'E2', 20, strftime('%s', '12:30'), strftime('%s', '13:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(5019, 2019, 'E1', 20, strftime('%s', '15:30'), strftime('%s', '16:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(5020, 2020, 'E2', 20, strftime('%s', '15:30'), strftime('%s', '16:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(5021, 2021, 'E1', 20, strftime('%s', '17:30'), strftime('%s', '18:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(5022, 2022, 'E2', 20, strftime('%s', '19:30'), strftime('%s', '20:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(5023, 2023, 'E1', 20, strftime('%s', '08:30'), strftime('%s', '09:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(5024, 2024, 'E1', 20, strftime('%s', '10:30'), strftime('%s', '11:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(5025, 2025, 'E2', 20, strftime('%s', '11:30'), strftime('%s', '12:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(5026, 2026, 'E1', 20, strftime('%s', '13:30'), strftime('%s', '14:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(5027, 2027, 'E2', 20, strftime('%s', '16:30'), strftime('%s', '17:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(5028, 2028, 'E1', 20, strftime('%s', '16:30'), strftime('%s', '17:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(5029, 2029, 'E1', 20, strftime('%s', '18:30'), strftime('%s', '19:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(5030, 2030, 'E2', 20, strftime('%s', '09:30'), strftime('%s', '10:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(5031, 2031, 'E1', 20, strftime('%s', '10:30'), strftime('%s', '11:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(5032, 2032, 'E2', 20, strftime('%s', '10:30'), strftime('%s', '11:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(5033, 2033, 'E1', 20, strftime('%s', '12:30'), strftime('%s', '13:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(5034, 2034, 'E1', 20, strftime('%s', '14:30'), strftime('%s', '15:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(5035, 2035, 'E2', 20, strftime('%s', '16:30'), strftime('%s', '17:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(5036, 2036, 'E1', 20, strftime('%s', '19:30'), strftime('%s', '20:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(5037, 2037, 'E1', 20, strftime('%s', '09:30'), strftime('%s', '10:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(5038, 2038, 'E2', 20, strftime('%s', '10:30'), strftime('%s', '11:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(5039, 2039, 'E1', 20, strftime('%s', '12:30'), strftime('%s', '13:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(5040, 2040, 'E1', 20, strftime('%s', '14:30'), strftime('%s', '15:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(5041, 2041, 'E2', 20, strftime('%s', '14:30'), strftime('%s', '15:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(5042, 2042, 'E1', 20, strftime('%s', '16:30'), strftime('%s', '17:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(5043, 2043, 'E1', 20, strftime('%s', '18:30'), strftime('%s', '19:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(5044, 2044, 'E1', 20, strftime('%s', '08:30'), strftime('%s', '09:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(5045, 2045, 'E1', 20, strftime('%s', '10:30'), strftime('%s', '11:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(5046, 2046, 'E2', 20, strftime('%s', '12:30'), strftime('%s', '13:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(5047, 2047, 'E2', 20, strftime('%s', '14:30'), strftime('%s', '15:30'));
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------Boavista - treino individual------------------------------------------------------------------------------------------------
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(8001, 701, 1, strftime('%s', '08:30'), strftime('%s', '09:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(8002, 702, 1, strftime('%s', '10:30'), strftime('%s', '11:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(8003, 703, 1, strftime('%s', '13:30'), strftime('%s', '14:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(8004, 704, 1, strftime('%s', '14:30'), strftime('%s', '15:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(8005, 705, 1, strftime('%s', '17:30'), strftime('%s', '18:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(8006, 706, 1, strftime('%s', '19:30'), strftime('%s', '20:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(8007, 707, 1, strftime('%s', '08:30'), strftime('%s', '09:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(8008, 708, 1, strftime('%s', '12:30'), strftime('%s', '13:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(8009, 709, 1, strftime('%s', '14:30'), strftime('%s', '15:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(8010, 710, 1, strftime('%s', '09:30'), strftime('%s', '10:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(8011, 711, 1, strftime('%s', '12:30'), strftime('%s', '13:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(8012, 712, 1, strftime('%s', '13:30'), strftime('%s', '14:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(8013, 713, 1, strftime('%s', '08:30'), strftime('%s', '09:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(8014, 714, 1, strftime('%s', '11:30'), strftime('%s', '12:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(8015, 715, 1, strftime('%s', '13:30'), strftime('%s', '14:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(8016, 716, 1, strftime('%s', '14:30'), strftime('%s', '15:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(8017, 717, 1, strftime('%s', '16:30'), strftime('%s', '17:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(8018, 718, 1, strftime('%s', '18:30'), strftime('%s', '19:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(8019, 719, 1, strftime('%s', '08:30'), strftime('%s', '09:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(8020, 720, 1, strftime('%s', '12:30'), strftime('%s', '13:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(8021, 721, 1, strftime('%s', '14:30'), strftime('%s', '15:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(8022, 722, 1, strftime('%s', '08:30'), strftime('%s', '09:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(8023, 723, 1, strftime('%s', '12:30'), strftime('%s', '13:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(8024, 724, 1, strftime('%s', '18:30'), strftime('%s', '19:30'));
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------Matosinhos - aulas------------------------------------------------------------------------------------------------------
insert into Modalidade(ID, nome) values(3001, 'Zumba');
insert into Modalidade(ID, nome) values(3002, 'Pilates');
insert into Modalidade(ID, nome) values(3003, 'Cardio');
insert into Modalidade(ID, nome) values(3004, 'Crossfit');
insert into Modalidade(ID, nome) values(3005, 'Crossfit');
insert into Modalidade(ID, nome) values(3006, 'Zumba');
insert into Modalidade(ID, nome) values(3007, 'Cardio');
insert into Modalidade(ID, nome) values(3008, 'Pilates');
insert into Modalidade(ID, nome) values(3009, 'Pilates');
insert into Modalidade(ID, nome) values(3010, 'Cardio');
insert into Modalidade(ID, nome) values(3011, 'Crossfit');
insert into Modalidade(ID, nome) values(3012, 'Pilates');
insert into Modalidade(ID, nome) values(3013, 'Zumba');
insert into Modalidade(ID, nome) values(3014, 'Cardio');
insert into Modalidade(ID, nome) values(3015, 'Zumba');
insert into Modalidade(ID, nome) values(3016, 'Crossfit');
insert into Modalidade(ID, nome) values(3017, 'Cardio');
insert into Modalidade(ID, nome) values(3018, 'Pilates');
insert into Modalidade(ID, nome) values(3019, 'Crossfit');
insert into Modalidade(ID, nome) values(3020, 'Zumba');
insert into Modalidade(ID, nome) values(3021, 'Cardio');
insert into Modalidade(ID, nome) values(3022, 'Pilates');
insert into Modalidade(ID, nome) values(3023, 'Crossfit');
insert into Modalidade(ID, nome) values(3024, 'Zumba');
insert into Modalidade(ID, nome) values(3025, 'Pilates');
insert into Modalidade(ID, nome) values(3026, 'Cardio');
insert into Modalidade(ID, nome) values(3027, 'Zumba');
insert into Modalidade(ID, nome) values(3028, 'Crossfit');
insert into Modalidade(ID, nome) values(3029, 'Cardio');
insert into Modalidade(ID, nome) values(3030, 'Pilates');
insert into Modalidade(ID, nome) values(3031, 'Cardio');
insert into Modalidade(ID, nome) values(3032, 'Crossfit');
insert into Modalidade(ID, nome) values(3033, 'Zumba');
insert into Modalidade(ID, nome) values(3034, 'Cardio');
insert into Modalidade(ID, nome) values(3035, 'Pilates');
insert into Modalidade(ID, nome) values(3036, 'Crossfit');
insert into Modalidade(ID, nome) values(3037, 'Zumba');
insert into Modalidade(ID, nome) values(3038, 'Pilates');
insert into Modalidade(ID, nome) values(3039, 'Cardio');
insert into Modalidade(ID, nome) values(3040, 'Crossfit');
insert into Modalidade(ID, nome) values(3041, 'Zumba');
insert into Modalidade(ID, nome) values(3042, 'Cardio');
insert into Modalidade(ID, nome) values(3043, 'Pilates');
insert into Modalidade(ID, nome) values(3044, 'Pilates');
insert into Modalidade(ID, nome) values(3045, 'Crossfit');
insert into Modalidade(ID, nome) values(3046, 'Cardio');
insert into Modalidade(ID, nome) values(3047, 'Zumba');

insert into Aula(ID, id_modalidade, ref_treino) values(6001, 3001, 301);
insert into Aula(ID, id_modalidade, ref_treino) values(6002, 3002, 302);
insert into Aula(ID, id_modalidade, ref_treino) values(6003, 3003, 303);
insert into Aula(ID, id_modalidade, ref_treino) values(6004, 3004, 304);
insert into Aula(ID, id_modalidade, ref_treino) values(6005, 3005, 305);
insert into Aula(ID, id_modalidade, ref_treino) values(6006, 3006, 306);
insert into Aula(ID, id_modalidade, ref_treino) values(6007, 3007, 307);
insert into Aula(ID, id_modalidade, ref_treino) values(6008, 3008, 308);
insert into Aula(ID, id_modalidade, ref_treino) values(6009, 3009, 309);
insert into Aula(ID, id_modalidade, ref_treino) values(6010, 3010, 310);
insert into Aula(ID, id_modalidade, ref_treino) values(6011, 3011, 311);
insert into Aula(ID, id_modalidade, ref_treino) values(6012, 3012, 312);
insert into Aula(ID, id_modalidade, ref_treino) values(6013, 3013, 313);
insert into Aula(ID, id_modalidade, ref_treino) values(6014, 3014, 314);
insert into Aula(ID, id_modalidade, ref_treino) values(6015, 3015, 315);
insert into Aula(ID, id_modalidade, ref_treino) values(6016, 3016, 316);
insert into Aula(ID, id_modalidade, ref_treino) values(6017, 3017, 317);
insert into Aula(ID, id_modalidade, ref_treino) values(6018, 3018, 318);
insert into Aula(ID, id_modalidade, ref_treino) values(6019, 3018, 319);
insert into Aula(ID, id_modalidade, ref_treino) values(6020, 3019, 320);
insert into Aula(ID, id_modalidade, ref_treino) values(6021, 3020, 321);
insert into Aula(ID, id_modalidade, ref_treino) values(6022, 3021, 322);
insert into Aula(ID, id_modalidade, ref_treino) values(6023, 3022, 323);
insert into Aula(ID, id_modalidade, ref_treino) values(6024, 3023, 324);
insert into Aula(ID, id_modalidade, ref_treino) values(6025, 3024, 325);
insert into Aula(ID, id_modalidade, ref_treino) values(6026, 3025, 326);
insert into Aula(ID, id_modalidade, ref_treino) values(6027, 3026, 327);
insert into Aula(ID, id_modalidade, ref_treino) values(6028, 3027, 328);
insert into Aula(ID, id_modalidade, ref_treino) values(6029, 3028, 329);
insert into Aula(ID, id_modalidade, ref_treino) values(6030, 3029, 330);
insert into Aula(ID, id_modalidade, ref_treino) values(6031, 3030, 331);
insert into Aula(ID, id_modalidade, ref_treino) values(6032, 3031, 332);
insert into Aula(ID, id_modalidade, ref_treino) values(6033, 3032, 333);
insert into Aula(ID, id_modalidade, ref_treino) values(6034, 3033, 334);
insert into Aula(ID, id_modalidade, ref_treino) values(6035, 3034, 335);
insert into Aula(ID, id_modalidade, ref_treino) values(6036, 3035, 336);
insert into Aula(ID, id_modalidade, ref_treino) values(6037, 3036, 337);
insert into Aula(ID, id_modalidade, ref_treino) values(6038, 3037, 338);
insert into Aula(ID, id_modalidade, ref_treino) values(6039, 3039, 339);
insert into Aula(ID, id_modalidade, ref_treino) values(6040, 3040, 340);
insert into Aula(ID, id_modalidade, ref_treino) values(6041, 3041, 341);
insert into Aula(ID, id_modalidade, ref_treino) values(6042, 3042, 342);
insert into Aula(ID, id_modalidade, ref_treino) values(6043, 3043, 343);
insert into Aula(ID, id_modalidade, ref_treino) values(6044, 3044, 344);
insert into Aula(ID, id_modalidade, ref_treino) values(6045, 3045, 345);
insert into Aula(ID, id_modalidade, ref_treino) values(6046, 3046, 346);
insert into Aula(ID, id_modalidade, ref_treino) values(6047, 3047, 347);

insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(6001, 3001, 'E1', 20, strftime('%s', '08:30'), strftime('%s', '09:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(6002, 3002, 'E2', 20, strftime('%s', '09:30'), strftime('%s', '10:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(6003, 3003, 'E1', 20, strftime('%s', '09:30'), strftime('%s', '10:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(6004, 3004, 'E1', 20, strftime('%s', '12:30'), strftime('%s', '13:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(6005, 3005, 'E1', 20, strftime('%s', '15:30'), strftime('%s', '16:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(6006, 3006, 'E2', 20, strftime('%s', '15:30'), strftime('%s', '16:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(6007, 3007, 'E1', 20, strftime('%s', '17:30'), strftime('%s', '18:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(6008, 3008, 'E2', 20, strftime('%s', '19:30'), strftime('%s', '20:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(6009, 3009, 'E2', 20, strftime('%s', '08:30'), strftime('%s', '09:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(6010, 3010, 'E1', 20, strftime('%s', '09:30'), strftime('%s', '10:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(6011, 3011, 'E1', 20, strftime('%s', '11:30'), strftime('%s', '12:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(6012, 3012, 'E2', 20, strftime('%s', '11:30'), strftime('%s', '12:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(6013, 3013, 'E1', 20, strftime('%s', '13:30'), strftime('%s', '14:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(6014, 3014, 'E1', 20, strftime('%s', '15:30'), strftime('%s', '16:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(6015, 3015, 'E2', 20, strftime('%s', '16:30'), strftime('%s', '17:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(6016, 3016, 'E2', 20, strftime('%s', '10:30'), strftime('%s', '11:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(6017, 3017, 'E1', 20, strftime('%s', '10:30'), strftime('%s', '11:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(6018, 3018, 'E2', 20, strftime('%s', '12:30'), strftime('%s', '13:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(6019, 3019, 'E1', 20, strftime('%s', '15:30'), strftime('%s', '16:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(6020, 3020, 'E2', 20, strftime('%s', '15:30'), strftime('%s', '16:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(6021, 3021, 'E1', 20, strftime('%s', '17:30'), strftime('%s', '18:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(6022, 3022, 'E2', 20, strftime('%s', '19:30'), strftime('%s', '20:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(6023, 3023, 'E1', 20, strftime('%s', '08:30'), strftime('%s', '09:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(6024, 3024, 'E1', 20, strftime('%s', '10:30'), strftime('%s', '11:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(6025, 3025, 'E2', 20, strftime('%s', '11:30'), strftime('%s', '12:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(6026, 3026, 'E1', 20, strftime('%s', '13:30'), strftime('%s', '14:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(6027, 3027, 'E2', 20, strftime('%s', '16:30'), strftime('%s', '17:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(6028, 3028, 'E1', 20, strftime('%s', '16:30'), strftime('%s', '17:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(6029, 3029, 'E1', 20, strftime('%s', '18:30'), strftime('%s', '19:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(6030, 3030, 'E2', 20, strftime('%s', '09:30'), strftime('%s', '10:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(6031, 3031, 'E1', 20, strftime('%s', '10:30'), strftime('%s', '11:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(6032, 3032, 'E2', 20, strftime('%s', '10:30'), strftime('%s', '11:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(6033, 3033, 'E1', 20, strftime('%s', '12:30'), strftime('%s', '13:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(6034, 3034, 'E1', 20, strftime('%s', '14:30'), strftime('%s', '15:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(6035, 3035, 'E2', 20, strftime('%s', '16:30'), strftime('%s', '17:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(6036, 3036, 'E1', 20, strftime('%s', '19:30'), strftime('%s', '20:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(6037, 3037, 'E1', 20, strftime('%s', '09:30'), strftime('%s', '10:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(6038, 3038, 'E2', 20, strftime('%s', '10:30'), strftime('%s', '11:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(6039, 3039, 'E1', 20, strftime('%s', '12:30'), strftime('%s', '13:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(6040, 3040, 'E1', 20, strftime('%s', '14:30'), strftime('%s', '15:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(6041, 3041, 'E2', 20, strftime('%s', '14:30'), strftime('%s', '15:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(6042, 3042, 'E1', 20, strftime('%s', '16:30'), strftime('%s', '17:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(6043, 3043, 'E1', 20, strftime('%s', '18:30'), strftime('%s', '19:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(6044, 3044, 'E1', 20, strftime('%s', '08:30'), strftime('%s', '09:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(6045, 3045, 'E1', 20, strftime('%s', '10:30'), strftime('%s', '11:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(6046, 3046, 'E2', 20, strftime('%s', '12:30'), strftime('%s', '13:30'));
insert into Ocorrencia(ID_aula, ID_modalidade, espaco, vagas, hora_inicio, hora_fim) values(6047, 3047, 'E2', 20, strftime('%s', '14:30'), strftime('%s', '15:30'));
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------Boavista - treino individual------------------------------------------------------------------------------------------------
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(9001, 801, 1, strftime('%s', '08:30'), strftime('%s', '09:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(9002, 802, 1, strftime('%s', '10:30'), strftime('%s', '11:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(9003, 803, 1, strftime('%s', '13:30'), strftime('%s', '14:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(9004, 804, 1, strftime('%s', '14:30'), strftime('%s', '15:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(9005, 805, 1, strftime('%s', '17:30'), strftime('%s', '18:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(9006, 806, 1, strftime('%s', '19:30'), strftime('%s', '20:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(9007, 807, 1, strftime('%s', '08:30'), strftime('%s', '09:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(9008, 808, 1, strftime('%s', '12:30'), strftime('%s', '13:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(9009, 809, 1, strftime('%s', '14:30'), strftime('%s', '15:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(9010, 810, 1, strftime('%s', '09:30'), strftime('%s', '10:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(9011, 811, 1, strftime('%s', '12:30'), strftime('%s', '13:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(9012, 812, 1, strftime('%s', '13:30'), strftime('%s', '14:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(9013, 813, 1, strftime('%s', '08:30'), strftime('%s', '09:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(9014, 814, 1, strftime('%s', '11:30'), strftime('%s', '12:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(9015, 815, 1, strftime('%s', '13:30'), strftime('%s', '14:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(9016, 816, 1, strftime('%s', '14:30'), strftime('%s', '15:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(9017, 817, 1, strftime('%s', '16:30'), strftime('%s', '17:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(9018, 818, 1, strftime('%s', '18:30'), strftime('%s', '19:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(9019, 819, 1, strftime('%s', '08:30'), strftime('%s', '09:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(9020, 820, 1, strftime('%s', '12:30'), strftime('%s', '13:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(9021, 821, 1, strftime('%s', '14:30'), strftime('%s', '15:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(9022, 822, 1, strftime('%s', '08:30'), strftime('%s', '09:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(9023, 823, 1, strftime('%s', '12:30'), strftime('%s', '13:30'));
insert into Treino_Individual(ID, ref_treino, vaga, hora_inicio, hora_inicio) values(9024, 824, 1, strftime('%s', '18:30'), strftime('%s', '19:30'));
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
