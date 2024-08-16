
CREATE DATABASE senai
USE senai

CREATE TABLE tb_alunos (
id BINARY(16) NOT NULL,
nome VARCHAR(255) NOT NULL,
email VARCHAR(255) NOT NULL,
senha VARCHAR(65) NOT NULL,
endereco VARCHAR(255),
cep DECIMAL(10),
PRIMARY KEY(id)
);

DROP TABLE tb_alunos

CREATE TABLE tb_funcionario (
id BINARY(16) NOT NULL,
nome VARCHAR(255) NOT NULL,
cargo VARCHAR(255) NOT NULL,
salario DECIMAL(6) NOT NULL,
departamento VARCHAR(255) NOT NULL,
idade DECIMAL(3) NOT NULL,
cpf VARCHAR(13) NOT NULL UNIQUE,
PRIMARY KEY(id)
);

CREATE TABLE tb_curso (
id BINARY(16) NOT NULL,
nome VARCHAR(255) NOT NULL,
disciplina VARCHAR(255) NOT NULL,
tempo_duracao DECIMAL(65) NOT NULL,
professor VARCHAR(65) NOT NULL,
PRIMARY KEY(id)
);

INSERT INTO tb_alunos VALUES(
UUID_TO_BIN(UUID()),
"Caique",
"caiquegsantos1@gmail.com",
"senhalegal134",
"Rua do Melao",
"12345345"
);

INSERT INTO tb_alunos VALUES(
UUID_TO_BIN(UUID()),
"Kaue",
"kaue@gmail.com",
"senhaa",
"Rua Melancia",
"12345678"
);

INSERT INTO tb_funcionario VALUES(
UUID_TO_BIN(UUID()),
"Ronaldo",
"Cabo",
"3800.00",
"liderar pequenas equipes de soldados",
"38",
"51054241821"
);

INSERT INTO tb_funcionario VALUES(
UUID_TO_BIN(UUID()),
"Klebi",
"Soldado",
"1857.00",
"servem nas Forças Armadas e protegem a si mesmos",
"32",
"31933255421"
);

INSERT INTO tb_curso VALUES(
UUID_TO_BIN(UUID()),
"Caique",
"Desenvolvimento de games",
"20.00",
"Jonathan"
);

INSERT INTO tb_curso VALUES(
UUID_TO_BIN(UUID()),
"Carlos",
"Desenvolvimento de games",
"25.00",
"Jamira"
);

SELECT *, BIN_TO_UUID(id) FROM tb_alunos
SELECT * FROM tb_alunos


UPDATE tb_alunos SET email = "kaueggg@gmail.com" WHERE id = UUID_TO_BIN("6aef1085-452c-11ef-b0f7-b445067b8769")

DELETE FROM tb_alunos WHERE id= UUID_TO_BIN("6aef1085-452c-11ef-b0f7-b445067b8769")

SELECT MIN(salario) FROM tb_funcionario;
SELECT MAX(salario) FROM tb_funcionario;

SELECT COUNT(id) FROM tb_funcionario;
SELECT SUM(salario) FROM tb_funcionario;

CREATE TABLE tb_curso_aluno (
id_aluno BINARY(16) NOT NULL,
id_curso BINARY(16) NOT NULL,
FOREIGN KEY (id_aluno) REFERENCES tb_alunos(id),
FOREIGN KEY (id_curso) REFERENCES tb_curso(id)
);

INSERT INTO tb_curso_aluno VALUES (
UUID_TO_BIN("6e419da1-452c-11ef-b0f7-b445067b8769"),
UUID_TO_BIN("bd793cab-4479-11ef-b0f7-b445067b8769")
);

SELECT * FROM tb_curso
SELECT *, BIN_TO_UUID(id_aluno), BIN_TO_UUID(id_curso) FROM tb_curso_aluno