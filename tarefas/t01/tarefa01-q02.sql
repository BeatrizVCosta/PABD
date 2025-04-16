-- tarefa01-q02.sql
-- Consulta que seleciona todos os funcionários, exceto o mais idoso

SELECT nome
FROM funcionario
WHERE dt_nasc > (
    SELECT MIN(dt_nasc)
    FROM funcionario
);
