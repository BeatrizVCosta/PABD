-- tarefa01-q12.sql
-- Questão 12: Faça uma consulta que selecione o nome do projeto, data de início e fim do projeto, 
-- a descrição da atividade do projeto, data de início e fim da atividade.
SELECT 
    p.nome AS nome_projeto,
    p.data_inicio AS data_inicio_projeto,
    p.data_fim AS data_fim_projeto,
    a.descricao AS descricao_atividade,
    a.data_inicio AS data_inicio_atividade,
    a.data_fim AS data_fim_atividade
FROM 
    projeto p
JOIN 
    atividade_projeto ap ON p.codigo = ap.cod_projeto
JOIN 
    atividade a ON ap.cod_atividade = a.codigo;
