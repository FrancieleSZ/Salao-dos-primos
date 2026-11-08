-- =========================================================
-- Massa de dados fictícia - Salão de Beleza
-- Execute DEPOIS do script.sql (criação das tabelas)
-- =========================================================

USE salao_beleza;
SET NAMES utf8mb4;

-- ---------------------------------------------------------
-- Cliente
-- ---------------------------------------------------------
INSERT INTO Cliente (id_cliente, nome, telefone, email) VALUES
(1,  'Mariana Souza',      '(11) 98811-2233', 'mariana.souza@email.com'),
(2,  'Carlos Eduardo Lima','(11) 97722-3344', 'carlos.lima@email.com'),
(3,  'Fernanda Oliveira',  '(11) 96633-4455', 'fernanda.oliveira@email.com'),
(4,  'Aline Rodrigues',    '(11) 95544-5566', 'aline.rodrigues@email.com'),
(5,  'Beatriz Santos',     '(11) 94455-6677', 'beatriz.santos@email.com'),
(6,  'Larissa Almeida',    '(11) 93366-7788', 'larissa.almeida@email.com'),
(7,  'Gustavo Ferreira',   '(11) 92277-8899', NULL),
(8,  'Renata Costa',       '(11) 91188-9900', 'renata.costa@email.com'),
(9,  'Thais Barbosa',      '(11) 98899-0011', 'thais.barbosa@email.com'),
(10, 'Paulo Henrique Dias','(11) 97700-1122', NULL);

-- ---------------------------------------------------------
-- Profissional
-- ---------------------------------------------------------
INSERT INTO Profissional (id_profissional, nome, telefone, ativo) VALUES
(1, 'Camila Duarte',   '(11) 99100-0001', TRUE),
(2, 'Rafael Moreira',  '(11) 99100-0002', TRUE),
(3, 'Juliana Pires',   '(11) 99100-0003', TRUE),
(4, 'Patrícia Lima',   '(11) 99100-0004', TRUE),

-- ---------------------------------------------------------
-- Especialidade
-- ---------------------------------------------------------
INSERT INTO Especialidade (id_especialidade, nome) VALUES
(1, 'Corte'),
(2, 'Coloração'),
(3, 'Tratamentos capilares'),
(4, 'Unhas'),
(5, 'Estética facial');

-- ---------------------------------------------------------
-- Profissional_Especialidade
-- ---------------------------------------------------------
INSERT INTO Profissional_Especialidade (id_profissional, id_especialidade) VALUES
(1, 1), (1, 2), (1, 3),
(2, 1),
(3, 4),
(4, 5);

-- ---------------------------------------------------------
-- Procedimento
-- ---------------------------------------------------------
INSERT INTO Procedimento (id_procedimento, nome, descricao, duracao_estimada, preco_referencia) VALUES
(1, 'Corte feminino',        'Corte com lavagem e finalização',          60,  80.00),
(2, 'Corte masculino',       'Corte na tesoura ou máquina',              30,  45.00),
(3, 'Escova',                'Escova modelada com lavagem',              45,  60.00),
(4, 'Coloração',             'Coloração completa com tintura',          120, 180.00),
(5, 'Hidratação',            'Hidratação profunda com máscara',          60,  90.00),
(6, 'Manicure',              'Corte, lixa e esmaltação das mãos',        45,  35.00),
(7, 'Pedicure',              'Cuidado completo e esmaltação dos pés',    45,  40.00),
(8, 'Design de sobrancelha', 'Design com pinça e acabamento',            30,  30.00);

-- ---------------------------------------------------------
-- Fornecedor
-- ---------------------------------------------------------
INSERT INTO Fornecedor (id_fornecedor, nome) VALUES
(1, 'Beleza Pro Distribuidora'),
(2, 'Cosméticos Brasil Ltda'),
(3, 'Nail Center Atacado');

-- ---------------------------------------------------------
-- Insumo
-- ---------------------------------------------------------
INSERT INTO Insumo (id_insumo, nome, quantidade_estoque, estoque_minimo) VALUES
(1, 'Shampoo profissional 5L',   8,  3),
(2, 'Condicionador 5L',          6,  3),
(3, 'Tintura castanho médio',   20, 10),
(4, 'Oxidante 20 volumes',      12,  5),
(5, 'Máscara de hidratação',     7,  3),
(6, 'Esmalte (unidade)',        40, 15),
(7, 'Acetona 1L',                5,  2),
(8, 'Cera depilatória',          4,  2);

-- ---------------------------------------------------------
-- Compra
-- ---------------------------------------------------------
INSERT INTO Compra (id_compra, id_fornecedor, data_compra) VALUES
(1, 1, '2026-10-01'),
(2, 2, '2026-10-02'),
(3, 3, '2026-10-08'),
(4, 1, '2026-11-02');

-- ---------------------------------------------------------
-- Item_Compra
-- ---------------------------------------------------------
INSERT INTO Item_Compra (id_item_compra, id_compra, id_insumo, quantidade, valor_unitario) VALUES
(1, 1, 1,  5, 85.00),
(2, 1, 2,  5, 78.00),
(3, 1, 5,  4, 62.50),
(4, 2, 3, 15, 18.90),
(5, 2, 4, 10, 14.50),
(6, 3, 6, 30,  6.90),
(7, 3, 7,  3, 22.00),
(8, 4, 8,  4, 35.00),
(9, 4, 3, 10, 18.90);

-- ---------------------------------------------------------
-- Agendamento
-- ---------------------------------------------------------
INSERT INTO Agendamento
(id_agendamento, id_cliente, id_profissional, id_procedimento, data, hora_inicio, hora_fim, situacao, observacoes) VALUES
(1,  1,  1, 1, '2026-10-05', '09:00:00', '10:00:00', 'CONCLUIDO', NULL),
(2,  2,  2, 2, '2026-10-05', '10:00:00', '10:30:00', 'CONCLUIDO', 'Degradê nas laterais'),
(3,  3,  3, 6, '2026-10-07', '14:00:00', '14:45:00', 'CONCLUIDO', 'Esmalte vermelho'),
(4,  4,  1, 4, '2026-10-10', '13:00:00', '15:00:00', 'CONCLUIDO', 'Cobertura de fios brancos'),
(5,  5,  4, 8, '2026-10-12', '16:00:00', '16:30:00', 'CONCLUIDO', NULL),
(6,  6,  1, 5, '2026-10-15', '11:00:00', '12:00:00', 'CONCLUIDO', NULL),
(7,  7,  3, 7, '2026-10-20', '15:00:00', '15:45:00', 'CANCELADO', 'Cliente avisou que não poderia comparecer'),
(8,  8,  1, 3, '2026-10-22', '09:30:00', '10:15:00', 'CONCLUIDO', NULL),
(9,  9,  3, 6, '2026-10-28', '10:00:00', '10:45:00', 'CONCLUIDO', NULL),
(10, 10, 2, 2, '2026-10-30', '17:00:00', '17:30:00', 'CONCLUIDO', NULL),
(11, 1,  1, 3, '2026-11-03', '09:00:00', '09:45:00', 'CONCLUIDO', NULL),
(12, 2,  3, 7, '2026-11-04', '14:00:00', '14:45:00', 'CONCLUIDO', NULL),
(13, 3,  1, 1, '2026-11-06', '10:00:00', '11:00:00', 'AGENDADO',  NULL),
(14, 4,  1, 4, '2026-11-07', '14:00:00', '16:00:00', 'AGENDADO',  'Retoque de raiz'),
(15, 5,  4, 8, '2026-11-10', '15:00:00', '15:30:00', 'AGENDADO',  NULL),
(16, 6,  3, 6, '2026-11-12', '09:00:00', '09:45:00', 'AGENDADO',  NULL);

-- ---------------------------------------------------------
-- Pagamento (somente agendamentos concluídos)
-- ---------------------------------------------------------
INSERT INTO Pagamento (id_pagamento, valor_pago, data_pagamento, forma_pagamento, id_agendamento) VALUES
(1,  80.00,  '2026-10-05', 'PIX',             1),
(2,  45.00,  '2026-10-05', 'Dinheiro',        2),
(3,  35.00,  '2026-10-07', 'Cartão de débito', 3),
(4,  180.00, '2026-10-10', 'Cartão de crédito', 4),
(5,  30.00,  '2026-10-12', 'PIX',             5),
(6,  90.00,  '2026-10-15', 'Cartão de crédito', 6),
(7,  60.00,  '2026-10-22', 'Dinheiro',        8),
(8,  35.00,  '2026-10-28', 'PIX',             9),
(9,  45.00,  '2026-10-30', 'Cartão de débito', 10),
(10, 60.00,  '2026-11-03', 'PIX',             11),
(11, 40.00,  '2026-11-04', 'Dinheiro',        12);

-- ---------------------------------------------------------
-- Movimentacao_Estoque
-- (entradas vinculadas às compras; saídas vinculadas a agendamentos)
-- ---------------------------------------------------------
INSERT INTO Movimentacao_Estoque
(id_movimentacao, id_insumo, id_agendamento, tipo_movimentacao, quantidade, data_movimentacao) VALUES
(1,  1, NULL, 'ENTRADA',  5, '2026-10-01'),
(2,  2, NULL, 'ENTRADA',  5, '2026-10-01'),
(3,  5, NULL, 'ENTRADA',  4, '2026-10-01'),
(4,  3, NULL, 'ENTRADA', 15, '2026-10-02'),
(5,  4, NULL, 'ENTRADA', 10, '2026-10-02'),
(6,  6, NULL, 'ENTRADA', 30, '2026-10-08'),
(7,  7, NULL, 'ENTRADA',  3, '2026-10-08'),
(8,  1, 1,    'SAIDA',    1, '2026-10-05'),
(9,  6, 3,    'SAIDA',    1, '2026-10-07'),
(10, 3, 4,    'SAIDA',    2, '2026-10-10'),
(11, 4, 4,    'SAIDA',    2, '2026-10-10'),
(12, 8, 5,    'SAIDA',    1, '2026-10-12'),
(13, 5, 6,    'SAIDA',    1, '2026-10-15'),
(14, 6, 9,    'SAIDA',    1, '2026-10-28'),
(15, 8, NULL, 'ENTRADA',  4, '2026-11-02'),
(16, 3, NULL, 'ENTRADA', 10, '2026-11-02');

-- ---------------------------------------------------------
-- Fechamento_Caixa
-- ---------------------------------------------------------
INSERT INTO Fechamento_Caixa (id_fechamento, data_inicio, data_fim, total_recebido) VALUES
(1, '2026-10-01', '2026-10-31', 600.00),   -- soma dos pagamentos 1 a 9
(2, '2026-11-01', '2026-11-05', 100.00);   -- soma dos pagamentos 10 e 11
