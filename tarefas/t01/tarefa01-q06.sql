-- tarefa01-q06.sql
-- Consulta que retorna nome e salário dos funcionários e a descrição do departamento,
-- mesmo que o funcionário não tenha departamento associado.

SELECT
    f.nome AS nome_funcionario,
    f.salario,
    d.descricao AS departamento
FROM
    funcionario f
LEFT JOIN
    departamento d ON f.cod_depto = d.codigo;
