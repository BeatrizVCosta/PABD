-- Departamento
INSERT INTO departamento (codigo, descricao, cod_gerente) VALUES
(1, 'TI', 1),
(2, 'RH', 2),
(3, 'Financeiro', 3),
(4, 'Marketing', 4),
(5, 'Projetos', 5);

-- Funcionário
INSERT INTO funcionario (codigo, nome, sexo, dt_nasc, salario, cod_depto)
VALUES
(1, 'Ana Souza', 'F', '1985-03-12', 5000, NULL),  -- gerente
(2, 'Carlos Lima', 'M', '1990-07-22', 3000, NULL),
(3, 'Marina Dias', 'F', '1992-11-03', 3200, NULL),
(4, 'João Pedro', 'M', '1988-01-15', 2800, NULL),
(5, 'Fernanda Melo', 'F', '1995-06-09', 3100, NULL);
-- Projeto
INSERT INTO projeto (codigo, nome, descricao, cod_depto, cod_responsavel, data_inicio, data_fim) VALUES
(1, 'Sistema Interno', 'Desenvolvimento de sistema interno', 1, 1, '2023-01-01', '2023-06-30'),
(2, 'Portal RH', 'Criação de portal para RH', 2, 2, '2023-02-15', '2023-09-30'),
(3, 'Controle Financeiro', 'Sistema financeiro web', 3, 3, '2023-03-01', '2023-12-31'),
(4, 'Campanha Digital', 'Campanha de marketing online', 4, 4, '2023-04-10', '2023-07-15'),
(5, 'Novo Produto', 'Lançamento de produto novo', 5, 5, '2023-05-20', '2023-11-30');

-- Atividade
INSERT INTO atividade (codigo, nome, descricao, cod_responsavel, data_inicio, data_fim) VALUES
(1, 'Levantamento de Requisitos', 'Entrevistas com usuários', 1, '2023-01-01', '2023-01-15'),
(2, 'Design de Interface', 'Protótipos de tela', 2, '2023-02-01', '2023-02-28'),
(3, 'Implementação Backend', 'APIs e lógica', 3, '2023-03-01', '2023-06-01'),
(4, 'Testes Funcionais', 'Testes com usuários', 4, '2023-04-01', '2023-04-20'),
(5, 'Documentação Final', 'Entrega da documentação', 5, '2023-05-01', '2023-05-15');

-- Atividade_Projeto
INSERT INTO atividade_projeto (cod_projeto, cod_atividade) VALUES
(1, 1),
(1, 3),
(2, 2),
(3, 4),
(5, 5);
