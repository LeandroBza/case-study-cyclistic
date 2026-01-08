# Projeto Cyclistic – Análise de Dados de Uso de Bicicletas

## Introdução
Este projeto tem como objetivo analisar as diferenças de comportamento entre usuários casuais e membros anuais do serviço de bicicletas compartilhadas Cyclistic, com o propósito de apoiar a equipe de marketing no planejamento de estratégias para aumentar a conversão de usuários casuais em membros.

O projeto foi desenvolvido como parte do capstone do Google Data Analytics Professional Certificate, utilizando dados reais e públicos de viagens de bicicletas. Os dados utilizados são disponibilizados pela Divvy Bikes, empresa responsável pelo sistema de bicicletas compartilhadas da cidade de Chicago (EUA).

## 1. Problema de Negócio
A Cyclistic é uma empresa de compartilhamento de bicicletas que oferece diferentes tipos de planos de uso, incluindo viagens avulsas para usuários casuais e planos de assinatura anual para membros. Análises internas indicam que os membros anuais são mais rentáveis para o negócio.
Atualmente, uma grande parte dos usuários utiliza o serviço de forma casual, sem aderir ao plano anual. A equipe de marketing busca entender como o comportamento de uso desses dois grupos difere, a fim de desenvolver estratégias mais eficazes para converter usuários casuais em membros anuais.

### 1.1 Objetivo da Análise
O objetivo desta análise é identificar e comparar os padrões de uso entre usuário casuais e membros anuais do serviço de bicicletas compartilhadas Cyclistic, analisando aspectos como duração das viagens, dias da semana, horários de uso e locais mais utilizados.
A partir dessa comparação, busca-se a gerar insights que auxiliem a equipe de marketing no desenvolvimento de estratégias direcionadas para aumentar a conversão de usuários casuais em membros anuais.

### 1.2 Perguntas Analíticas
Para atingir o objetivo da análise, as seguintes perguntas orientaram a exploração dos dados:

1. Quais são as diferenças no volume de viagens entre usuários casuais e membros anuais ao longo do tempo?
2. Como a duração média das viagens difere entre usuários casuais e membros anuais?
3. Quais dias da semana apresentam maior uso para cada tipo de usuário?
4. Quais horários do dia são mais utilizados por usuários casuais e por membros anuais?
5. Quais estações de início são mais utilizadas por cada grupo de usuários?

## 2. Dados

### 2.1 Fonte dos Dados

Os dados utilizados neste projeto são públicos e reais, disponibilizados pela Divvy Bikes, empresa responsável pelo sistema de bicicletas compartilhadas da cidade de Chicago (EUA). Os arquivos podem ser acessados por meio do repositório oficial de dados da Divvy, utilizado como base no capstone do Google Data Analytics Professional Certificate.

Os dados não contêm informações pessoais identificáveis, estando em conformidade com as políticas de privacidade e uso de dados públicos.

### 2.2 Período e Escopo

A análise foi realizada com base nos dados referentes ao período de janeiro a dezembro de 2025, totalizando 12 meses completos de registros de viagens. Cada arquivo corresponde a um mês de operação do sistema de bicicletas compartilhadas.

### 2.3 Estrutura dos Dados

Abaixo estão as principais colunas utilizadas neste projeto, bem como seus respectivos tipos e descrições:

| Coluna               | Tipo      | Descrição |
|----------------------|-----------|-----------|
| ride_id              | string    | Identificador único da viagem |
| rideable_type        | string    | Tipo de bicicleta utilizada |
| started_at           | datetime  | Data e hora de início da viagem |
| ended_at             | datetime  | Data e hora de término da viagem |
| start_station_name   | string    | Nome da estação de início |
| start_station_id     | string    | Identificador da estação de início |
| end_station_name     | string    | Nome da estação de término |
| end_station_id       | string    | Identificador da estação de término |
| start_lat            | decimal   | Latitude da estação de início |
| start_lng            | decimal   | Longitude da estação de início |
| end_lat              | decimal   | Latitude da estação de término |
| end_lng              | decimal   | Longitude da estação de término |
| member_casual        | string    | Tipo de usuário (casual ou membro) |
