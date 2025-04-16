CREATE TABLE departamento (
  codigo SERIAL PRIMARY KEY,
  descricao VARCHAR(100),
  cod_gerente INTEGER
);

CREATE TABLE funcionario (
  codigo SERIAL PRIMARY KEY,
  nome VARCHAR(100),
  sexo CHAR(1),
  dt_nasc DATE,
  salario NUMERIC,
  cod_depto INTEGER REFERENCES departamento(codigo)
);

ALTER TABLE departamento
  ADD FOREIGN KEY (cod_gerente) REFERENCES funcionario(codigo);

CREATE TABLE projeto (
  codigo SERIAL PRIMARY KEY,
  nome VARCHAR(100),
  descricao TEXT,
  cod_depto INTEGER REFERENCES departamento(codigo),
  cod_responsavel INTEGER REFERENCES funcionario(codigo),
  data_inicio DATE,
  data_fim DATE
);

CREATE TABLE atividade (
  codigo SERIAL PRIMARY KEY,
  nome VARCHAR(100),
  descricao TEXT,
  cod_responsavel INTEGER REFERENCES funcionario(codigo),
  data_inicio DATE,
  data_fim DATE
);

CREATE TABLE atividade_projeto (
  cod_projeto INTEGER REFERENCES projeto(codigo),
  cod_atividade INTEGER REFERENCES atividade(codigo),
  PRIMARY KEY (cod_projeto, cod_atividade)
);
