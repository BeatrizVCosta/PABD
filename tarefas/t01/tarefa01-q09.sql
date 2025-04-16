-- tarefa01-q09.sql
-- Questão 09: Selecionar nome dos funcionários responsáveis por projetos, 
-- número de projetos que este funcionário é responsável e seus salários,
-- apenas se ganharem mais que o gerente do seu departamento.
-- Utilizando VIEWS.

-- 1. View com o salário dos gerentes por departamento
CREATE OR REPLACE VIEW salario_gerente_por_departamento AS
SELECT
    d.codigo AS cod_depto,
    f.salario AS salario_gerente
FROM
    departamento d
JOIN
    funcionario f ON d.cod_gerente = f.codigo;

-- 2. View com funcionários responsáveis por projetos e a quantidade de projetos
CREATE OR REPLACE VIEW projetos_por_funcionario AS
SELECT
    f.codigo AS cod_funcionario,
    f.nome,
    f.salario,
    f.cod_depto,
    COUNT(p.codigo) AS qtd_projetos
FROM
    funcionario f
JOIN
    projeto p ON p.cod_responsavel = f.codigo
GROUP BY
    f.codigo, f.nome, f.salario, f.cod_depto;

-- 3. Consulta final combinando as views
SELECT
    pf.nome,
    pf.qtd_projetos,
    pf.salario
FROM
    projetos_por_funcionario pf
JOIN
    salario_gerente_por_departamento sg
    ON pf.cod_depto = sg.cod_depto
WHERE
    pf.salario > sg.salario_gerente;
