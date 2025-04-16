-- Inserindo departamentos (alguns sem gerente inicialmente)
INSERT INTO departamento (descricao, cod_gerente) VALUES 
('TI', NULL),
('RH', NULL),
('Marketing', NULL);

-- Inserindo funcionários (alguns com e outros sem departamento)
INSERT INTO funcionario (nome, sexo, dt_nasc, salario, cod_depto) VALUES
('João Silva', 'M', '1980-01-01', 7000.00, 1),  -- futuro gerente TI
('Maria Souza', 'F', '1990-05-10', 4500.00, 2),  -- futura gerente RH
('Carlos Lima', 'M', '1985-03-15', 3000.00, 1),
('Ana Paula', 'F', '1995-07-22', 5000.00, 2),
('Bruno Costa', 'M', '1998-12-12', 8000.00, 1),  -- salário maior que gerente
('Rita Lopes', 'F', '2000-11-11', 4200.00, NULL); -- sem departamento

-- Atualizando os gerentes nos departamentos
UPDATE departamento SET cod_gerente = 1 WHERE codigo = 1;
UPDATE departamento SET cod_gerente = 2 WHERE codigo = 2;

-- Inserindo projetos (um com e outro sem responsável)
INSERT INTO projeto (nome, descricao, cod_depto, cod_responsavel, data_inicio, data_fim) VALUES
('Sistema Interno', 'Desenvolvimento do sistema', 1, 3, '2024-01-01', '2024-12-31'),
('Treinamento RH', 'Capacitação de pessoal', 2, 4, '2024-02-01', '2024-06-30'),
('Campanha Publicitária', 'Lançamento de campanha', 3, NULL, '2024-03-01', '2024-08-31');

-- Inserindo atividades (uma com e outra sem responsável)
INSERT INTO atividade (nome, descricao, cod_responsavel, data_inicio, data_fim) VALUES
('Desenvolver módulo A', 'Módulo A do sistema', 3, '2024-01-01', '2024-03-31'),
('Elaborar treinamento', 'Treinamento para novos funcionários', 4, '2024-02-01', '2024-04-30'),
('Ajustar orçamento', 'Análise financeira', NULL, '2024-03-01', '2024-05-15');

-- Relacionando atividades aos projetos
INSERT INTO atividade_projeto (cod_projeto, cod_atividade) VALUES
(1, 1),
(2, 2);
