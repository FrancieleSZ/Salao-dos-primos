# Relatório Técnico Final — Salão dos Primos

## 1. Introdução

Este projeto apresenta a modelagem de um banco de dados para o salão Salão dos Primos, com o objetivo de organizar e estruturar as informações relacionadas às atividades do estabelecimento.

O levantamento das informações foi realizado com a responsável pelo salão, considerando os processos atualmente utilizados.

**Importante:** atualmente, o salão realiza seus controles manualmente, utilizando caderno de papel e WhatsApp. O sistema de banco de dados desenvolvido faz parte de uma proposta acadêmica, não sendo uma ferramenta já utilizada pelo estabelecimento.

## 2. Levantamento de Requisitos

### 2.1. Contextualização

O salão possui profissionais que realizam diferentes procedimentos e atende clientes mediante agendamento.

Atualmente, as informações são organizadas manualmente, o que pode dificultar a consulta e o acompanhamento dos horários.

### 2.2. Regras de Negócio

- Os clientes podem realizar agendamentos no salão.
- Cada agendamento deve estar associado a um cliente.
- Cada agendamento deve estar associado a um profissional.
- Os procedimentos devem ser cadastrados para facilitar sua identificação.
- Os profissionais podem possuir diferentes especialidades.
- O valor de determinados procedimentos depende da avaliação das condições e do comprimento do cabelo do cliente.
- Portanto, o preço informado antes da avaliação não deve ser considerado necessariamente um valor definitivo.

### 2.3. Requisitos Funcionais

- **RF01:** Cadastrar clientes.
- **RF02:** Cadastrar profissionais.
- **RF03:** Cadastrar especialidades.
- **RF04:** Relacionar profissionais às suas especialidades.
- **RF05:** Cadastrar procedimentos.
- **RF06:** Registrar agendamentos.
- **RF07:** Consultar informações cadastradas.

### 2.4. Requisitos Não Funcionais

- **RNF01:** Manter a integridade dos dados.
- **RNF02:** Evitar registros duplicados.
- **RNF03:** Organizar as informações por meio de tabelas relacionadas.
- **RNF04:** Permitir consultas aos dados armazenados.

## 3. Modelagem do Banco de Dados

### 3.1. Modelo Conceitual

O modelo conceitual representa as entidades envolvidas no contexto do salão e seus relacionamentos.

### 3.2. Modelo Lógico

O modelo lógico apresenta a estrutura das tabelas, seus atributos e os relacionamentos entre elas.

### 3.3. Chaves Primárias e Estrangeiras

As chaves primárias identificam individualmente os registros de cada tabela. As chaves estrangeiras estabelecem os relacionamentos entre as entidades, garantindo a integridade referencial.

## 4. Normalização

A normalização foi considerada durante a construção do modelo lógico, buscando reduzir redundâncias e organizar os dados.

### 4.1. Primeira Forma Normal (1FN)

Os atributos devem apresentar valores atômicos, sem listas ou conjuntos de valores dentro de uma mesma coluna.

### 4.2. Segunda Forma Normal (2FN)

Os atributos não-chave devem depender integralmente da chave primária.

### 4.3. Terceira Forma Normal (3FN)

Os atributos não-chave devem depender diretamente da chave primária, evitando dependências transitivas.

## 5. Implementação SQL

A implementação do banco de dados foi realizada por meio de comandos SQL.

O script está organizado para criar as estruturas necessárias ao armazenamento das informações.

Arquivo: `script.sql`

## 6. Massa de Dados

A massa de dados contém registros utilizados para testar a estrutura do banco de dados e verificar os relacionamentos entre as tabelas.

Arquivo: `massa de dados.sql`

## 7. Consultas SQL

As consultas SQL foram desenvolvidas para demonstrar a recuperação e análise das informações armazenadas no banco de dados.

As consultas devem ser executadas considerando a estrutura e os dados existentes no projeto.

## 8. Considerações Finais

O desenvolvimento deste projeto permitiu aplicar os conceitos de levantamento de requisitos, modelagem conceitual, modelagem lógica, normalização e implementação de banco de dados.

A proposta busca representar de maneira estruturada os processos e as informações do Salão dos Primos, considerando a realidade observada durante o levantamento.