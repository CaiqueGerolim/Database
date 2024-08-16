CREATE DATABASE Veterinaria;

USE Veterinaria;

CREATE TABLE veterinarios(
id BINARY(16) NOT NULL,
nome VARCHAR(255) NOT NULL,
especialidade VARCHAR(255) NOT NULL,
telefone DECIMAL(65) NOT NULL,
PRIMARY KEY (id)
);

DROP TABLE veterinarios;

CREATE TABLE clientes (
id BINARY(16) NOT NULL,
nome VARCHAR(255) NOT NULL,
endereco VARCHAR(255) NOT NULL,
telefone DECIMAL(65) NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE pets (
id BINARY(16) NOT NULL,
nome VARCHAR(255) NOT NULL,
tipo VARCHAR(255) NOT NULL,
raca VARCHAR(255) NOT NULL,
nascimento DATETIME NOT NULL,
id_cliente BINARY(16) NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (id_cliente) REFERENCES clientes(id)
);

CREATE TABLE atendimento (
id BINARY(16) NOT NULL,
id_pet BINARY(16) NOT NULL,
id_veterinario BINARY(16) NOT NULL,
data_atendimento DATETIME NOT NULL,
descricao VARCHAR(255),
PRIMARY KEY (id),
FOREIGN KEY (id_pet) REFERENCES pets(id),
FOREIGN KEY (id_veterinario) REFERENCES veterinarios(id)
);



INSERT INTO veterinarios VALUES (
UUID_TO_BIN(UUID()),
"Ronaldo",
"Piriquito",
"40028922"
);

INSERT INTO veterinarios VALUES (
UUID_TO_BIN(UUID()),
"Kleber",
"Cachorro",
"40038933"
);

INSERT INTO veterinarios VALUES (
UUID_TO_BIN(UUID()),
"Rogerio",
"Pinto",
"41128944"
);



INSERT INTO clientes VALUE (
UUID_TO_BIN(UUID()),
"Raissa",
"Rua Rio Grande do Sul",
"11987283990"
);

INSERT INTO clientes VALUE (
UUID_TO_BIN(UUID()),
"Ryan",
"Avenina Loretto",
"11304929933"
);

INSERT INTO clientes VALUE (
UUID_TO_BIN(UUID()),
"Rute",
"Vila Luzita",
"113344353033"
);

INSERT INTO pets VALUES (
UUID_TO_BIN(UUID()),
"Nina",
"Cachorro",
"Shitzu",
"2021-10-22"
"59992314-460a-11ef-b0f7-b445067b8769"
);

INSERT INTO pets VALUES (
UUID_TO_BIN(UUID()),
"Kaue",
"Cachorro",
"Vira-Lata",
"12-06-2020",
"94c40519-460a-11ef-b0f7-b445067b8769"
);

INSERT INTO pets VALUES (
UUID_TO_BIN(UUID()),
"Guigui",
"Gato",
"Siamês",
"12-11-2020",
"94c0700d-460a-11ef-b0f7-b445067b8769"
);

SELECT *, BIN_TO_UUID(id) FROM clientes;
SELECT *, BIN_TO_UUID(id) FROM pets;
UPDATE veterinarios SET especialidade = "Dermatologia" WHERE id = UUID_TO_BIN("a7bea86b-4608-11ef-b0f7-b445067b8769")