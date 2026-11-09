# Levantamento de Requisitos — Salão dos Primos

## 1. Caracterização da organização

### 1.1 Identificação

- **Nome:** Salão dos Primos
- **Natureza:** Estabelecimento comercial do ramo de beleza e estética.
- **Responsável:** Alaide Souza Lacerda.
- **Endereço:** R. Bernardino Vergueiro, 276 - Jardim Jaú (Zona Leste), São Paulo - SP, 03710-060.
- **Telefone para contato:** 11 94696-7621.
- **Quantidade de profissionais:** aproximadamente 4.
- **Quantidade de clientes:** aproximadamente 30 a 50.

### 1.2 Contexto e porte

O Salão dos Primos é um estabelecimento comercial que atua no segmento de beleza e estética, oferecendo diferentes procedimentos realizados por profissionais da área.

A operação envolve o relacionamento com clientes, a organização dos profissionais, a oferta de procedimentos e o agendamento dos atendimentos.

Com base nas informações levantadas, o estabelecimento conta com aproximadamente quatro profissionais e um público estimado entre 30 e 50 clientes. Esses números poderão ser confirmados com a responsável para representar com maior precisão o porte e o volume de atividades da organização.

### 1.3 Problemas e necessidades identificados

Os problemas e as necessidades apresentados nesta seção foram identificados a partir das informações levantadas durante a entrevista.

- **P1 — Organização dos dados dos clientes:** necessidade de manter as informações de identificação e contato dos clientes organizadas e disponíveis para consulta.
- **P2 — Organização dos agendamentos:** necessidade de registrar e consultar os atendimentos, relacionando clientes, profissionais, procedimentos, datas e horários.
- **P3 — Controle de profissionais e especialidades:** necessidade de identificar os profissionais disponíveis e os procedimentos que cada um pode realizar.
- **P4 — Acompanhamento dos atendimentos:** necessidade de consultar a situação dos agendamentos e manter registros organizados dos atendimentos.
- **P5 — Controle financeiro:** necessidade de organizar os pagamentos recebidos e consultar os valores por período.
- **P6 — Controle de insumos:** necessidade de acompanhar os materiais utilizados, as quantidades disponíveis e a reposição de estoque.
- **P7 — Organização de compras e fornecedores:** possibilidade de registrar fornecedores, compras realizadas e os itens adquiridos.
- **P8 — Definição de preços dos procedimentos:** necessidade de registrar valores individualizados, considerando a avaliação das condições e do comprimento do cabelo do cliente, além do procedimento solicitado.

**Observação:** os módulos financeiros, de estoque e de fornecedores deverão representar os procedimentos efetivamente realizados pelo salão. As informações deverão ser validadas com a responsável.

### 1.4 Escopo do sistema

O projeto propõe a criação de um banco de dados relacional para organizar as informações do Salão dos Primos.

O escopo preliminar do modelo lógico contempla:

- Cadastro de clientes.
- Cadastro de profissionais.
- Cadastro de especialidades.
- Associação entre profissionais e especialidades.
- Cadastro de procedimentos.
- Registro de agendamentos.
- Registro dos valores definidos para os procedimentos.
- Registro de pagamentos.
- Cadastro de fornecedores.
- Registro de compras.
- Registro dos itens de cada compra.
- Cadastro de insumos.
- Controle de movimentações de estoque.
- Registro de fechamentos de caixa.

O escopo definitivo deverá contemplar os processos existentes na organização. Os módulos financeiros e de estoque deverão ser mantidos de acordo com as informações confirmadas pela responsável e com os objetivos definidos para o projeto.

### 1.5 Justificativa da escolha

O Salão dos Primos foi escolhido como objeto de estudo por ser uma organização real do ramo de beleza e estética, permitindo analisar processos de atendimento, relacionamento com clientes e organização das atividades profissionais.

A escolha também possibilita aplicar conceitos de modelagem de dados em um cenário prático, aproximando o desenvolvimento acadêmico das necessidades de uma organização de pequeno porte.

A integrante do grupo Franciele Souza possui vínculo familiar com o estabelecimento, o que facilita o contato com a responsável e a compreensão dos processos realizados no local.

### 1.6 Evidências da organização

Para comprovar a existência da organização e o acesso do grupo, poderão ser disponibilizados:

- Fotografias do estabelecimento.
- Endereço completo.
- Telefone ou outra forma de contato.
- Perfil da organização no Google, caso exista.
- Registros da visita realizada pelo grupo.

**Arquivos de evidência:** `evidencias/`

---

## 2. Relato da entrevista

### 2.1 Identificação da entrevista

- **Organização:** Salão dos Primos.
- **Entrevistada:** Alaide Souza Lacerda.
- **Função:** Alaide.
- **Data:** 20/09/2026.
- **Local:** Salão dos Primos.
- **Integrantes participantes:** Franciele Souza.

### 2.2 Objetivo

A entrevista tem como objetivo compreender o funcionamento do Salão dos Primos, identificar os processos realizados no estabelecimento e levantar as necessidades relacionadas à organização e ao gerenciamento das informações.

As informações coletadas servirão como base para validar o modelo conceitual, os requisitos funcionais, os requisitos não funcionais e as regras de negócio do banco de dados.

### 2.3 Perguntas utilizadas no levantamento

As perguntas a seguir orientaram a coleta de informações com a responsável:

1. Como os clientes realizam os agendamentos atualmente?
2. Como são armazenados os dados dos clientes?
3. Quantos profissionais trabalham no estabelecimento?
4. Quais procedimentos são oferecidos?
5. Todos os profissionais realizam os mesmos procedimentos?
6. Como são organizados os horários e a duração dos atendimentos?
7. Como são registrados os cancelamentos e os atendimentos concluídos?
8. Como os pagamentos são recebidos e registrados?
9. O estabelecimento realiza controle de estoque de produtos e insumos?
10. Como são realizadas e registradas as compras de materiais?
11. Existe cadastro de fornecedores?
12. É realizado fechamento de caixa? Como funciona?
13. Quais são as principais dificuldades na organização das informações?
14. Quais melhorias seriam mais importantes para o estabelecimento?

### 2.4 Respostas da entrevista

1. Atualmente, os agendamentos dos clientes são registrados em um caderno de papel.
2. Os dados dos clientes são identificados pelo nome utilizado no WhatsApp e pelas anotações no caderno.
3. Atualmente, trabalham quatro profissionais no estabelecimento.
4. São oferecidos os seguintes procedimentos: corte de cabelo feminino e masculino, progressiva, coloração, botox capilar, design de sobrancelhas, serviços de unhas, tratamento capilar, escova e luzes.
5. Não. Cada profissional realiza determinados procedimentos, de acordo com suas especialidades.
6. Os horários são organizados considerando o tempo médio necessário para a realização de cada procedimento.
7. Os cancelamentos são comunicados pelo WhatsApp. Os atendimentos são concluídos presencialmente, após a realização do serviço.
8. Os pagamentos são recebidos em dinheiro, Pix, cartão de débito e cartão de crédito.
9. O estoque e os insumos são abastecidos ao final de cada mês, mas não existe um controle digital que permita acompanhar essas informações de maneira prática.
10. As compras são realizadas por meio de contato digital com os fornecedores. Os produtos são recebidos por entrega.
11. Não existe um cadastro formal de fornecedores. Os profissionais entram em contato com eles pelo WhatsApp.
12. Sim. O fechamento de caixa é realizado ao final de cada mês. Uma parte dos valores é destinada ao consumo do salão e outra parte é dividida entre os profissionais, conforme a divisão estabelecida.
13. A principal dificuldade está na organização dos agendamentos. Como existem muitos compromissos registrados em papel, as informações podem ficar confusas, além de existir o risco de perda do caderno.
14. As melhorias consideradas mais importantes são a organização dos agendamentos e a apresentação de informações mais detalhadas sobre os procedimentos para os clientes.

**Informação complementar sobre os preços:** os valores dos procedimentos não são fixos. O preço é definido após a avaliação do cabelo do cliente, considerando seu estado, comprimento e o procedimento desejado.

### 2.5 Observações presenciais

As observações a seguir foram organizadas separadamente das respostas fornecidas pela entrevistada. Elas descrevem os procedimentos administrativos informados durante o levantamento e não devem ser interpretadas como funcionalidades que já existem em um sistema informatizado.

#### 1. Organização dos agendamentos

Os agendamentos são organizados por meio de anotações em um caderno de papel e de conversas pelo WhatsApp. Os clientes entram em contato para consultar horários e solicitar atendimentos. As informações dos compromissos são registradas manualmente, o que exige atenção para acompanhar os horários e organizar a rotina dos profissionais.

#### 2. Comunicação com os clientes

O WhatsApp é utilizado como canal de comunicação entre o salão e seus clientes. Por meio dele, são realizadas conversas relacionadas aos atendimentos, à consulta de horários e à comunicação de cancelamentos.

#### 3. Organização dos profissionais

O estabelecimento conta com quatro profissionais, que não realizam necessariamente os mesmos procedimentos. A organização dos atendimentos considera os serviços que cada profissional está apto a realizar e o tempo médio necessário para cada procedimento.

#### 4. Controle financeiro

Os pagamentos são recebidos em dinheiro, Pix, cartão de débito e cartão de crédito. Segundo as informações fornecidas, o fechamento de caixa ocorre ao final de cada mês, quando os valores são divididos entre a parte destinada ao salão e a parte destinada aos profissionais.

#### 5. Controle de materiais e estoque

O abastecimento dos materiais e insumos ocorre ao final de cada mês. Entretanto, não existe um controle digital para acompanhar as quantidades disponíveis. As compras são realizadas por contato com fornecedores por meio do WhatsApp, e os produtos são recebidos por entrega.

#### 6. Definição dos preços dos procedimentos

Os preços dos procedimentos são definidos individualmente, após a avaliação do cabelo do cliente. São considerados fatores como o estado atual do cabelo, seu comprimento e o procedimento solicitado. Dessa forma, um mesmo procedimento poderá apresentar valores diferentes dependendo das características avaliadas.

### Observações da visita

O funcionamento administrativo do salão depende principalmente de registros manuais e da comunicação por aplicativos. O caderno de papel e o WhatsApp são os principais recursos utilizados para organizar os agendamentos e manter contato com os clientes.

A utilização desses recursos apresenta limitações para a consulta e a organização das informações, especialmente diante da quantidade de atendimentos. A responsável também apontou o risco de perda do caderno como uma dificuldade.

Além disso, a definição individual dos preços exige que as informações sobre os valores combinados sejam registradas de maneira organizada, permitindo consultar posteriormente o valor referente a cada atendimento.

Essas condições demonstram uma oportunidade de melhoria por meio de um sistema informatizado, que poderá centralizar os registros, facilitar a consulta dos agendamentos e contribuir para uma organização mais prática das atividades.

### 2.6 Comprovação

**Arquivos de evidência:** `evidencias/`

---

## 3. Processos de negócio

Os processos apresentados a seguir representam as principais atividades contempladas na proposta de sistema de gestão do Salão dos Primos. Eles foram organizados de acordo com as entidades e os relacionamentos previstos no modelo lógico, abrangendo o cadastro de clientes e profissionais, o gerenciamento de especialidades, o controle de agendamentos e pagamentos, além da administração de fornecedores, compras, insumos, movimentações de estoque e fechamento de caixa.

A descrição desses processos estabelece o escopo funcional proposto para o sistema e serve de base para a definição dos requisitos funcionais e das regras de negócio.

### PB01 — Cadastro de clientes

O processo consiste em registrar os dados dos clientes para permitir sua identificação e facilitar consultas futuras.

**Dados envolvidos:**

- Identificador do cliente.
- Nome.
- Telefone.
- E-mail.

### PB02 — Cadastro de profissionais

O processo consiste em registrar os profissionais que trabalham no estabelecimento, mantendo informações de identificação, contato e situação de atividade.

**Dados envolvidos:**

- Identificador do profissional.
- Nome.
- Telefone.
- Situação de atividade.

### PB03 — Organização de especialidades

O processo consiste em registrar as especialidades disponíveis e associá-las aos profissionais que realizam os respectivos serviços.

**Dados envolvidos:**

- Identificador da especialidade.
- Nome da especialidade.
- Identificador do profissional.

### PB04 — Cadastro de procedimentos

O processo consiste em registrar os procedimentos oferecidos pelo salão, incluindo nome e descrição. Os preços não são previamente fixados, pois são definidos individualmente após a avaliação do cabelo do cliente.

**Dados envolvidos:**

- Identificador do procedimento.
- Nome.
- Descrição.
- Duração estimada.

### PB05 — Agendamento de atendimentos

O processo consiste em registrar os atendimentos programados, relacionando o cliente, o profissional responsável e o procedimento solicitado. Também deverá permitir registrar o valor combinado após a avaliação do cliente.

**Dados envolvidos:**

- Identificador do agendamento.
- Cliente.
- Profissional.
- Procedimento.
- Data.
- Horário de início.
- Horário de término.
- Situação.
- Observações.
- Valor definido para o atendimento.

### PB06 — Registro de pagamentos

Processo proposto para registrar os valores recebidos referentes aos atendimentos realizados.

**Dados envolvidos:**

- Identificador do pagamento.
- Valor pago.
- Data do pagamento.
- Forma de pagamento.
- Agendamento relacionado.

### PB07 — Cadastro de fornecedores e compras

Processo proposto para registrar os fornecedores e as compras de materiais realizadas pelo estabelecimento. Atualmente, o contato com os fornecedores ocorre por meio do WhatsApp, sem um cadastro formal.

**Dados envolvidos:**

- Identificador do fornecedor.
- Nome do fornecedor.
- Identificador da compra.
- Data da compra.
- Insumos adquiridos.
- Quantidades.
- Valores unitários.

### PB08 — Controle de insumos e movimentações de estoque

Processo proposto para registrar os insumos utilizados pelo estabelecimento e acompanhar suas movimentações. A proposta considera a necessidade identificada de melhorar o acompanhamento dos materiais, uma vez que não existe controle digital de estoque.

**Dados envolvidos:**

- Identificador do insumo.
- Nome.
- Quantidade em estoque.
- Estoque mínimo.
- Tipo de movimentação.
- Quantidade movimentada.
- Data da movimentação.
- Agendamento relacionado, quando aplicável.

### PB09 — Fechamento de caixa

Processo proposto para registrar os fechamentos financeiros por período, considerando os pagamentos realizados. O levantamento identificou que o fechamento atual ocorre mensalmente e envolve a divisão dos valores entre o salão e os profissionais.

**Dados envolvidos:**

- Identificador do fechamento.
- Data inicial.
- Data final.
- Total recebido.

---

## 4. Requisitos funcionais

| Código | Descrição |
|---|---|
| RF01 | O sistema deverá permitir cadastrar clientes com identificador, nome, telefone e e-mail. |
| RF02 | O sistema deverá permitir consultar e atualizar os dados dos clientes cadastrados. |
| RF03 | O sistema deverá permitir cadastrar profissionais com identificador, nome, telefone e situação de atividade. |
| RF04 | O sistema deverá permitir cadastrar especialidades por meio de identificador e nome. |
| RF05 | O sistema deverá permitir associar profissionais às especialidades que realizam. |
| RF06 | O sistema deverá permitir cadastrar procedimentos com nome, descrição e duração estimada, sem exigir um preço fixo. |
| RF07 | O sistema deverá permitir registrar agendamentos relacionando cliente, profissional e procedimento. |
| RF08 | O sistema deverá armazenar data, horário de início, horário de término, situação e observações de cada agendamento. |
| RF09 | O sistema deverá permitir consultar agendamentos por cliente, profissional, procedimento e período. |
| RF10 | O sistema deverá permitir atualizar a situação de um agendamento. |
| RF11 | O sistema deverá permitir registrar o valor definido para cada atendimento após a avaliação do cabelo do cliente. |
| RF12 | O sistema deverá permitir registrar pagamentos com valor, data, forma de pagamento e agendamento relacionado. |
| RF13 | O sistema deverá permitir cadastrar fornecedores com identificador e nome. |
| RF14 | O sistema deverá permitir registrar compras com fornecedor e data da compra. |
| RF15 | O sistema deverá permitir registrar os itens de cada compra com insumo, quantidade e valor unitário. |
| RF16 | O sistema deverá permitir cadastrar insumos com nome, quantidade em estoque e estoque mínimo. |
| RF17 | O sistema deverá permitir registrar movimentações de estoque com tipo, quantidade, data e insumo relacionado. |
| RF18 | O sistema deverá permitir relacionar uma movimentação de estoque a um agendamento, quando aplicável. |
| RF19 | O sistema deverá permitir registrar fechamentos de caixa com data inicial, data final e total recebido. |
| RF20 | O sistema deverá permitir gerar consultas sobre agendamentos, pagamentos, compras e estoque. |

---

## 5. Requisitos não funcionais

| Código | Descrição |
|---|---|
| RNF01 | O banco de dados deverá ser implementado utilizando o SGBD MySQL. |
| RNF02 | O banco deverá manter a integridade dos dados por meio de chaves primárias e estrangeiras. |
| RNF03 | Os dados deverão ser organizados de forma a reduzir redundâncias desnecessárias. |
| RNF04 | O sistema deverá permitir consultas consistentes às informações armazenadas. |
| RNF05 | Os valores monetários deverão utilizar tipos numéricos adequados para evitar perda de precisão. |
| RNF06 | O acesso às informações deverá ser restrito a pessoas autorizadas quando o banco estiver integrado a uma aplicação. |
| RNF07 | A estrutura deverá utilizar restrições de integridade para impedir registros incompatíveis com as regras definidas. |
| RNF08 | A estrutura deverá permitir manutenção e evolução conforme as necessidades da organização. |

---

## 6. Regras de negócio

As regras abaixo foram propostas a partir das informações levantadas e da estrutura do modelo lógico. As regras que dependem da operação real deverão ser confirmadas pela responsável.

| Código | Regra |
|---|---|
| RN01 | Cada cliente deverá possuir um identificador único. |
| RN02 | Cada profissional deverá possuir um identificador único. |
| RN03 | Um profissional poderá estar associado a várias especialidades. |
| RN04 | Uma especialidade poderá estar associada a vários profissionais. |
| RN05 | Todo agendamento deverá estar relacionado a um cliente cadastrado. |
| RN06 | Todo agendamento deverá estar relacionado a um profissional cadastrado. |
| RN07 | Todo agendamento deverá estar relacionado a um procedimento cadastrado. |
| RN08 | Profissionais inativos não deverão receber novos agendamentos. |
| RN09 | O horário final de um agendamento deverá ser posterior ao horário inicial. |
| RN10 | Um agendamento poderá possuir, no máximo, um pagamento registrado, conforme a estrutura proposta no modelo. |
| RN11 | Todo pagamento deverá estar relacionado a um agendamento existente. |
| RN12 | Toda compra deverá estar relacionada a um fornecedor cadastrado. |
| RN13 | Cada item de compra deverá estar relacionado a uma compra e a um insumo existentes. |
| RN14 | A quantidade de um item de compra deverá ser positiva. |
| RN15 | Toda movimentação de estoque deverá possuir um insumo, tipo, quantidade e data registrados. |
| RN16 | Uma movimentação poderá estar relacionada a um agendamento, quando aplicável. |
| RN17 | O fechamento de caixa deverá possuir um período válido, com data inicial anterior ou igual à data final. |
| RN18 | O valor de cada procedimento deverá ser definido individualmente, considerando a avaliação do cabelo do cliente, seu comprimento e o procedimento solicitado. |
| RN19 | O valor acordado para o atendimento deverá ser registrado no respectivo agendamento. |

---

## 7. Processos típicos não incluídos no modelo

Alguns processos comuns em estabelecimentos de beleza não aparecem como entidades específicas no modelo lógico atual.

| Processo | Situação no projeto |
|---|---|
| Cadastro de funcionários com dados contratuais | Não representado como processo separado; os profissionais são cadastrados com informações básicas. |
| Controle de comissões | Não contemplado no modelo atual. |
| Controle de produtos vendidos aos clientes | Não contemplado como processo de venda separado. |
| Emissão de notas fiscais | Não contemplada no modelo atual. |
| Controle de folha de pagamento | Fora do escopo atual. |
| Gestão de campanhas de marketing | Fora do escopo atual. |

A ausência desses processos deverá ser justificada com base nas informações fornecidas pela responsável e no escopo definido para o projeto.

---

## 8. Considerações finais

O levantamento de requisitos teve como finalidade compreender as necessidades informacionais do Salão dos Primos e estabelecer uma base para a construção de um banco de dados relacional.

A entrevista permitiu identificar que a organização dos agendamentos é uma das principais dificuldades do estabelecimento. Atualmente, os registros são realizados em um caderno de papel e as conversas com os clientes ocorrem principalmente pelo WhatsApp. Essa forma de organização pode dificultar a consulta das informações e apresenta o risco de perda dos registros físicos.

Outro aspecto identificado é a definição individual dos preços dos procedimentos. Os valores são estabelecidos após a avaliação do cabelo do cliente, considerando suas condições, seu comprimento e o serviço solicitado. Portanto, o sistema deverá permitir registrar o valor específico acordado para cada atendimento, sem depender de preços fixos previamente cadastrados.

O modelo proposto contempla o cadastro de clientes, profissionais, especialidades e procedimentos, além do gerenciamento dos agendamentos. Também apresenta estruturas para pagamentos, fornecedores, compras, insumos, movimentações de estoque e fechamentos de caixa, de acordo com o escopo definido para o projeto.

O Salão dos Primos possui uma clientela recorrente, o que reforça a importância de organizar os registros e os atendimentos. Dessa forma, a implantação de uma solução informatizada poderá contribuir para centralizar as informações, facilitar a consulta dos agendamentos e tornar a gestão das atividades mais prática.
