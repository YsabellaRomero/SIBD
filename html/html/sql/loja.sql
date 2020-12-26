PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS Monitor;
DROP TABLE IF EXISTS Rato;
DROP TABLE IF EXISTS Teclado;
DROP TABLE IF EXISTS Headphones;
DROP TABLE IF EXISTS PSU;
DROP TABLE IF EXISTS CPU;
DROP TABLE IF EXISTS GPU;
DROP TABLE IF EXISTS RAM;
DROP TABLE IF EXISTS Disco;
DROP TABLE IF EXISTS Stock;
DROP TABLE IF EXISTS Artigo;
DROP TABLE IF EXISTS Encomenda;
DROP TABLE IF EXISTS Armazem;
DROP TABLE IF EXISTS Conta;

CREATE TABLE Conta(
  Id INTEGER PRIMARY KEY AUTOINCREMENT,
  Email TEXT NOT NULL,
  Password TEXT NOT NULL,
  NIF INTEGER,
  Nome TEXT,
  Num_telefone NUMBER
);

CREATE TABLE Encomenda(
  Num_referencia INTEGER PRIMARY KEY,
  Data DATE,
  Metodo_pagamento TEXT,
  Morada TEXT,
  Conta INTEGER REFERENCES Conta,
  Armazem INTEGER REFERENCES Armazem
);

CREATE TABLE Armazem(
  Id INTEGER PRIMARY KEY,
  Morada TEXT NOT NULL,
  Num_telefone TEXT NOT NULL
);

CREATE TABLE Artigo(
  Num_serie INTEGER PRIMARY KEY,
  Marca TEXT,
  Modelo TEXT,
  Preço REAL CHECK(Preço > 0),
  Categoria TEXT,
  Armazem INTEGER REFERENCES Armazem,
  Encomenda INTEGER REFERENCES Encomenda
);

CREATE TABLE Stock(
  Artigo INTEGER PRIMARY KEY REFERENCES Artigo,
  Armazem INTEGER REFERENCES Armazem,
  Quantidade INTEGER CHECK(Quantidade >= 0)
);

CREATE TABLE Monitor(
  Num_serie INTEGER PRIMARY KEY REFERENCES Artigo,
  Tamanho_ecra TEXT,
  Resoluçao_ecra TEXT,
  Refresh_rate TEXT
);

CREATE TABLE Rato(
  Num_serie INTEGER PRIMARY KEY REFERENCES Artigo,
  DPI INTEGER,
  Iluminaçao TEXT,
  Wireless TEXT
);

CREATE TABLE Teclado(
  Num_serie INTEGER PRIMARY KEY REFERENCES Artigo,
  Iluminaçao TEXT,
  Wireless TEXT
);

CREATE TABLE Headphones(
  Num_serie INTEGER PRIMARY KEY REFERENCES Artigo,
  Microfone TEXT,
  Wireless TEXT
);

CREATE TABLE PSU(
  Num_serie INTEGER PRIMARY KEY REFERENCES Artigo,
  Watts TEXT,
  Fan_size TEXT
);

CREATE TABLE CPU(
  Num_serie INTEGER PRIMARY KEY REFERENCES Artigo,
  Clock TEXT,
  Num_cores INTEGER,
  Num_threads INTEGER,
  Mem_cache TEXT
);

CREATE TABLE GPU(
  Num_serie INTEGER PRIMARY KEY REFERENCES Artigo,
  Vram TEXT,
  Vram_tipo TEXT,
  Clock TEXT,
  Dx_ver INTEGER
);

CREATE TABLE RAM(
  Num_serie INTEGER PRIMARY KEY REFERENCES Artigo,
  Qtdd_memoria TEXT,
  Ram_tipo TEXT,
  Clock TEXT
);

CREATE TABLE Disco(
  Num_serie INTEGER PRIMARY KEY REFERENCES Artigo,
  Tipo_disco TEXT,
  Memoria TEXT
);

---------------------------------------------ARMAZÉM---------------------------------------------
INSERT INTO Armazem VALUES(1, 'Zona Industrial Chaves, Lt. 27, Chaves, Vila Real', '276984382');
-------------------------------------------------------------------------------------------------

---------------------------------------------ARTIGOS----------------------------------------------------------------------------------------
                          --MONITORES--
INSERT INTO Artigo(Num_serie, Marca, Modelo, Preço, Categoria, Armazem) VALUES(601867, 'Asus', 'TUF Gaming VG27AQ1A', 499.90, 'Monitor', 1);
INSERT INTO Artigo(Num_serie, Marca, Modelo, Preço, Categoria, Armazem) VALUES(892719, 'AOC', 'U32E2N', 389.90, 'Monitor', 1);
INSERT INTO Artigo(Num_serie, Marca, Modelo, Preço, Categoria, Armazem) VALUES(915758, 'Gigabyte', 'M27F Gaming', 259.90, 'Monitor', 1);
INSERT INTO Artigo(Num_serie, Marca, Modelo, Preço, Categoria, Armazem) VALUES(393303, 'LG', '32UN500-W', 364.90, 'Monitor', 1);

                          --RATOS--
INSERT INTO Artigo(Num_serie, Marca, Modelo, Preço, Categoria, Armazem) VALUES(025986, 'Razer', 'Basilisk Ultimate Wireless', 149.90, 'Rato', 1);
INSERT INTO Artigo(Num_serie, Marca, Modelo, Preço, Categoria, Armazem) VALUES(349864, 'AOC', 'GM200', 19.90, 'Rato', 1);
INSERT INTO Artigo(Num_serie, Marca, Modelo, Preço, Categoria, Armazem) VALUES(306304, 'MSI', 'Clutch GM20 Elite', 29.90, 'Rato', 1);
INSERT INTO Artigo(Num_serie, Marca, Modelo, Preço, Categoria, Armazem) VALUES(467634, 'Asus', 'Strix Impact II', 79.90, 'Rato', 1);

                          --TECLADOS--
INSERT INTO Artigo(Num_serie, Marca, Modelo, Preço, Categoria, Armazem) VALUES(071211, 'Corsair', 'K60 RGB Pro Gaming', 149.90, 'Teclado', 1);
INSERT INTO Artigo(Num_serie, Marca, Modelo, Preço, Categoria, Armazem) VALUES(612069, 'Razer', 'Huntsman Gears 5', 134.90, 'Teclado', 1);
INSERT INTO Artigo(Num_serie, Marca, Modelo, Preço, Categoria, Armazem) VALUES(211896, 'Asus', 'Sagaris GK1100', 99.90, 'Teclado', 1);
INSERT INTO Artigo(Num_serie, Marca, Modelo, Preço, Categoria, Armazem) VALUES(249278, 'Sharkoon', 'Skiller Mech SGK3', 64.90, 'Teclado', 1);

                          --Headphones--
INSERT INTO Artigo(Num_serie, Marca, Modelo, Preço, Categoria, Armazem) VALUES(030707, 'Razer', 'Opus THX', 209.90, 'Headphones', 1);
INSERT INTO Artigo(Num_serie, Marca, Modelo, Preço, Categoria, Armazem) VALUES(526137, 'Razer', 'Nari Ultimate Wireless Xbox', 219.90, 'Headphones', 1);
INSERT INTO Artigo(Num_serie, Marca, Modelo, Preço, Categoria, Armazem) VALUES(941430, 'JBL', 'Quantum 200 Gaming Preto', 59.90, 'Headphones', 1);
INSERT INTO Artigo(Num_serie, Marca, Modelo, Preço, Categoria, Armazem) VALUES(393954, 'Asus', 'ROG Strix Go Core', 89.90, 'Headphones', 1);

                          --PSU--
INSERT INTO Artigo(Num_serie, Marca, Modelo, Preço, Categoria, Armazem) VALUES(106808, 'MSI', 'MPG A650GF 650W', 124.90, 'PSU', 1);
INSERT INTO Artigo(Num_serie, Marca, Modelo, Preço, Categoria, Armazem) VALUES(069730, 'Corsair', 'CX-F RGB CX650F 650W', 87.90, 'PSU', 1);
INSERT INTO Artigo(Num_serie, Marca, Modelo, Preço, Categoria, Armazem) VALUES(542967, 'Asus', 'ROG Strix 550W', 119.90, 'PSU', 1);
INSERT INTO Artigo(Num_serie, Marca, Modelo, Preço, Categoria, Armazem) VALUES(917454, 'Seasonic', 'PRIME Snow Silent 650W', 129.90, 'PSU', 1);

                          --CPU--
INSERT INTO Artigo(Num_serie, Marca, Modelo, Preço, Categoria, Armazem) VALUES(127522, 'AMD', 'Ryzen 7 5800X 8-Core 3.8GHz com Turbo 4.7GHz', 472.00, 'Processador', 1);
INSERT INTO Artigo(Num_serie, Marca, Modelo, Preço, Categoria, Armazem) VALUES(686590, 'Intel', 'Core i9-10850K 10-Core 3.6GHz com Turbo 5.2GHz', 487.90, 'Processador', 1);
INSERT INTO Artigo(Num_serie, Marca, Modelo, Preço, Categoria, Armazem) VALUES(750502, 'AMD', 'Ryzen 5 3500X Hexa-Core 3.6GHz com Turbo 4.1GHz', 159.90, 'Processador', 1);
INSERT INTO Artigo(Num_serie, Marca, Modelo, Preço, Categoria, Armazem) VALUES(189519, 'Intel', 'Pentium Gold G5420 Dual-Core 3.8GHz', 49.90, 'Processador', 1);

                          --GPU--
INSERT INTO Artigo(Num_serie, Marca, Modelo, Preço, Categoria, Armazem) VALUES(865514, 'Asus', 'ROG Strix Radeon RX 6800 16GB GDDR6 OC', 794.20, 'Placa gráfica', 1);
INSERT INTO Artigo(Num_serie, Marca, Modelo, Preço, Categoria, Armazem) VALUES(955710, 'Gigabyte', 'GeForce RTX 3060 Ti Eagle OC 8GB GDDR6', 527.90, 'Placa gráfica', 1);
INSERT INTO Artigo(Num_serie, Marca, Modelo, Preço, Categoria, Armazem) VALUES(626252, 'MSI', 'GeForce RTX 3060 Ti Gaming X Trio 8GB GDDR6', 484.90, 'Placa gráfica', 1);
INSERT INTO Artigo(Num_serie, Marca, Modelo, Preço, Categoria, Armazem) VALUES(681755, 'XFX', 'Radeon RX 6800 Speedster MERC319 Black Gaming 16GB', 749.90, 'Placa gráfica', 1);

                          --RAM--
INSERT INTO Artigo(Num_serie, Marca, Modelo, Preço, Categoria, Armazem) VALUES(206622, 'HyperX', 'Fury DDR4 16GB DDR4-3600MHz', 89.90, 'RAM', 1);
INSERT INTO Artigo(Num_serie, Marca, Modelo, Preço, Categoria, Armazem) VALUES(415953, 'Corsair', 'Vengeance RGB Pro 8GB DDR4-3200MHz', 527.90, 'RAM', 1);
INSERT INTO Artigo(Num_serie, Marca, Modelo, Preço, Categoria, Armazem) VALUES(633290, 'HyperX', 'Fury DDR4 16GB DDR4-3000MHz', 92.20, 'RAM', 1);
INSERT INTO Artigo(Num_serie, Marca, Modelo, Preço, Categoria, Armazem) VALUES(900056, 'HyperX', 'Predator RGB 16GB DDR4-3600MHz', 749.90, 'RAM', 1);

                          --DISCO--
INSERT INTO Artigo(Num_serie, Marca, Modelo, Preço, Categoria, Armazem) VALUES(043050, 'Gigabyte', 'SSD Aorus Gen4 2TB', 389.90, 'Disco', 1);
INSERT INTO Artigo(Num_serie, Marca, Modelo, Preço, Categoria, Armazem) VALUES(227731, 'Seagate', 'HDD IronWolf 8TB', 249.90, 'Disco', 1);
INSERT INTO Artigo(Num_serie, Marca, Modelo, Preço, Categoria, Armazem) VALUES(012394, 'Silicon Power', 'SSD Power Ace A55 256GB', 34.90, 'Disco', 1);
INSERT INTO Artigo(Num_serie, Marca, Modelo, Preço, Categoria, Armazem) VALUES(844191, 'Crucial', 'SSD P5 250GB', 749.90, 'Disco', 1);
--------------------------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------MONITORES---------------------------------------------------------
INSERT INTO Monitor VALUES(601867, '27 polegadas', '2560 x 1440', '170Hz');
INSERT INTO Monitor VALUES(892719, '31.5 polegadas', '3840 x 2160', '60Hz');
INSERT INTO Monitor VALUES(915758, '27 polegadas', '1920 x 1080', '144Hz');
INSERT INTO Monitor VALUES(393303, '31.5 polegadas', '3840 x 2160', '75 Hz');
---------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------RATOS------------------------------------------------------------
INSERT INTO Rato VALUES(025986, 20000, 'RGB', 'Sim');
INSERT INTO Rato VALUES(349864, 4200, 'RGB', 'Não');
INSERT INTO Rato VALUES(306304, 6400, 'RGB', 'Não');
INSERT INTO Rato VALUES(467634, 16000, 'RGB', 'Sim');
---------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------TECLADOS---------------------------------------------------------
INSERT INTO Teclado VALUES(071211, 'RGB', 'Não');
INSERT INTO Teclado VALUES(612069, 'RGB', 'Não');
INSERT INTO Teclado VALUES(211896, 'RGB', 'Não');
INSERT INTO Teclado VALUES(249278, 'RGB', 'Não');
----------------------------------------------------------TECLADOS---------------------------------------------------------

----------------------------------------------------------HEADPHONES-------------------------------------------------------
INSERT INTO Headphones VALUES(030707, 'Não', 'Sim');
INSERT INTO Headphones VALUES(526137, 'Sim', 'Sim');
INSERT INTO Headphones VALUES(941430, 'Sim', 'Não');
INSERT INTO Headphones VALUES(393954, 'Sim', 'Não');
----------------------------------------------------------HEADPHONES-------------------------------------------------------

----------------------------------------------------------PSU--------------------------------------------------------------
INSERT INTO PSU VALUES(106808, '650W', '140mm');
INSERT INTO PSU VALUES(069730, '650W', '120mm');
INSERT INTO PSU VALUES(542967, '550W', '135mm');
INSERT INTO PSU VALUES(917454, '650W', '135mm');
----------------------------------------------------------PSU--------------------------------------------------------------

----------------------------------------------------------CPU--------------------------------------------------------------
INSERT INTO CPU VALUES(127522, '3.8GHz com turbo até 4.7GHz', 8, 16, '32 MB');
INSERT INTO CPU VALUES(686590, '3.6GHz com turbo até 5.2GHz', 10, 20, '20 MB');
INSERT INTO CPU VALUES(750502, '3.6GHz com turbo até 4.1GHz', 6, 6, '32 MB');
INSERT INTO CPU VALUES(189519, '3.8GHz', 2, 4, '4 MB');
----------------------------------------------------------CPU--------------------------------------------------------------

----------------------------------------------------------GPU--------------------------------------------------------------
INSERT INTO GPU VALUES(865514, '16GB', 'GDDR6', '2190MHz', 12);
INSERT INTO GPU VALUES(955710, '8GB', 'GDDR6', '1695MHz', 12);
INSERT INTO GPU VALUES(626252, '8GB', 'GDDR6', '1830MHz', 12);
INSERT INTO GPU VALUES(681755, '16GB', 'GDDR6', '2340MHz', 12);
----------------------------------------------------------GPU--------------------------------------------------------------

----------------------------------------------------------RAM-------------------------------------------------------------
INSERT INTO RAM VALUES(206622, '16GB', 'DDR4', '3600MHz');
INSERT INTO RAM VALUES(415953, '8GB', 'DDR4', '3200MHz');
INSERT INTO RAM VALUES(633290, '16GB', 'DDR4', '3000MHz');
INSERT INTO RAM VALUES(900056, '16GB', 'DDR4', '3600MHz');
----------------------------------------------------------RAM--------------------------------------------------------------

----------------------------------------------------------DISCO------------------------------------------------------------
INSERT INTO DISCO VALUES(043050, 'SSD', '2TB');
INSERT INTO DISCO VALUES(227731, 'HDD', '8TB');
INSERT INTO DISCO VALUES(012394, 'SSD', '256GB');
INSERT INTO DISCO VALUES(844191, 'SSD', '250GB');
----------------------------------------------------------DISCO------------------------------------------------------------
