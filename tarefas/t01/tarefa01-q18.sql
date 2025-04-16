-- tarefa01-q18.sql
-- Questão 18: Faça uma consulta que selecione o nome dos funcionários com maior salário de seu departamento,
--  mesmo que não tenha departamento associado, e o nome dos respectivos departamentos. 
-- Exiba em ordem crescente de acordo com o salário
SELECT 
    f.nome AS nome_funcionario,
    d.descricao AS nome_departamento,
    f.salario
FROM 
    funcionario f
LEFT JOIN 
    departamento d ON f.cod_depto = d.codigo
WHERE 
    f.salario = (
        SELECT MAX(salario)
        FROM funcionario
        WHERE cod_depto = f.cod_depto OR (f.cod_depto IS NULL AND cod_depto IS NULL)
    )
ORDER BY 
    f.salario ASC;
