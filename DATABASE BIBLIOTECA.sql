/* Criação do Banco de Dados */
CREATE DATABASE Biblioteca; 

/* O acesso para o Banco de Dados */
USE Biblioteca; 

/*Criar uma tabela com a ordem de o nome da tabela, o tipo e a quantidade de caracteres*/
CREATE TABLE tb_autores (
id BINARY(16) NOT NULL,
nome VARCHAR(255) NOT NULL,
data_nascimento DATETIME NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE tb_livros(
id BINARY(16) NOT NULL,
titulo VARCHAR(255) NOT NULL,
ano_publicacao DATETIME NOT NULL,
id_autor BINARY(16) NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (id_autor) REFERENCES tb_autores(id)
);

CREATE TABLE tb_membros(
id BINARY(16) NOT NULL,
nome VARCHAR(255) NOT NULL,
data_adesao DATETIME NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE tb_emprestimo(
id BINARY(16) NOT NULL,
id_membro BINARY(16) NOT NULL,
id_livro BINARY(16) NOT NULL,
data_emprestimo DATETIME NOT NULL,
data_devolucao DATETIME NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (id_membro) REFERENCES tb_membros(id),
FOREIGN KEY (id_livro) REFERENCES tb_livros(id)
);

/*Insercao de algum dado para a tabela*/
INSERT INTO tb_autores VALUES (
UUID_TO_BIN(UUID()),
"Victor Hugo",
"1950-01-22"
);

INSERT INTO tb_autores VALUES (
UUID_TO_BIN(UUID()),
"Robert Louis Stevenson",
"1802-02-26"
);

INSERT INTO tb_autores VALUES (
UUID_TO_BIN(UUID()),
"Oscar Wilde",
"1854-10-16"
);

INSERT INTO tb_livros VALUES (
UUID_TO_BIN(UUID()),
"O homem que ri",
"1869-12-09",
UUID_TO_BIN("94cc3da8-45f5-11ef-b0f7-b445067b8769")
);

/*TB LIVROS*/

INSERT INTO tb_livros VALUES (
UUID_TO_BIN(UUID()),
"A ilha do tesouro",
"1883-12-09",
UUID_TO_BIN("a1be3670-45f5-11ef-b0f7-b445067b8769")
);

INSERT INTO tb_livros VALUES (
UUID_TO_BIN(UUID()),
"O Retrato de Dorian Gray",
"1890-12-09",
UUID_TO_BIN("b56f69a2-45f5-11ef-b0f7-b445067b8769")
);

/*TB MEMBROS*/

INSERT INTO tb_membros VALUES (
UUID_TO_BIN(UUID()),
"Caique",
"2020-02-15"
);

INSERT INTO tb_membros VALUES (
UUID_TO_BIN(UUID()),
"Guilherme",
"2020-01-20"
);

INSERT INTO tb_membros VALUES (
UUID_TO_BIN(UUID()),
"Kaue",
"2020-08-30"
);

/*TB IMPRESTIMO*/
INSERT INTO tb_emprestimo VALUES(
UUID_TO_BIN(UUID()),
UUID_TO_BIN("f63bcd21-45f8-11ef-b0f7-b445067b8769"),
UUID_TO_BIN("cac2c0c0-45f7-11ef-b0f7-b445067b8769"),
"2020-09-30",
"2020-10-30"
);

INSERT INTO tb_emprestimo VALUES(
UUID_TO_BIN(UUID()),
UUID_TO_BIN("f63c6fe4-45f8-11ef-b0f7-b445067b8769"),
UUID_TO_BIN("cac2c0c0-45f7-11ef-b0f7-b445067b8769"),
"2020-09-30",
"2020-10-30"
);

INSERT INTO tb_emprestimo VALUES(
UUID_TO_BIN(UUID()),
UUID_TO_BIN("f33612b1-45f8-11ef-b0f7-b445067b8769"),
UUID_TO_BIN("7624f3ca-45f7-11ef-b0f7-b445067b8769"),
"2023-09-30",
"2023-11-20"
);

/*Ver a tabela*/
SELECT *, BIN_TO_UUID(id) FROM tb_membros;
SELECT *, BIN_TO_UUID(id) FROM tb_livros;
SELECT *, BIN_TO_UUID(id) FROM tb_emprestimo;

SELECT * FROM tb_membros;








SELECT MIN(ano_publicacao) FROM tb_livros; /*O livro mais antigo publicado*/
SELECT MAX(ano_publicacao) FROM tb_livros; /*O livro mais novo publicado*/
SELECT COUNT(ano_publicacao) FROM tb_livros; /*Contar quantos livros tem*/
SELECT * FROM tb_livros ORDER BY titulo ASC; /*Ordem crescente ASC e decrescente DESC*/
SELECT * FROM tb_autores ORDER BY nome ASC; /*Ordem crescente ASC e decrescente DESC*/
