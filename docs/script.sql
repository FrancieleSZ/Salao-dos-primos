-- =====================================================================
-- SALÃO DOS PRIMOS — Script SQL completo (MySQL 8.0.16 ou superior)
-- Entrega 2 · Modelagem de Banco de Dados · UNICID · 2026-2
--
-- Ordem do script:
--   1  CREATE DATABASE
--   2  CREATE TABLE (tipos adequados)
--   3  Constraints: PK, FK, NOT NULL, UNIQUE, CHECK (+ DEFAULT) e triggers
--   4  INSERT INTO — massa de dados (a mesma de docs/massa_de_dados.sql)
--   5  SELECT com JOIN
--   6  UPDATE e DELETE
--   7  Consultas gerenciais (G) e de auditoria (A)
--
-- Como executar: abra este arquivo no MySQL Workbench e rode tudo
-- (ícone do raio ou Ctrl+Shift+Enter). Requer MySQL 8.0.16+ por causa do
-- CHECK. O script recria o banco do zero a cada execução.
-- =====================================================================


-- =====================================================================
-- 1. CREATE DATABASE
-- =====================================================================
DROP DATABASE IF EXISTS salao_dos_primos;
CREATE DATABASE salao_dos_primos CHARACTER SET utf8mb4;
USE salao_dos_primos;


-- =====================================================================
-- 2. CREATE TABLE
-- =====================================================================

-- Pessoas que são atendidas no salão
CREATE TABLE Cliente (
    id_cliente      INT          NOT NULL AUTO_INCREMENT,
    nome_completo   VARCHAR(100) NOT NULL,
    telefone        VARCHAR(11)  NOT NULL,              -- somente dígitos, com DDD (WhatsApp)
    email           VARCHAR(100) NULL,
    data_cadastro   DATE         NOT NULL DEFAULT (CURRENT_DATE),
    observacoes     VARCHAR(255) NULL,
    PRIMARY KEY (id_cliente)
);

-- Cabeleireiros, manicures, maquiadores etc.
CREATE TABLE Profissional (
    id_profissional INT          NOT NULL AUTO_INCREMENT,
    nome_completo   VARCHAR(100) NOT NULL,
    telefone        VARCHAR(11)  NOT NULL,
    data_admissao   DATE         NOT NULL,
    ativo           BOOLEAN      NOT NULL DEFAULT TRUE,
    PRIMARY KEY (id_profissional)
);

-- Áreas de atuação: Corte, Coloração, Manicure e Pedicure...
CREATE TABLE Especialidade (
    id_especialidade INT         NOT NULL AUTO_INCREMENT,
    nome             VARCHAR(60) NOT NULL,
    descricao        VARCHAR(255) NULL,
    PRIMARY KEY (id_especialidade)
);

-- Associativa N:N entre Profissional e Especialidade
CREATE TABLE Profissional_Especialidade (
    id_profissional  INT NOT NULL,
    id_especialidade INT NOT NULL,
    PRIMARY KEY (id_profissional, id_especialidade)
);

-- Serviços oferecidos. O preço final é definido após avaliação do cliente,
-- por isso aqui existe apenas um preço de REFERÊNCIA.
CREATE TABLE Procedimento (
    id_procedimento  INT           NOT NULL AUTO_INCREMENT,
    nome             VARCHAR(80)   NOT NULL,
    descricao        VARCHAR(255)  NULL,
    duracao_estimada INT           NOT NULL,            -- em minutos
    preco_referencia DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_procedimento)
);

CREATE TABLE Agendamento (
    id_agendamento   INT         NOT NULL AUTO_INCREMENT,
    id_cliente       INT         NOT NULL,
    id_profissional  INT         NOT NULL,
    id_procedimento  INT         NOT NULL,
    data_agendamento DATE        NOT NULL,
    hora_inicio      TIME        NOT NULL,
    hora_fim         TIME        NOT NULL,
    situacao         VARCHAR(10) NOT NULL DEFAULT 'AGENDADO',
    observacoes      VARCHAR(255) NULL,
    PRIMARY KEY (id_agendamento)
);

-- Pagamento é presencial e o valor varia conforme a avaliação do serviço
CREATE TABLE Pagamento (
    id_pagamento     INT           NOT NULL AUTO_INCREMENT,
    id_agendamento   INT           NOT NULL,
    valor_pago       DECIMAL(10,2) NOT NULL,
    data_pagamento   DATE          NOT NULL,
    forma_pagamento  VARCHAR(20)   NOT NULL,
    PRIMARY KEY (id_pagamento)
);

CREATE TABLE Fornecedor (
    id_fornecedor    INT          NOT NULL AUTO_INCREMENT,
    nome             VARCHAR(100) NOT NULL,
    telefone         VARCHAR(11)  NULL,
    PRIMARY KEY (id_fornecedor)
);

CREATE TABLE Compra (
    id_compra        INT  NOT NULL AUTO_INCREMENT,
    id_fornecedor    INT  NOT NULL,
    data_compra      DATE NOT NULL,
    PRIMARY KEY (id_compra)
);

-- Produtos usados nos serviços: tintas, shampoos, esmaltes...
CREATE TABLE Insumo (
    id_insumo          INT         NOT NULL AUTO_INCREMENT,
    nome               VARCHAR(100) NOT NULL,
    unidade_medida     VARCHAR(10) NOT NULL DEFAULT 'un',
    quantidade_estoque INT         NOT NULL DEFAULT 0,
    estoque_minimo     INT         NOT NULL DEFAULT 0,
    PRIMARY KEY (id_insumo)
);

CREATE TABLE Item_Compra (
    id_item_compra   INT           NOT NULL AUTO_INCREMENT,
    id_compra        INT           NOT NULL,
    id_insumo        INT           NOT NULL,
    quantidade       INT           NOT NULL,
    valor_unitario   DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_item_compra)
);

CREATE TABLE Movimentacao_Estoque (
    id_movimentacao   INT         NOT NULL AUTO_INCREMENT,
    id_insumo         INT         NOT NULL,
    id_agendamento    INT         NULL,                 -- opcional (0,1): saída ligada a um atendimento
    tipo_movimentacao VARCHAR(10) NOT NULL,
    quantidade        INT         NOT NULL,
    data_movimentacao DATE        NOT NULL,
    PRIMARY KEY (id_movimentacao)
);

CREATE TABLE Fechamento_Caixa (
    id_fechamento    INT           NOT NULL AUTO_INCREMENT,
    data_inicio      DATE          NOT NULL,
    data_fim         DATE          NOT NULL,
    total_recebido   DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    PRIMARY KEY (id_fechamento)
);


-- =====================================================================
-- 3. CONSTRAINTS (FK, UNIQUE, CHECK) — o código RNxx indica a regra atendida
-- =====================================================================

-- Cliente — RN12
ALTER TABLE Cliente
    ADD CONSTRAINT uq_cliente_telefone UNIQUE (telefone),
    ADD CONSTRAINT uq_cliente_email    UNIQUE (email),
    ADD CONSTRAINT ck_cliente_telefone CHECK (telefone REGEXP '^[0-9]{10,11}$'),
    ADD CONSTRAINT ck_cliente_email    CHECK (email LIKE '%_@_%._%');

-- Profissional
ALTER TABLE Profissional
    ADD CONSTRAINT ck_profissional_telefone CHECK (telefone REGEXP '^[0-9]{10,11}$');

-- Especialidade
ALTER TABLE Especialidade
    ADD CONSTRAINT uq_especialidade_nome UNIQUE (nome);

-- Profissional_Especialidade
ALTER TABLE Profissional_Especialidade
    ADD CONSTRAINT fk_pe_profissional  FOREIGN KEY (id_profissional)  REFERENCES Profissional(id_profissional),
    ADD CONSTRAINT fk_pe_especialidade FOREIGN KEY (id_especialidade) REFERENCES Especialidade(id_especialidade);

-- Procedimento
ALTER TABLE Procedimento
    ADD CONSTRAINT uq_procedimento_nome   UNIQUE (nome),
    ADD CONSTRAINT ck_procedimento_duracao CHECK (duracao_estimada > 0),
    ADD CONSTRAINT ck_procedimento_preco   CHECK (preco_referencia >= 0);

-- Agendamento — RN01, RN02, RN03
ALTER TABLE Agendamento
    ADD CONSTRAINT fk_agendamento_cliente      FOREIGN KEY (id_cliente)      REFERENCES Cliente(id_cliente),
    ADD CONSTRAINT fk_agendamento_profissional FOREIGN KEY (id_profissional) REFERENCES Profissional(id_profissional),
    ADD CONSTRAINT fk_agendamento_procedimento FOREIGN KEY (id_procedimento) REFERENCES Procedimento(id_procedimento),
    ADD CONSTRAINT ck_agendamento_horario      CHECK (hora_fim > hora_inicio),
    ADD CONSTRAINT ck_agendamento_situacao     CHECK (situacao IN ('AGENDADO', 'CONCLUIDO', 'CANCELADO'));

-- Pagamento — RN06 (no máximo um pagamento por agendamento)
ALTER TABLE Pagamento
    ADD CONSTRAINT fk_pagamento_agendamento FOREIGN KEY (id_agendamento) REFERENCES Agendamento(id_agendamento),
    ADD CONSTRAINT uq_pagamento_agendamento UNIQUE (id_agendamento),
    ADD CONSTRAINT ck_pagamento_valor       CHECK (valor_pago > 0),
    ADD CONSTRAINT ck_pagamento_forma       CHECK (forma_pagamento IN ('DINHEIRO', 'PIX', 'CARTAO_DEBITO', 'CARTAO_CREDITO'));

-- Fornecedor
ALTER TABLE Fornecedor
    ADD CONSTRAINT uq_fornecedor_nome     UNIQUE (nome),
    ADD CONSTRAINT ck_fornecedor_telefone CHECK (telefone REGEXP '^[0-9]{10,11}$');

-- Compra — RN07
ALTER TABLE Compra
    ADD CONSTRAINT fk_compra_fornecedor FOREIGN KEY (id_fornecedor) REFERENCES Fornecedor(id_fornecedor);

-- Insumo — RN13
ALTER TABLE Insumo
    ADD CONSTRAINT uq_insumo_nome       UNIQUE (nome),
    ADD CONSTRAINT ck_insumo_estoque    CHECK (quantidade_estoque >= 0),
    ADD CONSTRAINT ck_insumo_minimo     CHECK (estoque_minimo >= 0);

-- Item_Compra — RN08
ALTER TABLE Item_Compra
    ADD CONSTRAINT fk_item_compra  FOREIGN KEY (id_compra) REFERENCES Compra(id_compra),
    ADD CONSTRAINT fk_item_insumo  FOREIGN KEY (id_insumo) REFERENCES Insumo(id_insumo),
    ADD CONSTRAINT uq_item_compra_insumo UNIQUE (id_compra, id_insumo),
    ADD CONSTRAINT ck_item_quantidade CHECK (quantidade > 0),
    ADD CONSTRAINT ck_item_valor      CHECK (valor_unitario >= 0);

-- Movimentacao_Estoque — RN09, RN13
ALTER TABLE Movimentacao_Estoque
    ADD CONSTRAINT fk_mov_insumo      FOREIGN KEY (id_insumo)      REFERENCES Insumo(id_insumo),
    ADD CONSTRAINT fk_mov_agendamento FOREIGN KEY (id_agendamento) REFERENCES Agendamento(id_agendamento),
    ADD CONSTRAINT ck_mov_tipo        CHECK (tipo_movimentacao IN ('ENTRADA', 'SAIDA')),
    ADD CONSTRAINT ck_mov_quantidade  CHECK (quantidade > 0);

-- Fechamento_Caixa — RN10
ALTER TABLE Fechamento_Caixa
    ADD CONSTRAINT uq_fechamento_periodo UNIQUE (data_inicio, data_fim),
    ADD CONSTRAINT ck_fechamento_periodo CHECK (data_fim >= data_inicio),
    ADD CONSTRAINT ck_fechamento_total   CHECK (total_recebido >= 0);


DELIMITER //

-- =========================================================
-- TRIGGERS DE CONTROLE DE ESTOQUE — RN09 e RN13
-- Atualizam o saldo automaticamente pelas movimentações.
-- =========================================================

-- Impede uma saída maior que o estoque disponível
CREATE TRIGGER trg_estoque_bi
BEFORE INSERT ON Movimentacao_Estoque
FOR EACH ROW
BEGIN
    DECLARE v_estoque INT;

    SELECT quantidade_estoque INTO v_estoque
      FROM Insumo
     WHERE id_insumo = NEW.id_insumo;

    IF NEW.tipo_movimentacao = 'SAIDA'
       AND NEW.quantidade > v_estoque THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Estoque insuficiente para realizar esta saida';
    END IF;
END//

-- Atualiza o saldo após inserir uma movimentação
CREATE TRIGGER trg_estoque_ai
AFTER INSERT ON Movimentacao_Estoque
FOR EACH ROW
BEGIN
    UPDATE Insumo
       SET quantidade_estoque =
           quantidade_estoque +
           CASE
               WHEN NEW.tipo_movimentacao = 'ENTRADA'
               THEN NEW.quantidade
               ELSE -NEW.quantidade
           END
     WHERE id_insumo = NEW.id_insumo;
END//

-- Impede alterações que deixariam o estoque negativo
CREATE TRIGGER trg_estoque_bu
BEFORE UPDATE ON Movimentacao_Estoque
FOR EACH ROW
BEGIN
    DECLARE v_estoque INT;
    DECLARE v_novo_saldo INT;

    SELECT quantidade_estoque INTO v_estoque
      FROM Insumo
     WHERE id_insumo = OLD.id_insumo;

    SET v_novo_saldo = v_estoque
        + CASE
            WHEN OLD.tipo_movimentacao = 'ENTRADA'
            THEN -OLD.quantidade
            ELSE OLD.quantidade
          END
        + CASE
            WHEN NEW.tipo_movimentacao = 'ENTRADA'
            THEN NEW.quantidade
            ELSE -NEW.quantidade
          END;

    IF OLD.id_insumo <> NEW.id_insumo THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Nao altere o insumo de uma movimentacao existente';
    END IF;

    IF v_novo_saldo < 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Alteracao deixaria o estoque negativo';
    END IF;
END//

-- Atualiza o saldo após alterar uma movimentação
CREATE TRIGGER trg_estoque_au
AFTER UPDATE ON Movimentacao_Estoque
FOR EACH ROW
BEGIN
    UPDATE Insumo
       SET quantidade_estoque =
           quantidade_estoque
           + CASE
               WHEN OLD.tipo_movimentacao = 'ENTRADA'
               THEN -OLD.quantidade
               ELSE OLD.quantidade
             END
           + CASE
               WHEN NEW.tipo_movimentacao = 'ENTRADA'
               THEN NEW.quantidade
               ELSE -NEW.quantidade
             END
     WHERE id_insumo = NEW.id_insumo;
END//

-- Reverte o efeito da movimentação quando ela é excluída
CREATE TRIGGER trg_estoque_ad
AFTER DELETE ON Movimentacao_Estoque
FOR EACH ROW
BEGIN
    UPDATE Insumo
       SET quantidade_estoque =
           quantidade_estoque +
           CASE
               WHEN OLD.tipo_movimentacao = 'ENTRADA'
               THEN -OLD.quantidade
               ELSE OLD.quantidade
           END
     WHERE id_insumo = OLD.id_insumo;
END//



-- ---------------------------------------------------------------------
-- Triggers — RN04 (sem conflito de horário) e RN05 (profissional inativo)
-- O CHECK não consulta outras linhas, então essas duas regras ficam em trigger.
-- ---------------------------------------------------------------------
CREATE TRIGGER trg_agendamento_bi
BEFORE INSERT ON Agendamento
FOR EACH ROW
BEGIN
    DECLARE v_ativo BOOLEAN;
    DECLARE v_conflitos INT;

    IF NEW.situacao = 'AGENDADO' THEN
        -- RN05: profissional inativo não pode receber novo agendamento.
        SELECT ativo INTO v_ativo
          FROM Profissional
         WHERE id_profissional = NEW.id_profissional;

        IF v_ativo = FALSE THEN
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'RN05: profissional inativo nao pode receber novos agendamentos';
        END IF;

        -- RN04: impede sobreposição com outro agendamento ativo.
        SELECT COUNT(*) INTO v_conflitos
          FROM Agendamento a
         WHERE a.id_profissional   = NEW.id_profissional
           AND a.data_agendamento  = NEW.data_agendamento
           AND a.situacao          = 'AGENDADO'
           AND NEW.hora_inicio < a.hora_fim
           AND NEW.hora_fim    > a.hora_inicio;

        IF v_conflitos > 0 THEN
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'RN04: o profissional ja possui agendamento nesse horario';
        END IF;
    END IF;
END//

CREATE TRIGGER trg_agendamento_bu
BEFORE UPDATE ON Agendamento
FOR EACH ROW
BEGIN
    DECLARE v_ativo BOOLEAN;
    DECLARE v_conflitos INT;

    IF NEW.situacao = 'AGENDADO' THEN
        -- RN05: impede agendamento com profissional inativo
        SELECT ativo INTO v_ativo
          FROM Profissional
         WHERE id_profissional = NEW.id_profissional;

        IF v_ativo = FALSE THEN
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'RN05: profissional inativo nao pode receber agendamentos';
        END IF;

        -- RN04: impede conflito de horário
        SELECT COUNT(*) INTO v_conflitos
          FROM Agendamento a
         WHERE a.id_profissional   = NEW.id_profissional
           AND a.data_agendamento  = NEW.data_agendamento
           AND a.situacao          = 'AGENDADO'
           AND a.id_agendamento   <> NEW.id_agendamento
           AND NEW.hora_inicio < a.hora_fim
           AND NEW.hora_fim    > a.hora_inicio;

        IF v_conflitos > 0 THEN
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'RN04: o profissional ja possui agendamento nesse horario';
        END IF;
    END IF;
END//

DELIMITER ;

-- =====================================================================
-- 4. INSERT INTO — MASSA DE DADOS (fictícia e coerente)
-- Nenhum dado real de clientes ou profissionais. Amostra de cerca de
-- 6 semanas (05/10/2026 a 12/11/2026) com os mesmos processos do salão.
-- Casos de teste incluídos: agendamentos cancelados, cliente sem
-- atendimento, atendimento concluído sem pagamento, insumos abaixo do
-- estoque mínimo, fornecedor sem compras e formas de pagamento variadas.
-- Pode ser executada sozinha (docs/massa_de_dados.sql) depois das tabelas.
-- =====================================================================
USE salao_dos_primos;

-- Clientes (18; o cliente 17 é um cadastro duplicado, removido no passo 6)
INSERT INTO Cliente (nome_completo, telefone, email, data_cadastro, observacoes) VALUES
('Ana Beatriz Moreira',      '11980010001', 'ana.moreira@email.com',   '2026-09-10', NULL),
('Bianca Ferreira Lima',     '11980010002', NULL,                      '2026-09-10', 'Prefere atendimento no período da manhã'),
('Camila Rocha Santos',      '11980010003', 'camila.rocha@email.com',  '2026-09-12', NULL),
('Daniela Souza Prado',      '11980010004', NULL,                      '2026-09-15', NULL),
('Eduarda Martins Costa',    '11980010005', 'eduarda.costa@email.com', '2026-09-15', 'Cabelo com química'),
('Fernanda Oliveira Dias',   '11980010006', NULL,                      '2026-09-18', NULL),
('Gabriela Pires Ramos',     '11980010007', 'gabi.ramos@email.com',    '2026-09-20', NULL),
('Helena Barbosa Cruz',      '11980010008', NULL,                      '2026-09-22', NULL),
('Isabela Nogueira Melo',    '11980010009', 'isa.melo@email.com',      '2026-09-25', NULL),
('Juliana Castro Faria',     '11980010010', NULL,                      '2026-09-25', NULL),
('Karen Duarte Viana',       '11980010011', 'karen.viana@email.com',   '2026-09-28', NULL),
('Larissa Mendes Rios',      '11980010012', NULL,                      '2026-09-30', NULL),
('Marcos Vinicius Andrade',  '11980010013', NULL,                      '2026-10-01', NULL),
('Nelson Batista Ribeiro',   '11980010014', 'nelson.ribeiro@email.com','2026-10-01', NULL),
('Otavio Campos Braga',      '11980010015', NULL,                      '2026-10-02', NULL),
('Patricia Gomes Tavares',   '11980010016', 'paty.tavares@email.com',  '2026-10-02', NULL),
('Joana P. Duarte',          '11980010017', NULL,                      '2026-10-20', 'Cadastro duplicado'),
('Rafaela Teixeira Lopes',   '11980010018', 'rafa.lopes@email.com',    '2026-10-30', 'Cadastrada, ainda sem atendimento');

-- Profissionais (4; o profissional 4 deixa o salão no passo 6)
INSERT INTO Profissional (nome_completo, telefone, data_admissao, ativo) VALUES
('Marcia Lopes Andrade', '11970020001', '2022-02-01', TRUE),
('Renata Alves Pereira', '11970020002', '2023-05-15', TRUE),
('Carla Nunes Figueira', '11970020003', '2023-08-01', TRUE),
('Bruno Teixeira Mota',  '11970020004', '2024-03-01', TRUE);

INSERT INTO Especialidade (nome, descricao) VALUES
('Corte',                 'Cortes femininos e masculinos'),
('Coloração',             'Coloração, mechas e retoques'),
('Manicure e Pedicure',   'Cuidados com as unhas das mãos e dos pés'),
('Escova e Penteados',    'Escovas, penteados e finalização'),
('Tratamentos Capilares', 'Hidratação, reconstrução e cronograma capilar'),
('Maquiagem',             'Maquiagem social e para eventos');

INSERT INTO Profissional_Especialidade (id_profissional, id_especialidade) VALUES
(1, 1), (1, 2), (1, 5),
(2, 3),
(3, 1), (3, 4), (3, 6),
(4, 1), (4, 4);

INSERT INTO Procedimento (nome, descricao, duracao_estimada, preco_referencia) VALUES
('Corte feminino',     'Corte com lavagem e finalização',         60,  80.00),
('Corte masculino',    'Corte simples ou com máquina',            40,  45.00),
('Escova',             'Escova modeladora',                       50,  60.00),
('Coloração',          'Coloração completa ou retoque de raiz',  150, 180.00),
('Mechas',             'Mechas, luzes ou platinado',             240, 320.00),
('Hidratação',         'Hidratação ou reconstrução capilar',      60,  90.00),
('Manicure',           'Cuidado e esmaltação das mãos',           45,  35.00),
('Pedicure',           'Cuidado e esmaltação dos pés',            60,  40.00),
('Maquiagem',          'Maquiagem social',                        60, 100.00);

-- Agendamentos (33): 25 concluídos, 3 cancelados e 5 futuros
INSERT INTO Agendamento (id_cliente, id_profissional, id_procedimento, data_agendamento, hora_inicio, hora_fim, situacao, observacoes) VALUES
( 1, 1, 1, '2026-10-05', '09:00', '10:00', 'CONCLUIDO', NULL),
( 2, 2, 7, '2026-10-05', '09:00', '09:45', 'CONCLUIDO', NULL),
( 3, 3, 3, '2026-10-05', '10:00', '10:50', 'CONCLUIDO', NULL),
(13, 4, 2, '2026-10-06', '14:00', '14:40', 'CONCLUIDO', NULL),
( 5, 1, 4, '2026-10-06', '09:00', '11:30', 'CONCLUIDO', 'Retoque de raiz'),
( 6, 2, 8, '2026-10-06', '13:00', '14:00', 'CONCLUIDO', NULL),
( 7, 3, 9, '2026-10-07', '15:00', '16:00', 'CONCLUIDO', 'Maquiagem para formatura'),
( 8, 1, 6, '2026-10-08', '10:00', '11:00', 'CONCLUIDO', NULL),
( 1, 2, 7, '2026-10-08', '10:00', '10:45', 'CANCELADO', 'Cliente avisou por WhatsApp'),
( 9, 3, 1, '2026-10-09', '09:00', '10:00', 'CONCLUIDO', NULL),
(10, 4, 3, '2026-10-09', '16:00', '16:50', 'CONCLUIDO', NULL),
(11, 1, 5, '2026-10-13', '09:00', '13:00', 'CONCLUIDO', 'Platinado'),
(12, 2, 7, '2026-10-13', '14:00', '14:45', 'CONCLUIDO', NULL),
( 2, 2, 8, '2026-10-14', '14:00', '15:00', 'CONCLUIDO', NULL),
( 3, 3, 1, '2026-10-15', '11:00', '12:00', 'CONCLUIDO', NULL),
(14, 4, 2, '2026-10-16', '10:00', '10:40', 'CANCELADO', 'Cliente não compareceu'),
( 4, 1, 1, '2026-10-20', '09:00', '10:00', 'CONCLUIDO', NULL),
(16, 3, 3, '2026-10-20', '13:00', '13:50', 'CONCLUIDO', NULL),
(15, 4, 2, '2026-10-20', '15:00', '15:40', 'CONCLUIDO', NULL),
( 6, 2, 7, '2026-10-22', '09:00', '09:45', 'CONCLUIDO', NULL),
( 9, 1, 6, '2026-10-22', '11:00', '12:00', 'CONCLUIDO', NULL),
( 7, 3, 9, '2026-10-24', '10:00', '11:00', 'CONCLUIDO', NULL),
(16, 1, 4, '2026-10-27', '09:00', '11:30', 'CONCLUIDO', NULL),
( 8, 2, 8, '2026-10-27', '14:00', '15:00', 'CANCELADO', 'Remarcou para outra semana'),
( 9, 3, 1, '2026-10-29', '15:00', '16:00', 'CONCLUIDO', NULL),
(10, 1, 1, '2026-11-03', '09:00', '10:00', 'CONCLUIDO', NULL),
(12, 2, 7, '2026-11-03', '10:00', '10:45', 'CONCLUIDO', NULL),
(11, 3, 3, '2026-11-05', '14:00', '14:50', 'CONCLUIDO', 'Pagamento ainda não registrado'),
( 1, 1, 6, '2026-11-09', '10:00', '11:00', 'AGENDADO',  NULL),
( 2, 2, 7, '2026-11-09', '10:00', '10:45', 'AGENDADO',  NULL),
(13, 3, 1, '2026-11-10', '09:00', '10:00', 'AGENDADO',  NULL),
(14, 1, 5, '2026-11-11', '09:00', '13:00', 'AGENDADO',  NULL),
( 3, 2, 8, '2026-11-12', '15:00', '16:00', 'AGENDADO',  NULL);

-- Pagamentos (24): o agendamento 28 foi concluído e ainda não tem pagamento.
-- O valor varia conforme a avaliação feita no salão (preço de referência é só base).
INSERT INTO Pagamento (id_agendamento, valor_pago, data_pagamento, forma_pagamento) VALUES
( 1,  85.00, '2026-10-05', 'PIX'),
( 2,  35.00, '2026-10-05', 'DINHEIRO'),
( 3,  60.00, '2026-10-05', 'CARTAO_DEBITO'),
( 4,  45.00, '2026-10-06', 'PIX'),
( 5, 200.00, '2026-10-06', 'CARTAO_CREDITO'),
( 6,  40.00, '2026-10-06', 'DINHEIRO'),
( 7, 110.00, '2026-10-07', 'PIX'),
( 8, 100.00, '2026-10-08', 'CARTAO_CREDITO'),
(10,  80.00, '2026-10-09', 'DINHEIRO'),
(11,  60.00, '2026-10-09', 'PIX'),
(12, 380.00, '2026-10-13', 'CARTAO_CREDITO'),
(13,  35.00, '2026-10-13', 'PIX'),
(14,  40.00, '2026-10-14', 'DINHEIRO'),
(15,  90.00, '2026-10-15', 'PIX'),
(17,  80.00, '2026-10-20', 'CARTAO_DEBITO'),
(18,  65.00, '2026-10-20', 'PIX'),
(19,  45.00, '2026-10-20', 'DINHEIRO'),
(20,  35.00, '2026-10-22', 'PIX'),
(21,  95.00, '2026-10-22', 'CARTAO_DEBITO'),
(22, 100.00, '2026-10-24', 'PIX'),
(23, 220.00, '2026-10-27', 'CARTAO_CREDITO'),
(25,  80.00, '2026-10-29', 'DINHEIRO'),
(26,  85.00, '2026-11-03', 'PIX'),
(27,  35.00, '2026-11-03', 'DINHEIRO');

-- Fornecedores (4; o fornecedor 4 ainda não tem compras)
INSERT INTO Fornecedor (nome, telefone) VALUES
('Distribuidora Beleza Pro',   '1130010001'),
('Cosméticos Aurora',          '1130010002'),
('Atacado do Cabeleireiro',    '11930010003'),
('Perfumaria Central',         '1130010004');

-- Insumos: o estoque começa em 0 e é calculado pelas movimentações (abaixo)
INSERT INTO Insumo (nome, unidade_medida, quantidade_estoque, estoque_minimo) VALUES
('Tintura loira 8.0',        'un',    0, 8),
('Tintura castanho 5.0',     'un',    0, 4),
('Oxidante 20 volumes',      'frasco',0, 6),
('Pó descolorante',          'pote',  0, 4),
('Shampoo profissional',     'un',    0, 3),
('Máscara de hidratação',    'un',    0, 4),
('Esmalte',                  'un',    0, 10),
('Acetona',                  'frasco',0, 3),
('Algodão',                  'pacote',0, 3),
('Papel alumínio',           'rolo',  0, 2);

INSERT INTO Compra (id_fornecedor, data_compra) VALUES
(1, '2026-10-01'),
(2, '2026-10-02'),
(3, '2026-10-12'),
(1, '2026-10-19'),
(2, '2026-10-26');

INSERT INTO Item_Compra (id_compra, id_insumo, quantidade, valor_unitario) VALUES
(1,  1,  6, 32.90),
(1,  2,  6, 29.90),
(1,  3,  6, 14.50),
(1,  4,  4, 38.00),
(2,  5,  6, 45.00),
(2,  6,  6, 52.00),
(2,  7, 20,  6.50),
(2,  8,  3,  9.00),
(3,  9,  4,  7.50),
(3, 10,  4, 18.00),
(3,  4,  2, 38.00),
(4,  1,  2, 33.50),
(4,  3,  3, 14.50),
(4,  5,  3, 45.00),
(5,  7, 10,  6.50),
(5,  8,  2,  9.00),
(5,  6,  2, 52.00);

-- Entradas de estoque: uma para cada item comprado (data da compra)
INSERT INTO Movimentacao_Estoque (id_insumo, id_agendamento, tipo_movimentacao, quantidade, data_movimentacao)
SELECT ic.id_insumo, NULL, 'ENTRADA', ic.quantidade, c.data_compra
  FROM Item_Compra ic
  JOIN Compra c ON c.id_compra = ic.id_compra
 ORDER BY c.data_compra, ic.id_item_compra;

-- Saídas de estoque: consumo nos atendimentos (e um uso geral, sem atendimento)
INSERT INTO Movimentacao_Estoque (id_insumo, id_agendamento, tipo_movimentacao, quantidade, data_movimentacao) VALUES
( 5,  1, 'SAIDA', 1, '2026-10-05'),
( 7,  2, 'SAIDA', 1, '2026-10-05'),
( 2,  5, 'SAIDA', 1, '2026-10-06'),
( 3,  5, 'SAIDA', 1, '2026-10-06'),
( 8,  6, 'SAIDA', 1, '2026-10-06'),
( 6,  8, 'SAIDA', 1, '2026-10-08'),
( 4, 12, 'SAIDA', 2, '2026-10-13'),
( 3, 12, 'SAIDA', 2, '2026-10-13'),
(10, 12, 'SAIDA', 1, '2026-10-13'),
( 7, 13, 'SAIDA', 1, '2026-10-13'),
( 8, 14, 'SAIDA', 1, '2026-10-14'),
( 5, 15, 'SAIDA', 1, '2026-10-15'),
( 7, 20, 'SAIDA', 1, '2026-10-22'),
( 6, 21, 'SAIDA', 1, '2026-10-22'),
( 1, 23, 'SAIDA', 1, '2026-10-27'),
( 3, 23, 'SAIDA', 1, '2026-10-27'),
( 9, NULL,'SAIDA', 3, '2026-10-30'),
( 7, 27, 'SAIDA', 1, '2026-11-03');

-- Estoque atual = entradas − saídas (as movimentações são o histórico)
UPDATE Insumo i
   SET i.quantidade_estoque = (
       SELECT COALESCE(SUM(CASE WHEN m.tipo_movimentacao = 'ENTRADA' THEN m.quantidade ELSE -m.quantidade END), 0)
         FROM Movimentacao_Estoque m
        WHERE m.id_insumo = i.id_insumo)
 WHERE i.id_insumo > 0;

-- Massa fictícia: os fechamentos semanais são apenas períodos de teste; o salão realiza fechamento mensal.
-- O total de cada período é a soma dos pagamentos correspondentes (RN10)
INSERT INTO Fechamento_Caixa (data_inicio, data_fim, total_recebido)
SELECT '2026-10-05', '2026-10-11', COALESCE(SUM(valor_pago), 0)
  FROM Pagamento WHERE data_pagamento BETWEEN '2026-10-05' AND '2026-10-11';

INSERT INTO Fechamento_Caixa (data_inicio, data_fim, total_recebido)
SELECT '2026-10-12', '2026-10-18', COALESCE(SUM(valor_pago), 0)
  FROM Pagamento WHERE data_pagamento BETWEEN '2026-10-12' AND '2026-10-18';

INSERT INTO Fechamento_Caixa (data_inicio, data_fim, total_recebido)
SELECT '2026-10-19', '2026-10-25', COALESCE(SUM(valor_pago), 0)
  FROM Pagamento WHERE data_pagamento BETWEEN '2026-10-19' AND '2026-10-25';

INSERT INTO Fechamento_Caixa (data_inicio, data_fim, total_recebido)
SELECT '2026-10-26', '2026-11-01', COALESCE(SUM(valor_pago), 0)
  FROM Pagamento WHERE data_pagamento BETWEEN '2026-10-26' AND '2026-11-01';

-- =====================================================================
-- 5. SELECT com JOIN
-- =====================================================================

-- S01 — Qual é a agenda detalhada (cliente, profissional e procedimento)?
-- Atende: RF08 (consultar a agenda dos profissionais)
SELECT a.id_agendamento, a.data_agendamento, a.hora_inicio, a.hora_fim,
       c.nome_completo  AS cliente,
       p.nome_completo  AS profissional,
       pr.nome          AS procedimento,
       a.situacao
  FROM Agendamento a
  JOIN Cliente      c  ON c.id_cliente      = a.id_cliente
  JOIN Profissional p  ON p.id_profissional = a.id_profissional
  JOIN Procedimento pr ON pr.id_procedimento = a.id_procedimento
 ORDER BY a.data_agendamento, a.hora_inicio;

-- S02 — Quais especialidades cada profissional possui?
-- Atende: RF03 (cadastro de profissionais) e P2
SELECT p.nome_completo AS profissional, e.nome AS especialidade
  FROM Profissional p
  JOIN Profissional_Especialidade pe ON pe.id_profissional  = p.id_profissional
  JOIN Especialidade e               ON e.id_especialidade = pe.id_especialidade
 ORDER BY p.nome_completo, e.nome;

-- S03 — O que foi comprado em cada compra, de qual fornecedor?
-- Atende: RF12 e RF13 (compras e seus itens)
SELECT c.id_compra, c.data_compra, f.nome AS fornecedor,
       i.nome AS insumo, ic.quantidade, ic.valor_unitario,
       ic.quantidade * ic.valor_unitario AS valor_total_item
  FROM Compra c
  JOIN Fornecedor  f  ON f.id_fornecedor = c.id_fornecedor
  JOIN Item_Compra ic ON ic.id_compra    = c.id_compra
  JOIN Insumo      i  ON i.id_insumo     = ic.id_insumo
 ORDER BY c.data_compra, i.nome;

-- S04 — Quanto cada cliente pagou, por qual atendimento e de que forma?
-- Atende: RF11 (pagamentos relacionados aos agendamentos)
SELECT c.nome_completo AS cliente, pr.nome AS procedimento,
       pg.valor_pago, pg.data_pagamento, pg.forma_pagamento
  FROM Pagamento pg
  JOIN Agendamento  a  ON a.id_agendamento  = pg.id_agendamento
  JOIN Cliente      c  ON c.id_cliente      = a.id_cliente
  JOIN Procedimento pr ON pr.id_procedimento = a.id_procedimento
 ORDER BY pg.data_pagamento, c.nome_completo;


-- =====================================================================
-- 6. UPDATE e DELETE
-- =====================================================================

-- U01 — Remarcar o agendamento 30 para o dia seguinte (trigger confere conflito)
-- Atende: RF07 (remarcar agendamentos) · RN04
UPDATE Agendamento
   SET data_agendamento = '2026-11-10', hora_inicio = '10:00', hora_fim = '10:45'
 WHERE id_agendamento = 30;

-- U02 — Cancelar o agendamento 33, mantendo o registro com a situação
-- Atende: RF06 (cancelar agendamentos mantendo o registro)
UPDATE Agendamento
   SET situacao = 'CANCELADO', observacoes = 'Cliente desistiu do horário'
 WHERE id_agendamento = 33;

-- U03 — Marcar o profissional 4 como inativo (deixou o salão)
-- Atende: RN05 (profissional inativo não recebe novos agendamentos)
UPDATE Profissional
   SET ativo = FALSE
 WHERE id_profissional = 4;

-- D01 — Excluir o cliente 17, cadastro duplicado que nunca teve agendamento
-- Atende: RN01 (a exclusão só é possível porque não há agendamento ligado a ele)
DELETE FROM Cliente
 WHERE id_cliente = 17;

-- Teste das triggers (descomente UMA linha de cada vez; ambas devem dar erro):
-- RN05: INSERT INTO Agendamento (id_cliente, id_profissional, id_procedimento, data_agendamento, hora_inicio, hora_fim)
--       VALUES (1, 4, 2, '2026-11-13', '09:00', '09:40');
-- RN04: INSERT INTO Agendamento (id_cliente, id_profissional, id_procedimento, data_agendamento, hora_inicio, hora_fim)
--       VALUES (2, 1, 1, '2026-11-09', '10:30', '11:30');


-- =====================================================================
-- 7. CONSULTAS GERENCIAIS (G) E DE AUDITORIA (A)
-- =====================================================================

-- ---------------------------- GERENCIAIS ----------------------------

-- G01 — Quantos agendamentos existem por semana?
-- Atende: P1, P2 · KPI K1 (agendamentos por semana)
SELECT YEARWEEK(data_agendamento, 1) AS semana,
       MIN(data_agendamento)          AS primeiro_dia,
       COUNT(*)                       AS total_agendamentos
  FROM Agendamento
 GROUP BY YEARWEEK(data_agendamento, 1)
 ORDER BY semana;

-- G02 — Quantos atendimentos cada profissional concluiu por mês?
-- Atende: P2 · KPI K3 (atendimentos concluídos por profissional)
SELECT DATE_FORMAT(a.data_agendamento, '%Y-%m') AS mes,
       p.nome_completo                          AS profissional,
       COUNT(*)                                 AS atendimentos_concluidos
  FROM Agendamento a
  JOIN Profissional p ON p.id_profissional = a.id_profissional
 WHERE a.situacao = 'CONCLUIDO'
 GROUP BY DATE_FORMAT(a.data_agendamento, '%Y-%m'), p.id_profissional, p.nome_completo
 ORDER BY mes, atendimentos_concluidos DESC;

-- G03 — Qual é a taxa de cancelamento por mês?
-- Atende: P3 · KPI K2 (taxa de cancelamento = cancelados ÷ total de agendamentos)
SELECT DATE_FORMAT(data_agendamento, '%Y-%m')                         AS mes,
       COUNT(*)                                                       AS total,
       SUM(situacao = 'CANCELADO')                                    AS cancelados,
       ROUND(100 * SUM(situacao = 'CANCELADO') / COUNT(*), 1)         AS taxa_cancelamento_pct
  FROM Agendamento
 GROUP BY DATE_FORMAT(data_agendamento, '%Y-%m')
 ORDER BY mes;

-- G04 — Quais procedimentos foram mais realizados em cada mês?
-- Atende: P2 · KPI K4 (procedimentos mais realizados por mês)
SELECT DATE_FORMAT(a.data_agendamento, '%Y-%m') AS mes,
       pr.nome AS procedimento,
       COUNT(*) AS vezes_realizado
  FROM Agendamento a
  JOIN Procedimento pr ON pr.id_procedimento = a.id_procedimento
 WHERE a.situacao = 'CONCLUIDO'
 GROUP BY DATE_FORMAT(a.data_agendamento, '%Y-%m'), pr.id_procedimento, pr.nome
 ORDER BY mes, vezes_realizado DESC, pr.nome;

-- G05 — Quanto o salão recebeu por semana e qual o ticket médio?
-- Atende: P4 · KPI K5 (faturamento semanal = soma dos pagamentos; ticket médio = total ÷ nº de pagamentos)
SELECT YEARWEEK(data_pagamento, 1) AS semana,
       COUNT(*)                    AS pagamentos,
       SUM(valor_pago)             AS total_recebido,
       ROUND(AVG(valor_pago), 2)   AS ticket_medio
  FROM Pagamento
 GROUP BY YEARWEEK(data_pagamento, 1)
 ORDER BY semana;

-- G06 — Quanto foi recebido por forma de pagamento em cada semana?
-- Atende: P4 · KPI K5 (composição semanal do faturamento)
SELECT YEARWEEK(data_pagamento, 1) AS semana,
       forma_pagamento,
       COUNT(*) AS pagamentos,
       SUM(valor_pago) AS total_recebido
  FROM Pagamento
 GROUP BY YEARWEEK(data_pagamento, 1), forma_pagamento
 ORDER BY semana, total_recebido DESC;

-- G07 — Quais insumos estão abaixo do estoque mínimo?
-- Atende: P5 · KPI K6 (insumos abaixo do mínimo)
SELECT nome AS insumo, quantidade_estoque, estoque_minimo,
       estoque_minimo - quantidade_estoque AS falta_para_o_minimo
  FROM Insumo
 WHERE quantidade_estoque < estoque_minimo
 ORDER BY falta_para_o_minimo DESC;

-- G08 — Quanto foi gasto com cada fornecedor por mês?
-- Atende: P5 · KPI K7 (gasto mensal por fornecedor = soma de quantidade × valor unitário)
SELECT DATE_FORMAT(c.data_compra, '%Y-%m') AS mes,
       f.nome AS fornecedor,
       COUNT(DISTINCT c.id_compra) AS compras,
       COALESCE(SUM(ic.quantidade * ic.valor_unitario), 0) AS total_gasto
  FROM Fornecedor f
  LEFT JOIN Compra c ON c.id_fornecedor = f.id_fornecedor
  LEFT JOIN Item_Compra ic ON ic.id_compra = c.id_compra
 GROUP BY DATE_FORMAT(c.data_compra, '%Y-%m'), f.id_fornecedor, f.nome
 ORDER BY mes, total_gasto DESC, f.nome;

-- G09 — Quais são os agendamentos futuros de cada profissional?
-- Atende: P1 · RF08 (agenda dos profissionais)
SELECT p.nome_completo AS profissional, a.data_agendamento, a.hora_inicio, a.hora_fim,
       c.nome_completo AS cliente, pr.nome AS procedimento
  FROM Agendamento a
  JOIN Profissional p  ON p.id_profissional  = a.id_profissional
  JOIN Cliente      c  ON c.id_cliente       = a.id_cliente
  JOIN Procedimento pr ON pr.id_procedimento = a.id_procedimento
 WHERE a.situacao = 'AGENDADO' AND a.data_agendamento >= CURDATE()
 ORDER BY p.nome_completo, a.data_agendamento, a.hora_inicio;

-- G10 — Quais clientes cadastrados ainda não têm nenhum atendimento?
-- Atende: P2 (histórico por cliente)
SELECT c.id_cliente, c.nome_completo, c.data_cadastro
  FROM Cliente c
  LEFT JOIN Agendamento a ON a.id_cliente = c.id_cliente
 WHERE a.id_agendamento IS NULL
 ORDER BY c.data_cadastro;


-- ---------------------------- AUDITORIA -----------------------------
-- As consultas A01, A02 e A04 devolvem uma linha com a contagem de violações
-- (esperado: 0). A03, A05 e A06 listam os casos para conferência.

-- A01 — Existe profissional com dois agendamentos no mesmo horário?
-- Verifica: RN04 (sem conflito de horário entre agendamentos ativos)
SELECT 'RN04 - conflitos de horario' AS verificacao, COUNT(*) AS violacoes
  FROM Agendamento a
  JOIN Agendamento b
    ON  a.id_profissional  = b.id_profissional
   AND a.data_agendamento  = b.data_agendamento
   AND a.id_agendamento    < b.id_agendamento
   AND a.situacao = 'AGENDADO' AND b.situacao = 'AGENDADO'
   AND a.hora_inicio < b.hora_fim AND a.hora_fim > b.hora_inicio;

-- A02 — Existe agendamento ativo para profissional inativo?
-- Verifica: RN05 (profissional inativo não recebe novos agendamentos)
SELECT 'RN05 - agendamento ativo de profissional inativo' AS verificacao, COUNT(*) AS violacoes
  FROM Agendamento a
  JOIN Profissional p ON p.id_profissional = a.id_profissional
 WHERE p.ativo = FALSE AND a.situacao = 'AGENDADO';

-- A03 — Quais atendimentos concluídos ainda não têm pagamento registrado, por semana?
-- Verifica: RN11 (atendimento concluído deve ter pagamento registrado)
SELECT YEARWEEK(a.data_agendamento, 1) AS semana,
       COUNT(*) OVER (PARTITION BY YEARWEEK(a.data_agendamento, 1)) AS pendencias_na_semana,
       a.id_agendamento, a.data_agendamento,
       c.nome_completo AS cliente, pr.nome AS procedimento
  FROM Agendamento a
  JOIN Cliente c ON c.id_cliente = a.id_cliente
  JOIN Procedimento pr ON pr.id_procedimento = a.id_procedimento
  LEFT JOIN Pagamento pg ON pg.id_agendamento = a.id_agendamento
 WHERE a.situacao = 'CONCLUIDO' AND pg.id_pagamento IS NULL
 ORDER BY semana, a.data_agendamento;

-- A04 — Existe agendamento com mais de um pagamento?
-- Verifica: RN06 (no máximo um pagamento por agendamento)
SELECT 'RN06 - agendamentos com mais de um pagamento' AS verificacao, COUNT(*) AS violacoes
  FROM (SELECT id_agendamento
          FROM Pagamento
         GROUP BY id_agendamento
        HAVING COUNT(*) > 1) AS duplicados;

-- A05 — O total de cada fechamento de caixa bate com os pagamentos do período?
-- Verifica: RN10 (fechamento considera os pagamentos do período informado)
SELECT f.id_fechamento, f.data_inicio, f.data_fim, f.total_recebido,
       COALESCE(SUM(pg.valor_pago), 0)                    AS soma_pagamentos,
       f.total_recebido - COALESCE(SUM(pg.valor_pago), 0) AS diferenca
  FROM Fechamento_Caixa f
  LEFT JOIN Pagamento pg ON pg.data_pagamento BETWEEN f.data_inicio AND f.data_fim
 GROUP BY f.id_fechamento, f.data_inicio, f.data_fim, f.total_recebido
 ORDER BY f.data_inicio;

-- A06 — O estoque de cada insumo bate com o saldo das movimentações?
-- Verifica: RN09 e RN13 (movimentações explicam o estoque; estoque nunca negativo)
SELECT i.nome AS insumo, i.quantidade_estoque,
       COALESCE(SUM(CASE WHEN m.tipo_movimentacao = 'ENTRADA' THEN m.quantidade ELSE -m.quantidade END), 0) AS saldo_movimentacoes,
       i.quantidade_estoque
         - COALESCE(SUM(CASE WHEN m.tipo_movimentacao = 'ENTRADA' THEN m.quantidade ELSE -m.quantidade END), 0) AS diferenca
  FROM Insumo i
  LEFT JOIN Movimentacao_Estoque m ON m.id_insumo = i.id_insumo
 GROUP BY i.id_insumo, i.nome, i.quantidade_estoque
 ORDER BY i.nome;


