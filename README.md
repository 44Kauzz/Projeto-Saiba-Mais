# Sistema de Acesso a Serviços Básicos e Campanhas Públicas

## Descrição do Problema
Atualmente, muitas pessoas enfrentam dificuldades no acesso a serviços públicos essenciais como vacinação, agendamento de consultas e informações sobre unidades de saúde. Isso resulta em ineficiência no atendimento e, muitas vezes, em problemas de saúde pública evitáveis.

Este projeto visa ampliar o acesso da população a esses serviços, proporcionando:
- **Agendamento online de consultas e serviços de saúde.**
- **Notificações de vacinação e campanhas de saúde.**
- **Mapeamento de unidades de saúde.**

## Objetivo do Projeto
O sistema foi desenvolvido para melhorar a interação entre a população e os serviços de saúde, proporcionando uma interface simples e eficiente para o agendamento, a consulta de informações sobre serviços e o recebimento de notificações importantes.

## Desenvolvimento Inicial

### Funcionalidades Iniciais
Até o momento, o desenvolvimento do projeto está focado nas seguintes funcionalidades:
- **Cadastro de Usuário (CRUD)**: Os usuários podem se cadastrar no sistema, armazenando informações como nome, CPF e dados de contato.
- **Cadastro de Histórico Médico**: Os usuários podem registrar e consultar seu histórico médico no sistema.
- **Localização de Postos de Saúde**: O sistema está integrado com uma API de mapas para localizar os postos de saúde mais próximos ao usuário.
- **Agendamento de Consultas**: A funcionalidade de agendamento de consultas está em desenvolvimento.
- **Notificação de Vacinação**: O envio de notificações de vacinação será implementado nas próximas fases.

### Tecnologias Utilizadas

## Banco de Dados

O sistema utiliza um **banco de dados relacional** para gerenciar as informações dos usuários, agendamentos de consultas, histórico médico e unidades de saúde. As tabelas principais incluem:

1. **usuarios**: Armazena informações sobre os pacientes e profissionais de saúde, como **nome**, **CPF**, **email**, **telefone**, entre outros dados.
2. **unidade`**: Contém informações sobre as unidades de saúde, como **nome**, **localização** e **tipo de serviço** oferecido.
3. **tipoConsulta**: Registra os diferentes **tipos de consultas** que os pacientes podem agendar, como consultas médicas, psicológicas, etc.
4. **agendamentos**: Relaciona os **pacientes** aos **tipos de consulta** e **unidades de saúde**, com informações sobre a **data do agendamento**.

### Relacionamentos entre as tabelas:
- **usuarios** está relacionado a **agendamentos** por **idusuario**.
- **agendamentos** está relacionado a **unidades** e **tipoConsulta**, permitindo o agendamento de consultas em unidades específicas.

### Estrutura do Banco de Dados:
O banco de dados é projetado para ser **normalizado**, garantindo a consistência e integridade dos dados, com chaves primárias e estrangeiras bem definidas entre as tabelas.

---

## Ferramentas e Tecnologias Utilizadas

1. **MySQL**:
   - Utilizamos o **MySQL** como sistema de gerenciamento de banco de dados (SGBD). O MySQL foi escolhido por sua **alta performance**, **robustez** e **capacidade de escalabilidade** para gerenciar dados relacionais com alta eficiência.

2. **MySQL Workbench**:
   - O **MySQL Workbench** foi utilizado para a **modelagem** e **design** do banco de dados, incluindo a criação do diagrama **EER** (Enhanced Entity-Relationship). Ele foi fundamental para visualizar as tabelas, seus campos e os relacionamentos entre elas.

---

## Como Rodar o Projeto

**Pré-requisitos**:
1. **MySQL**: O banco de dados precisa estar configurado no seu ambiente. Você pode **instalar o MySQL** localmente ou usar um serviço de banco de dados em nuvem.

### Pré-requisitos
Certifique-se de ter os seguintes programas instalados:
**MySQL Workbench**

### Passos para Execução
