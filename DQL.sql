SELECT MIN(salario) FROM tb_funcionario;
SELECT MAX(salario) FROM tb_funcionario;
SELECT COUNT(id) FROM tb_funcionario;
SELECT SUM(salario) FROM tb_funcionario;
SELECT * FROM tb_curso
SELECT *, BIN_TO_UUID(id_aluno), BIN_TO_UUID(id_curso) FROM tb_curso_aluno
SELECT *, BIN_TO_UUID(id) FROM tb_alunos
SELECT * FROM tb_alunos