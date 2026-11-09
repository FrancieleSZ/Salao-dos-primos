
-- =====================================================================
-- SALÃO DOS PRIMOS — Massa de dados fictícia
-- Entrega 2 · Modelagem de Banco de Dados · UNICID · 2026-2
--
-- ATENÇÃO:
-- 1. Execute primeiro docs/script.sql para criar o banco e as tabelas.
-- 2. Este arquivo insere os dados fictícios no banco criado.
-- 3. NÃO execute se já tiver inserido a massa pela seção 4 do script.sql.
-- 4. Os dados seguem as tabelas, colunas e restrições do script.sql.
-- =====================================================================

USE salao_dos_primos;
SET NAMES utf8mb4;

-- =====================================================================
-- CLIENTES (18 registros)
-- =====================================================================

INSERT INTO Cliente
(nome_completo, telefone, email, data_cadastro, observacoes)
VALUES
('Ana Beatriz Moreira', '11980010001', 'ana.moreira@email.com', '2026-09-10', NULL),
('Bianca Ferreira Lima', '11980010002', NULL, '2026-09-10', 'Prefere atendimento no período da manhã'),
('Camila Rocha Santos', '11980010003', 'camila.rocha@email.com', '2026-09-12', NULL),
('Daniela Souza Prado', '11980010004', NULL, '2026-09-15', NULL),
('Eduarda Martins Costa', '11980010005', 'eduarda.costa@email.com', '2026-09-15', 'Cabelo com química'),
('Fernanda Oliveira Dias', '11980010006', NULL, '2026-09-18', NULL),
('Gabriela Pires Ramos', '11980010007', 'gabi.ramos@email.com', '2026-09-20', NULL),
('Helena Barbosa Cruz', '11980010008', NULL, '2026-09-22', NULL),
('Isabela Nogueira Melo', '11980010009', 'isa.melo@email.com', '2026-09-25', NULL),
('Juliana Castro Faria', '11980010010', NULL, '2026-09-25', NULL),
('Karen Duarte Viana', '11980010011', 'karen.viana@email.com', '2026-09-28', NULL),
('Larissa Mendes Rios', '11980010012', NULL, '2026-09-30', NULL),
('Marcos Vinicius Andrade', '11980010013', NULL, '2026-10-01', NULL),
('Nelson Batista Ribeiro', '11980010014', 'nelson.ribeiro@email.com', '2026-10-01', NULL),
('Otavio Campos Braga', '11980010015', NULL, '2026-10-02', NULL),
('Patricia Gomes Tavares', '11980010016', 'paty.tavares@email.com', '2026-10-02', NULL),
('Joana P. Duarte', '11980010017', NULL, '2026-10-20', 'Cadastro duplicado'),
('Rafaela Teixeira Lopes', '11980010018', 'rafa.lopes@email.com', '2026-10-30', 'Cadastrada, ainda sem atendimento');

-- =====================================================================
-- PROFISSIONAIS (4 registros)
-- =====================================================================

INSERT INTO Profissional
(nome_completo, telefone, data_admissao, ativo)
VALUES
('Marcia Lopes Andrade', '11970020001', '2022-02-01', TRUE),
('Renata Alves Pereira', '11970020002', '2023-05-15', TRUE),
('Carla Nunes Figueira', '11970020003', '2023-08-01', TRUE),
('Bruno Teixeira Mota', '11970020004', '2024-03-01', TRUE);

-- =====================================================================
-- ESPECIALIDADES
-- =====================================================================

INSERT INTO Especialidade (nome, descricao)
VALUES
('Corte', 'Cortes femininos e masculinos'),
('Coloração', 'Coloração, mechas e retoques'),
('Manicure e Pedicure', 'Cuidados com as unhas das mãos e dos pés'),
('Escova e Penteados', 'Escovas, penteados e finalização'),
('Tratamentos Capilares', 'Hidratação, reconstrução e cronograma capilar'),
('Maquiagem', 'Maquiagem social e para eventos');

-- =====================================================================
-- PROFISSIONAL_ESPECIALIDADE
-- =====================================================================

INSERT INTO Profissional_Especialidade
(id_profissional, id_especialidade)
VALUES
(1, 1), (1, 2), (1, 5),
(2, 3),
(3, 1), (3, 4), (3, 6),
(4, 1), (4, 4);

-- =====================================================================
-- PROCEDIMENTOS
-- =====================================================================

INSERT INTO Procedimento
(nome, descricao, duracao_estimada, preco_referencia)
VALUES
('Corte feminino', 'Corte com lavagem e finalização', 60, 80.00),
('Corte masculino', 'Corte simples ou com máquina', 40, 45.00),
('Escova', 'Escova modeladora', 50, 60.00),
('Coloração', 'Coloração completa ou retoque de raiz', 150, 180.00),
('Mechas', 'Mechas, luzes ou platinado', 240, 320.00),
('Hidratação', 'Hidratação ou reconstrução capilar', 60, 90.00),
('Manicure', 'Cuidado e esmaltação das mãos', 45, 35.00),
('Pedicure', 'Cuidado e esmaltação dos pés', 60, 40.00),
('Maquiagem', 'Maquiagem social', 60, 100.00);

-- =====================================================================
-- AGENDAMENTOS (33 registros)
-- =====================================================================

INSERT INTO Agendamento
(id_cliente, id_profissional, id_procedimento,
 data_agendamento, hora_inicio, hora_fim, situacao, observacoes)
VALUES
(1, 1, 1, '2026-10-05', '09:00', '10:00', 'CONCLUIDO', NULL),
(2, 2, 7, '2026-10-05', '09:00', '09:45', 'CONCLUIDO', NULL),
(3, 3, 3, '2026-10-05', '10:00', '10:50', 'CONCLUIDO', NULL),
(13, 4, 2, '2026-10-06', '14:00', '14:40', 'CONCLUIDO', NULL),
(5, 1, 4, '2026-10-06', '09:00', '11:30', 'CONCLUIDO', 'Retoque de raiz'),
(6, 2, 8, '2026-10-06', '13:00', '14:00', 'CONCLUIDO', NULL),
(7, 3, 9, '2026-10-07', '15:00', '16:00', 'CONCLUIDO', 'Maquiagem para formatura'),
(8, 1, 6, '2026-10-08', '10:00', '11:00', 'CONCLUIDO', NULL),
(1, 2, 7, '2026-10-08', '10:00', '10:45', 'CANCELADO', 'Cliente avisou por WhatsApp'),
(9, 3, 1, '2026-10-09', '09:00', '10:00', 'CONCLUIDO', NULL),
(10, 4, 3, '2026-10-09', '16:00', '16:50', 'CONCLUIDO', NULL),
(11, 1, 5, '2026-10-13', '09:00', '13:00', 'CONCLUIDO', 'Platinado'),
(12, 2, 7, '2026-10-13', '14:00', '14:45', 'CONCLUIDO', NULL),
(2, 2, 8, '2026-10-14', '14:00', '15:00', 'CONCLUIDO', NULL),
(3, 3, 1, '2026-10-15', '11:00', '12:00', 'CONCLUIDO', NULL),
(14, 4, 2, '2026-10-16', '10:00', '10:40', 'CANCELADO', 'Cliente não compareceu'),
(4, 1, 1, '2026-10-20', '09:00', '10:00', 'CONCLUIDO', NULL),
(16, 3, 3, '2026-10-20', '13:00', '13:50', 'CONCLUIDO', NULL),
(15, 4, 2, '2026-10-20', '15:00', '15:40', 'CONCLUIDO', NULL),
(6, 2, 7, '2026-10-22', '09:00', '09:45', 'CONCLUIDO', NULL),
(9, 1, 6, '2026-10-22', '11:00', '12:00', 'CONCLUIDO', NULL),
(7, 3, 9, '2026-10-24', '10:00', '11:00', 'CONCLUIDO', NULL),
(16, 1, 4, '2026-10-27', '09:00', '11:30', 'CONCLUIDO', NULL),
(8, 2, 8, '2026-10-27', '14:00', '15:00', 'CANCELADO', 'Remarcou para outra semana'),
(9, 3, 1, '2026-10-29', '15:00', '16:00', 'CONCLUIDO', NULL),
(10, 1, 1, '2026-11-03', '09:00', '10:00', 'CONCLUIDO', NULL),
(12, 2, 7, '2026-11-03', '10:00', '10:45', 'CONCLUIDO', NULL),
(11, 3, 3, '2026-11-05', '14:00', '14:50', 'CONCLUIDO', 'Pagamento ainda não registrado'),
(1, 1, 6, '2026-11-09', '10:00', '11:00', 'AGENDADO', NULL),
(2, 2, 7, '2026-11-09', '10:00', '10:45', 'AGENDADO', NULL),
(13, 3, 1, '2026-11-10', '09:00', '10:00', 'AGENDADO', NULL),
(14, 1, 5, '2026-11-11', '09:00', '13:00', 'AGENDADO', NULL),
(3, 2, 8, '2026-11-12', '15:00', '16:00', 'AGENDADO', NULL);

-- =====================================================================
-- PAGAMENTOS (24 registros)
-- =====================================================================

INSERT INTO Pagamento
(id_agendamento, valor_pago, data_pagamento, forma_pagamento)
VALUES
(1, 85.00, '2026-10-05', 'PIX'),
(2, 35.00, '2026-10-05', 'DINHEIRO'),
(3, 60.00, '2026-10-05', 'CARTAO_DEBITO'),
(4, 45.00, '2026-10-06', 'PIX'),
(5, 200.00, '2026-10-06', 'CARTAO_CREDITO'),
(6, 40.00, '2026-10-06', 'DINHEIRO'),
(7, 110.00, '2026-10-07', 'PIX'),
(8, 100.00, '2026-10-08', 'CARTAO_CREDITO'),
(10, 80.00, '2026-10-09', 'DINHEIRO'),
(11, 60.00, '2026-10-09', 'PIX'),
(12, 380.00, '2026-10-13', 'CARTAO_CREDITO'),
(13, 35.00, '2026-10-13', 'PIX'),
(14, 40.00, '2026-10-14', 'DINHEIRO'),
(15, 90.00, '2026-10-15', 'PIX'),
(17, 80.00, '2026-10-20', 'CARTAO_DEBITO'),
(18, 65.00, '2026-10-20', 'PIX'),
(19, 45.00, '2026-10-20', 'DINHEIRO'),
(20, 35.00, '2026-10-22', 'PIX'),
(21, 95.00, '2026-10-22', 'CARTAO_CREDITO'),
(22, 110.00, '2026-10-24', 'PIX'),
(23, 210.00, '2026-10-27', 'CARTAO_CREDITO'),
(25, 80.00, '2026-10-29', 'DINHEIRO'),
(26, 80.00, '2026-11-03', 'PIX'),
(27, 35.00, '2026-11-03', 'DINHEIRO');

-- =====================================================================
-- FORNECEDORES
-- =====================================================================

INSERT INTO Fornecedor (nome, telefone)
VALUES
('Beleza Pro Distribuidora', '1133334444'),
('Cosméticos Brasil Ltda', '1144445555'),
('Nail Center Atacado', '1155556666');

-- =====================================================================
-- COMPRAS
-- =====================================================================

INSERT INTO Compra (id_fornecedor, data_compra)
VALUES
(1, '2026-10-01'),
(2, '2026-10-02'),
(3, '2026-10-08'),
(1, '2026-11-02');

-- =====================================================================
-- INSUMOS
-- =====================================================================

INSERT INTO Insumo
(nome, unidade_medida, quantidade_estoque, estoque_minimo)
VALUES
('Shampoo profissional 5L', 'un', 8, 3),
('Condicionador 5L', 'un', 6, 3),
('Tintura castanho médio', 'un', 20, 10),
('Oxidante 20 volumes', 'un', 12, 5),
('Máscara de hidratação', 'un', 7, 3),
('Esmalte (unidade)', 'un', 40, 15),
('Acetona 1L', 'un', 5, 2),
('Cera depilatória', 'un', 4, 2);

-- =====================================================================
-- ITENS DE COMPRA
-- =====================================================================

INSERT INTO Item_Compra
(id_compra, id_insumo, quantidade, valor_unitario)
VALUES
(1, 1, 5, 85.00),
(1, 2, 5, 78.00),
(1, 5, 4, 62.50),
(2, 3, 15, 18.90),
(2, 4, 10, 14.50),
(3, 6, 30, 6.90),
(3, 7, 3, 22.00),
(4, 8, 4, 35.00),
(4, 3, 10, 18.90);

-- =====================================================================
-- MOVIMENTAÇÕES DE ESTOQUE
-- =====================================================================

INSERT INTO Movimentacao_Estoque
(id_insumo, id_agendamento, tipo_movimentacao,
 quantidade, data_movimentacao)
VALUES
(1, NULL, 'ENTRADA', 5, '2026-10-01'),
(2, NULL, 'ENTRADA', 5, '2026-10-01'),
(5, NULL, 'ENTRADA', 4, '2026-10-01'),
(3, NULL, 'ENTRADA', 15, '2026-10-02'),
(4, NULL, 'ENTRADA', 10, '2026-10-02'),
(6, NULL, 'ENTRADA', 30, '2026-10-08'),
(7, NULL, 'ENTRADA', 3, '2026-10-08'),
(1, 1, 'SAIDA', 1, '2026-10-05'),
(6, 3, 'SAIDA', 1, '2026-10-07'),
(3, 5, 'SAIDA', 2, '2026-10-06'),
(4, 5, 'SAIDA', 2, '2026-10-06'),
(8, 7, 'SAIDA', 1, '2026-10-07'),
(5, 6, 'SAIDA', 1, '2026-10-06'),
(6, 9, 'SAIDA', 1, '2026-10-28'),
(8, NULL, 'ENTRADA', 4, '2026-11-02'),
(3, NULL, 'ENTRADA', 10, '2026-11-02');

-- =====================================================================
-- FECHAMENTO DE CAIXA
-- =====================================================================

INSERT INTO Fechamento_Caixa
(data_inicio, data_fim, total_recebido)
VALUES
('2026-10-01', '2026-10-31', 600.00),
('2026-11-01', '2026-11-05', 100.00);
