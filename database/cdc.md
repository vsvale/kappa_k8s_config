# CDC
- Change data capture
- Captura de dados alterados em um banco de dados
- Padrão de integração
- Melhoria em relação a ingestão via snapshot e ingestão incremental
- Captura se um registro foi deletado, inserido, alterado no log de transações e propaga para o destino

## Kinds
- Transaction logs: mudanças são capturadas na transction logs, desonerando o banco
- Query based: utiliza uma chave como timestamp para itendificar a ultima mudança realizada
- Trigger: app trigger uma mudança

## Vantagens
- Baixa latência
- Real time insights
- Não há necessidade de pico de carga em um determinado horário, cargas mais homogeneas
- Baixo custo com infraestrutura de rede dado que os pacotes são menores
- Não onera o banco de origem por utilizar o log de transações
- Capacidade de lidar com tecnologias heterogeneas no input e output

## Casos de Uso
- Ideal para migração de dados
- Data warehouse in real time
- Atualização de caches e indices
- Replicas de leituras para microsserviços
- Sincronização de dados com a cloud ou entre clouds

## How enable it
- Mysql: parse transaction logs
- CockroachDB: emite as mudanças em json ou avro que são convertidos de byte para string

## Ferramentas
- GoldenGate
- Debezium

## Referencias
[microsof docs](https://docs.microsoft.com/pt-br/sql/relational-databases/track-changes/about-change-data-capture-sql-server?view=sql-server-ver16)
