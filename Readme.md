ENTREGA 2 — MODELO LÓGICO, IMPLEMENTAÇÃO SQL E APRESENTAÇÃO FINAL

Salão dos Primos — Sistema de Gestão de Informações

1. Relatório Técnico Final

Integrantes

Nome completo do aluno| RGM| Usuário do GitHub
Franciele Souza de Jesus| [Preencher]| [Preencher]
[Integrante 2]| [Preencher]| [Preencher]

---

1.1 Revisão do Modelo Conceitual

Caracterização da organização

Nome e natureza da organização

O Salão dos Primos é um estabelecimento comercial real do ramo de beleza e estética, responsável pela prestação de serviços relacionados aos cuidados pessoais.

Responsável: Alaide.

Contexto e porte

O estabelecimento conta com aproximadamente 4 profissionais e atende uma quantidade estimada de 30 a 50 clientes.

Atualmente, a administração das atividades é realizada manualmente, utilizando caderno de papel e WhatsApp para organizar os agendamentos e manter contato com os clientes.

Os profissionais realizam diferentes procedimentos, conforme suas especialidades.

Localização:

R. Bernardino Vergueiro, 276 - Jardim Jaú, São Paulo - SP, 03710-060.

Problemas e necessidades identificados

Com base nas informações levantadas com a responsável, foram identificadas as seguintes necessidades:

P1 — Organização dos dados dos clientes

As informações dos clientes são consultadas por meio dos registros disponíveis no caderno e das conversas pelo WhatsApp. A falta de centralização dificulta a localização e a organização dessas informações.

P2 — Organização dos profissionais e especialidades

O estabelecimento possui aproximadamente quatro profissionais, que realizam procedimentos diferentes. É necessário organizar as informações sobre os profissionais e os serviços que cada um realiza.

P3 — Organização dos agendamentos

Os agendamentos são realizados por meio de caderno de papel e WhatsApp. O volume de informações pode dificultar a consulta dos horários e a organização dos atendimentos.

P4 — Acompanhamento dos pagamentos

O estabelecimento recebe pagamentos em dinheiro, PIX, cartão de débito e cartão de crédito. A organização desses registros é importante para acompanhar os valores recebidos.

P5 — Controle de insumos e compras

Os materiais utilizados nos procedimentos são repostos ao final de cada mês. As compras são realizadas mediante contato com fornecedores pelo WhatsApp, sem um cadastro digital centralizado dos fornecedores e sem controle digital do estoque.

P6 — Organização do fechamento de caixa

O fechamento financeiro é realizado mensalmente. Uma parte dos valores é destinada ao consumo do salão e outra parte é distribuída entre os profissionais, conforme a divisão estabelecida.

Escopo do sistema

O projeto propõe um banco de dados relacional para representar e organizar as informações administrativas do Salão dos Primos.

O escopo contempla:

- Cadastro de clientes.
- Cadastro de profissionais.
- Cadastro de especialidades.
- Associação entre profissionais e especialidades.
- Cadastro de procedimentos.
- Registro de agendamentos.
- Controle da situação dos atendimentos.
- Registro de pagamentos.
- Cadastro de fornecedores.
- Registro de compras.
- Registro de itens de compra.
- Cadastro de insumos.
- Controle de movimentações de estoque.
- Registro de fechamentos de caixa.

A proposta busca centralizar as informações que atualmente são organizadas manualmente, permitindo consultas e análises gerenciais.

Política de preços

Os valores dos procedimentos não são necessariamente fixos.

Em determinados serviços, principalmente os relacionados aos cabelos, o preço é informado após a avaliação realizada pelo profissional. São consideradas as condições do cabelo, o comprimento dos fios e as características do procedimento solicitado.

Dessa forma, o valor de referência cadastrado no sistema não representa obrigatoriamente o preço final cobrado pelo atendimento.

Justificativa da escolha

O Salão dos Primos foi escolhido por ser uma organização real e acessível para o levantamento de informações.

A escolha também possui vínculo familiar com uma integrante do grupo, Franciele Souza de Jesus, o que facilitou o contato com a responsável e o conhecimento da rotina administrativa do estabelecimento.

O projeto permite aplicar os conceitos de modelagem de banco de dados em uma situação real, considerando as necessidades de uma organização de pequeno porte.

Evidências da organização

Para comprovar a existência do estabelecimento e o contato com a responsável, serão disponibilizados no repositório:

- Fotografias do estabelecimento.
- Fotografias da visita e entrevista.
- Endereço da organização.
- Informações de contato.
- Outros registros pertinentes à pesquisa de campo.

Pasta de evidências: "evidencias/"

Responsável pela organização

- Nome: Alaide.
- Função: Responsável pelo estabelecimento.
- Telefone: [Confirmar número de contato].

---

Relato da entrevista

Quem

A entrevista foi realizada com Alaide, responsável pelo Salão dos Primos.

Integrante participante: Franciele Souza de Jesus.

Quando e onde

- Data registrada: 20/09/2026.
- Local: Salão dos Primos.
- Ambiente: Instalações do próprio estabelecimento.

Objetivo da entrevista

Compreender o funcionamento do estabelecimento, identificar os processos administrativos existentes e levantar as necessidades relacionadas à organização das informações.

Resumo das informações levantadas

Durante a entrevista, foram identificados os seguintes pontos:

- Os agendamentos são organizados por meio de caderno de papel e WhatsApp.
- O estabelecimento possui aproximadamente quatro profissionais.
- Cada profissional realiza determinados procedimentos, de acordo com sua especialidade.
- Os horários são organizados considerando o tempo médio necessário para cada procedimento.
- Os cancelamentos são comunicados pelo WhatsApp.
- Os pagamentos podem ser realizados em dinheiro, PIX, débito e crédito.
- Os insumos são repostos ao final de cada mês.
- As compras são realizadas por contato direto com fornecedores pelo WhatsApp.
- O fechamento de caixa acontece mensalmente.
- Os valores são divididos entre o consumo do salão e a parte destinada aos profissionais.

Principais dificuldades relatadas

A principal dificuldade identificada está relacionada à organização dos agendamentos. Como as informações são registradas manualmente, a consulta pode ficar confusa e existe a possibilidade de perda do caderno.

Também foi identificada a necessidade de registrar os procedimentos com mais detalhes para os clientes.

Observações presenciais

Durante a visita, foram considerados os seguintes aspectos da rotina:

1. Agendamentos: utilização de caderno de papel para organização dos horários e WhatsApp para comunicação com os clientes.
2. Profissionais: organização dos atendimentos conforme os serviços realizados por cada profissional.
3. Comunicação: utilização do WhatsApp para contato com clientes e fornecedores.
4. Materiais: reposição dos insumos ao final do mês, sem controle digital centralizado.
5. Financeiro: realização de fechamento de caixa mensal e divisão dos valores entre salão e profissionais.

As observações presenciais são apresentadas separadamente das respostas fornecidas pela responsável.

Comprovação: arquivos fotográficos disponíveis na pasta "evidencias/".

Levantamento completo: "Abrir levantamento de requisitos" (levantamento/levantamento.md).

---

Processos de negócio

Os processos de negócio foram identificados considerando as atividades realizadas pelo estabelecimento e as estruturas previstas no banco de dados.

Código| Processo| Descrição
PB01| Cadastro de clientes| Organização dos dados de identificação e contato dos clientes.
PB02| Organização dos profissionais| Identificação dos profissionais e suas especialidades.
PB03| Cadastro de procedimentos| Registro dos serviços oferecidos e suas características.
PB04| Agendamento| Organização de clientes, profissionais, procedimentos, datas e horários.
PB05| Atendimento| Acompanhamento da situação dos agendamentos.
PB06| Pagamentos| Registro dos valores recebidos e das formas de pagamento.
PB07| Compras| Registro das compras realizadas e dos fornecedores.
PB08| Controle de insumos| Organização das quantidades disponíveis e movimentações.
PB09| Fechamento de caixa| Registro dos valores recebidos em determinado período.

Os processos de compras, estoque e fechamento de caixa fazem parte da proposta de organização das informações no banco de dados, considerando as atividades relatadas pela responsável.

Requisitos funcionais

Código| Descrição
RF01| Permitir cadastrar clientes com nome, telefone e e-mail.
RF02| Permitir consultar os clientes cadastrados.
RF03| Permitir cadastrar profissionais com nome, telefone e situação de atividade.
RF04| Permitir cadastrar especialidades dos profissionais.
RF05| Permitir relacionar profissionais às suas especialidades.
RF06| Permitir cadastrar procedimentos com nome, descrição, duração estimada e preço de referência.
RF07| Permitir registrar agendamentos com cliente, profissional, procedimento, data e horários.
RF08| Permitir consultar agendamentos por data, cliente e profissional.
RF09| Permitir atualizar a situação dos agendamentos.
RF10| Permitir registrar pagamentos com valor, data e forma de pagamento.
RF11| Permitir cadastrar fornecedores.
RF12| Permitir registrar compras relacionadas aos fornecedores.
RF13| Permitir registrar os itens de cada compra, com quantidade e valor unitário.
RF14| Permitir cadastrar insumos e suas quantidades em estoque.
RF15| Permitir registrar movimentações de entrada e saída de insumos.
RF16| Permitir relacionar movimentações de saída aos agendamentos, quando aplicável.
RF17| Permitir registrar fechamentos de caixa por período.
RF18| Permitir consultar informações financeiras e gerenciais.

Requisitos não funcionais

Código| Descrição
RNF01| O banco de dados deverá utilizar o SGBD MySQL.
RNF02| A estrutura deverá garantir integridade referencial por meio de chaves primárias e estrangeiras.
RNF03| O banco deverá reduzir redundâncias por meio da normalização.
RNF04| Os dados deverão permitir consultas consistentes.
RNF05| Os valores monetários deverão utilizar tipos numéricos adequados.
RNF06| As informações deverão possuir mecanismos de proteção contra acessos não autorizados quando integradas a uma aplicação.
RNF07| O banco deverá permitir manutenção e evolução de sua estrutura.

Regras de negócio

Código| Regra
RN01| Cada cliente deve possuir um identificador único.
RN02| Cada profissional deve possuir um identificador único.
RN03| Um profissional pode possuir várias especialidades.
RN04| Não devem existir agendamentos ativos com horários sobrepostos para o mesmo profissional.
RN05| Profissionais inativos não devem possuir novos agendamentos ativos.
RN06| Cada agendamento poderá possuir apenas um pagamento registrado na estrutura atual.
RN07| Todo pagamento deverá estar associado a um agendamento existente.
RN08| Toda compra deverá estar associada a um fornecedor cadastrado.
RN09| Toda movimentação de estoque deverá possuir um insumo relacionado e quantidade registrada.
RN10| O fechamento de caixa deverá permitir a conferência dos valores registrados nos pagamentos do período.
RN11| A data final de um agendamento deverá ser posterior ao horário inicial.
RN12| As quantidades de itens de compra deverão ser positivas.
RN13| Os valores dos procedimentos podem variar conforme a avaliação realizada pelo profissional.

Justificativa dos processos típicos não incluídos

Alguns processos comuns em salões de beleza não possuem tabelas específicas no modelo atual.

Processo| Justificativa
Folha de pagamento| Não faz parte do escopo atual do banco.
Controle de comissões| Não existe estrutura específica para esse processo no modelo atual.
Venda de produtos aos clientes| O projeto concentra-se nos procedimentos e na gestão administrativa.
Emissão de notas fiscais| Não foi incluída na estrutura atual.
Marketing e divulgação| Não é um processo de gestão de dados contemplado pelo modelo.

DER conceitual revisado

O DER conceitual representa as entidades e os relacionamentos necessários para organizar as informações do estabelecimento.

O diagrama foi elaborado utilizando o brModelo, seguindo a notação solicitada pelo professor.

Arquivo: "DER/DER_Conceitual.png"

"Visualizar DER conceitual" (DER/DER_Conceitual.png)

Revisões realizadas no modelo

Apontamento ou necessidade| Alteração realizada| Justificativa
Necessidade de representar as especialidades dos profissionais| Inclusão de Profissional_Especialidade| Permitir representar o relacionamento N:N.
Necessidade de organizar os agendamentos| Estruturação da entidade Agendamento| Relacionar clientes, profissionais e procedimentos.
Necessidade de representar pagamentos| Inclusão da entidade Pagamento| Organizar os valores recebidos.
Necessidade de representar compras| Inclusão de Compra e Item_Compra| Registrar fornecedores e materiais adquiridos.
Necessidade de acompanhar insumos| Inclusão de Insumo e Movimentacao_Estoque| Representar entradas e saídas.
Necessidade de organizar o fechamento financeiro| Inclusão de Fechamento_Caixa| Permitir conferência dos valores por período.

---

1.2 Conversão do Modelo Conceitual para o Modelo Lógico

A conversão do modelo conceitual para o modelo lógico foi realizada por meio da transformação das entidades em tabelas relacionais, dos atributos em colunas e dos relacionamentos em chaves estrangeiras.

Entidades convertidas em tabelas

As entidades identificadas no DER foram convertidas nas seguintes tabelas:

1. Cliente
2. Profissional
3. Especialidade
4. Profissional_Especialidade
5. Procedimento
6. Agendamento
7. Pagamento
8. Fornecedor
9. Compra
10. Item_Compra
11. Insumo
12. Movimentacao_Estoque
13. Fechamento_Caixa

Conversão dos relacionamentos

- Relacionamento 1:N: implementado por meio de chave estrangeira na tabela do lado N.
- Relacionamento N:N: implementado por meio da tabela associativa Profissional_Especialidade.
- Relacionamento entre agendamento e pagamento: implementado por meio da chave estrangeira id_agendamento na tabela Pagamento.
- Relacionamento entre compra e itens: implementado por meio da chave estrangeira id_compra em Item_Compra.
- Relacionamento entre insumos e movimentações: implementado por meio da chave estrangeira id_insumo.

O modelo atual não utiliza generalização ou especialização.

---

1.3 Definição de Chaves Primárias e Estrangeiras

Tabela| Chave primária (PK)| Chaves estrangeiras (FK)
Cliente| id_cliente| —
Profissional| id_profissional| —
Especialidade| id_especialidade| —
Profissional_Especialidade| id_profissional + id_especialidade| id_profissional, id_especialidade
Procedimento| id_procedimento| —
Agendamento| id_agendamento| id_cliente, id_profissional, id_procedimento
Pagamento| id_pagamento| id_agendamento
Fornecedor| id_fornecedor| —
Compra| id_compra| id_fornecedor
Item_Compra| id_item_compra| id_compra, id_insumo
Insumo| id_insumo| —
Movimentacao_Estoque| id_movimentacao| id_insumo, id_agendamento
Fechamento_Caixa| id_fechamento| —

As chaves primárias identificam individualmente os registros de cada tabela. As chaves estrangeiras estabelecem os relacionamentos entre as entidades e garantem a integridade referencial.

---

1.4 Processo de Normalização (1FN, 2FN e 3FN)

A normalização foi considerada durante a organização das tabelas, com o objetivo de reduzir redundâncias e evitar inconsistências nos registros.

Primeira Forma Normal (1FN)

A primeira forma normal exige que os atributos possuam valores atômicos, sem grupos repetitivos ou listas de valores em uma mesma coluna.

No projeto, as especialidades dos profissionais foram separadas em uma tabela própria e relacionadas por meio da tabela associativa Profissional_Especialidade.

Os itens de cada compra também foram separados na tabela Item_Compra, permitindo registrar diferentes insumos em uma mesma compra.

Segunda Forma Normal (2FN)

A segunda forma normal exige que todos os atributos não pertencentes à chave dependam integralmente da chave primária.

Na tabela Profissional_Especialidade, a chave primária é composta por id_profissional e id_especialidade.

A tabela não possui atributos não-chave que dependam apenas de uma parte dessa chave.

Nas demais tabelas, foram utilizados identificadores próprios para os registros.

Terceira Forma Normal (3FN)

A terceira forma normal exige a eliminação de dependências transitivas entre atributos não-chave.

No modelo, informações de clientes, profissionais, especialidades, procedimentos, fornecedores e insumos foram organizadas em tabelas específicas.

Os relacionamentos são estabelecidos por meio das chaves estrangeiras, evitando a repetição desnecessária dessas informações em outras tabelas.

Justificativa

A normalização foi utilizada para organizar os dados de maneira estruturada, reduzir duplicidades e facilitar a manutenção das informações.

Essa organização permite que clientes, profissionais, procedimentos, pagamentos e demais registros sejam consultados sem a necessidade de repetir informações em diversas tabelas.

---

1.5 Justificativas Técnicas das Decisões

Chaves primárias

Foram utilizados identificadores numéricos com incremento automático ("AUTO_INCREMENT") para facilitar a identificação dos registros e evitar duplicidade de identificadores.

Na tabela Profissional_Especialidade, foi utilizada uma chave primária composta por id_profissional e id_especialidade, impedindo a repetição da mesma associação.

Chaves estrangeiras

As chaves estrangeiras foram utilizadas para manter a relação entre os registros.

Por exemplo:

- Agendamento referencia Cliente, Profissional e Procedimento.
- Pagamento referencia Agendamento.
- Compra referencia Fornecedor.
- Item_Compra referencia Compra e Insumo.
- Movimentacao_Estoque referencia Insumo e, opcionalmente, Agendamento.

Restrições de integridade

Foram utilizadas restrições para garantir a consistência dos registros.

Restrição| Aplicação| Justificativa
PRIMARY KEY| Todas as tabelas| Identificação única dos registros.
FOREIGN KEY| Tabelas relacionadas| Integridade referencial.
NOT NULL| Campos obrigatórios| Impedir ausência de informações essenciais.
UNIQUE| Pagamento.id_agendamento| Limitar um pagamento por agendamento.
DEFAULT| Profissional.ativo e Agendamento.situacao| Definir valores iniciais.

Tipos de dados

Foram utilizados tipos de dados adequados às informações armazenadas:

- "INT": identificadores e quantidades.
- "VARCHAR": nomes, descrições, telefones e situações.
- "DATE": datas.
- "TIME": horários.
- "BOOLEAN": situação de atividade.
- "DECIMAL(10,2)": valores monetários.

A utilização de DECIMAL permite representar valores financeiros com precisão adequada.

Decisões arquiteturais

O projeto utiliza um banco de dados relacional, organizado em tabelas relacionadas por chaves primárias e estrangeiras.

A separação das informações permite consultas envolvendo diferentes áreas da administração do estabelecimento, como agendamentos, pagamentos, compras e estoque.

---

1.6 Proposta de Arquitetura Analítica para BI e IA

A estrutura do banco de dados permite propor análises que podem auxiliar a responsável pelo estabelecimento na tomada de decisões.

Informações estratégicas

Entre as informações que podem ser extraídas estão:

- Quantidade de agendamentos por período.
- Procedimentos mais realizados.
- Quantidade de atendimentos concluídos e cancelados.
- Valores recebidos por forma de pagamento.
- Situação dos insumos.
- Valores gastos em compras.
- Comparação entre pagamentos e fechamentos de caixa.

Indicadores e métricas gerenciais (KPIs)

Indicador| Fórmula| Periodicidade
Quantidade de agendamentos| Contagem dos agendamentos registrados| Mensal
Procedimentos mais realizados| Contagem de atendimentos concluídos por procedimento| Mensal
Total recebido| Soma dos valores dos pagamentos| Mensal
Insumos abaixo do mínimo| Contagem dos insumos com quantidade menor ou igual ao mínimo| Mensal
Valor das compras| Soma de quantidade × valor unitário dos itens| Mensal
D