-- =========================================================
-- Script SQL (MySQL / PostgreSQL) - Salão de Beleza (modelo lógico)
-- =========================================================

CREATE DATABASE IF NOT EXISTS salao_beleza;
USE salao_beleza;

-- ---------------------------------------------------------
-- Tabelas independentes
-- ---------------------------------------------------------

CREATE TABLE Cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome       VARCHAR(100) NOT NULL,
    telefone   VARCHAR(20),
    email      VARCHAR(100)
);

-- Cabeleireiros, manicures, maquiadores etc.
CREATE TABLE Profissional (
    id_profissional INT AUTO_INCREMENT PRIMARY KEY,
    nome            VARCHAR(100) NOT NULL,
    telefone        VARCHAR(20),
    ativo           BOOLEAN NOT NULL DEFAULT TRUE
);

-- Serviços oferecidos pelo salão
CREATE TABLE Procedimento (
    id_procedimento  INT AUTO_INCREMENT PRIMARY KEY,
    nome             VARCHAR(100) NOT NULL,
    descricao        VARCHAR(255),
    duracao_estimada INT,                     -- em minutos (ex.: corte, escova, manicure)
    preco_referencia DECIMAL(10,2)
);

-- Ex.: Coloração, Corte, Unhas, Estética
CREATE TABLE Especialidade (
    id_especialidade INT AUTO_INCREMENT PRIMARY KEY,
    nome             VARCHAR(100) NOT NULL
);

CREATE TABLE Fornecedor (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome          VARCHAR(100) NOT NULL
);

-- Produtos usados nos serviços (tintas, shampoos, esmaltes...)
CREATE TABLE Insumo (
    id_insumo          INT AUTO_INCREMENT PRIMARY KEY,
    nome               VARCHAR(100) NOT NULL,
    quantidade_estoque INT NOT NULL DEFAULT 0,
    estoque_minimo     INT NOT NULL DEFAULT 0
);

CREATE TABLE Fechamento_Caixa (
    id_fechamento  INT AUTO_INCREMENT PRIMARY KEY,
    data_inicio    DATE NOT NULL,
    data_fim       DATE NOT NULL,
    total_recebido DECIMAL(10,2) NOT NULL DEFAULT 0.00
);

-- ---------------------------------------------------------
-- Tabelas com chaves estrangeiras
-- ---------------------------------------------------------

CREATE TABLE Profissional_Especialidade (
    id_profissional  INT NOT NULL,
    id_especialidade INT NOT NULL,
    PRIMARY KEY (id_profissional, id_especialidade),
    FOREIGN KEY (id_profissional)  REFERENCES Profissional(id_profissional),
    FOREIGN KEY (id_especialidade) REFERENCES Especialidade(id_especialidade)
);

CREATE TABLE Agendamento (
    id_agendamento  INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente      INT NOT NULL,
    id_profissional INT NOT NULL,
    id_procedimento INT NOT NULL,
    data            DATE NOT NULL,
    hora_inicio     TIME NOT NULL,
    hora_fim        TIME,
    situacao        VARCHAR(30) NOT NULL DEFAULT 'AGENDADO',  -- AGENDADO, CONCLUIDO, CANCELADO...
    observacoes     VARCHAR(255),
    FOREIGN KEY (id_cliente)      REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_profissional) REFERENCES Profissional(id_profissional),
    FOREIGN KEY (id_procedimento) REFERENCES Procedimento(id_procedimento)
);

CREATE TABLE Pagamento (
    id_pagamento    INT AUTO_INCREMENT PRIMARY KEY,
    valor_pago      DECIMAL(10,2) NOT NULL,
    data_pagamento  DATE NOT NULL,
    forma_pagamento VARCHAR(30) NOT NULL,
    id_agendamento  INT NOT NULL,
    FOREIGN KEY (id_agendamento) REFERENCES Agendamento(id_agendamento)
);

CREATE TABLE Compra (
    id_compra     INT AUTO_INCREMENT PRIMARY KEY,
    id_fornecedor INT NOT NULL,
    data_compra   DATE NOT NULL,
    FOREIGN KEY (id_fornecedor) REFERENCES Fornecedor(id_fornecedor)
);

CREATE TABLE Item_Compra (
    id_item_compra INT AUTO_INCREMENT PRIMARY KEY,
    id_compra      INT NOT NULL,
    id_insumo      INT NOT NULL,
    quantidade     INT NOT NULL,
    valor_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_compra) REFERENCES Compra(id_compra),
    FOREIGN KEY (id_insumo) REFERENCES Insumo(id_insumo)
);

CREATE TABLE Movimentacao_Estoque (
    id_movimentacao   INT AUTO_INCREMENT PRIMARY KEY,
    id_insumo         INT NOT NULL,
    id_agendamento    INT NULL,               -- opcional (0,1)
    tipo_movimentacao VARCHAR(20) NOT NULL,   -- ex.: ENTRADA / SAIDA
    quantidade        INT NOT NULL,
    data_movimentacao DATE NOT NULL,
    FOREIGN KEY (id_insumo)      REFERENCES Insumo(id_insumo),
    FOREIGN KEY (id_agendamento) REFERENCES Agendamento(id_agendamento)
);
