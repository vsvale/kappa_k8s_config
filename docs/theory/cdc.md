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

## Query-Based CDC

✅ Usually easier to set up: It's just a JDBC connection to your database, just like running a JDBC query from your application or favorite database dev tool.

✅ Requires fewer permissions: You're only querying the database, so you just need a regular read-only user with access to the tables.

🛑 Requires specific columns in source schema to track changes: If you don't have the option to modify the schema to include a timestamp or incrementing ID field, then life becomes somewhat difficult.

🛑 Impact of polling the database (or higher-latencies trade-off): If you run the same query too often against the database you're going to (quite rightly) have your DBA on the phone asking what's going on. But set the polling too infrequently, and you end up with data that is potentially less useful because of its age.

🛑 Can't track DELETEs: You can only query a relational database for data that's there right now. If the data's been deleted, you can't query it, and so you can't capture those events into Apache Kafka.

🛑 Can't track multiple events between polling interval: If a row changes several times during the period in which the connector polls, you'll only capture the latest state. In some cases, this may not matter (if you just want the latest state of a table). In others, it can matter a lot (if you're building applications that are driven by changes happening in the database).

## Log-Based CDC

✅ Greater data fidelity: Everything is captured—inserts, updates, and even DELETEs. For each of these, we can also get the previous state of the row that changed.

✅ Lower latency and lower impact on the source database: Because we're not polling the database but reading the transaction log, it's lower latency, and we're putting less load on the database too.

🛑 More setup steps and higher system privileges required: The transaction log is a relatively low-level component of the database, so we need greater privileges in the database to access the API for it, and it can be more complicated to set up.
