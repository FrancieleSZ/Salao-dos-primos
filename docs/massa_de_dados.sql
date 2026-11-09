-- =====================================================================
-- SALÃO DOS PRIMOS — Massa de dados fictícia
-- Entrega 2 · Modelagem de Banco de Dados · UNICID · 2026-2
--
-- Execute depois de criar as tabelas e os triggers pelo docs/script.sql.
-- Este arquivo contém os mesmos dados da seção 4 do script.sql.
--
-- ATENÇÃO: não execute esta massa se já executou a seção 4
-- do script.sql na mesma base.
-- =====================================================================

USE salao_dos_primos;
SET NAMES utf8mb4;

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

-- Fechamentos de caixa semanais: o total é a soma dos pagamentos do período (RN10)
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
