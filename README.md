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



## 3. Limpeza e Tratamento dos Dados

Nesta etapa, foi realizada a validação e limpeza dos dados com o objetivo de garantir consistência e confiabilidade para as análises posteriores.

### 3.1 Verificação de valores nulos
Foi verificado se existiam valores nulos nas principais colunas utilizadas para análise e visualização. As seguintes colunas apresentaram **0 valores nulos**:

- start_station_name  
- end_station_name  
- start_lat  
- start_lng  
- end_lat  
- end_lng  

Dessa forma, não foi necessária nenhuma ação corretiva relacionada a valores ausentes nessas colunas.

### 3.2 Verificação de duração inválida das viagens
Também foram analisadas viagens com duração inválida, considerando os seguintes casos:
- Viagens em que `ended_at` é menor que `started_at`
- Viagens em que `ended_at` é igual a `started_at`

Foram identificados **836 registros** com duração inválida.  
Esses registros foram removidos da base de dados, pois não representam viagens reais e poderiam distorcer os resultados da análise.

Após a limpeza, o conjunto final de dados passou a conter **5.552.158 registros válidos**.

### 3.3 Criação de colunas derivadas

Após a limpeza e validação dos dados, foram criadas colunas adicionais com o objetivo de facilitar as análises exploratórias e comparativas entre usuários casuais e membros anuais.

As colunas derivadas criadas foram:

- ride_length: duração da viagem em minutos, calculada a partir da diferença entre os horários de início e término da viagem.

- day_of_week: dia da semana em formato numérico (1 = Domingo, 7 = Sábado), extraído da data de início da viagem.

- ride_month: mês da viagem (1 a 12), extraído da data de início.

- ride_hour: hora do dia em que a viagem foi iniciada (0 a 23).

Essas colunas permitem analisar padrões de uso ao longo do tempo, identificar diferenças de comportamento entre os tipos de usuários e apoiar a criação de visualizações mais informativas na etapa de análise.

## 4. Análise Exploratória dos Dados

O objetivo desta etapa é identificar padrões de uso e diferenças de comportamento entre usuários casuais e membros anuais, utilizando as colunas derivadas criadas anteriormente.

### 4.1 Distribuição geral de usuários (casual x member)

Nesta análise inicial, foi avaliada a distribuição total de viagens entre usuários casuais e membros anuais, com o objetivo de entender a participação de cada grupo no uso do serviço Cyclistic.

**Consulta SQL utilizada:**

```sql
SELECT
    member_casual,
    COUNT(*) AS total_trips
FROM trips
GROUP BY member_casual;
```

Resultados obtidos:

- Membros (member): 3.553.020 viagens

- Usuários casuais (casual): 1.999.138 viagens

Os resultados indicam que os membros anuais realizam um volume significativamente maior de viagens quando comparados aos usuários casuais, reforçando a importância desse grupo para a receita do negócio.

### 4.2 Uso do serviço por dia da semana

Nesta análise, foi avaliado o padrão de uso do serviço ao longo dos dias da semana, comparando o comportamento de usuários casuais e membros anuais.

**Consulta SQL utilizada:**

```sql
SELECT
    member_casual,
    day_of_week,
    COUNT(*) AS total_trips
FROM trips
GROUP BY member_casual, day_of_week
ORDER BY day_of_week;
```
Resultados obtidos:

| Tipo de usuário | Dia da semana | Total de viagens |
|-----------------|---------------|------------------|
| Member | Domingo (1) | 382.256 |
| Casual | Domingo (1) | 331.721 |
| Member | Segunda (2) | 502.703 |
| Casual | Segunda (2) | 228.216 |
| Member | Terça (3) | 563.000 |
| Casual | Terça (3) | 225.549 |
| Member | Quarta (4) | 550.100 |
| Casual | Quarta (4) | 221.505 |
| Member | Quinta (5) | 575.926 |
| Casual | Quinta (5) | 257.987 |
| Member | Sexta (6) | 528.911 |
| Casual | Sexta (6) | 320.027 |
| Member | Sábado (7) | 450.124 |
| Casual | Sábado (7) | 414.133 |

- Os membros anuais apresentam maior volume de viagens durante os dias úteis, com pico entre terça e quinta-feira.

- Os usuários casuais concentram um volume maior de viagens nos finais de semana, especialmente no sábado (dia 7).

- No domingo (dia 1), o volume de viagens entre membros e casuais é mais equilibrado quando comparado aos dias úteis.

Esses resultados reforçam a diferença de comportamento entre os dois grupos: enquanto os membros utilizam o serviço de forma mais recorrente ao longo da semana, possivelmente para deslocamentos diários, os usuários casuais tendem a utilizar as bicicletas principalmente para lazer nos finais de semana.

### 4.3 Duração média das viagens

Nesta análise, foi comparada a duração média das viagens realizadas por usuários casuais e membros anuais, com o objetivo de identificar diferenças no padrão de uso do serviço.

**Consulta SQL utilizada:**

```sql
SELECT
    member_casual,
    ROUND(AVG(ride_length), 2) AS avg_ride_length_minutes
FROM trips
GROUP BY member_casual;
```

Resultados obtidos:

Tipo de usuário	Duração média (minutos):

-Member	11,85
-Casual	22,11

Os resultados mostram que os usuários casuais realizam viagens significativamente mais longas do que os membros anuais. Esse comportamento indica que os usuários casuais tendem a utilizar o serviço para lazer ou passeios mais longos, enquanto os membros utilizam as bicicletas de forma mais objetiva, possivelmente para deslocamentos diários.
