# KSQLDB

## Namespace

processing

### ESP

- Event Stream Processing
- Evento: dado que acontece a todo momento
- Stream: Flow continuo de dados
- Processing: on the fly

### Processing Engines

- Apache Spark: Struct Streaming, read kafka process return to kafka, trabalha em microbatch com watermarks (janelas)
- Faust
- KSQLDB: SQL in Kafka

### [KSQLDB](https://ksqldb.io)

- Kafka stream API wrapper to make processing using SQL instead of Java
- Confluent criou para rodar sobre o Kafka
- Standalone do Kafka
- SQL em stream
- Event Streaming Database
- Ksqldb lê a nivel de partição, quanto mais partições um topico tiver mais rapido a leitura paralela. Porém, quanto maior o numero de partições maior o rebalance para o Kafka.

### Quando usar

- Transformacao possiveis em SQL para serem disponibilizadas em novos tópicos

### Components

- Stream: Change log, pegar todos os evento
- Table: ultimo estado do evento, ideal for agg

### Componentes

- Topico: são os topicos origem do Kafka
- Stream: abstração semelhante a uma view materializada com as transformações
- Table: Novo tópico criado após transformações

### Comands

- Topicos: `show topics;`
- Streams (view): `show streams;`
- Show schema: `describe <stream-name>`
- create stream avro com schema registry: `CREATE OR REPLACE STREAM ksql_stream_app_agent_avro WITH (KAFKA_TOPIC='src-app-agent-avro',VALUE_FORMAT='AVRO');`
- create stream json: `CREATE OR REPLACE STREAM ksql_stream_app_agent_json ("payload" STRUCT <"id" BIGINT, "uuid" VARCHAR>) WITH (KAFKA_TOPIC='src-postgres-beer-json',PARTITIONS=3,VALUE_FORMAT='JSON');`
- Não é possivel usar schema_registry com json, apenas avro. Assim, é necessário recriar o stream a cada mudança de schema
- Select nested json: `SELECT "flight"->"airline" as airline from topic`
- select * no topico: não funciona, apenas em streams
- select *no stream (baixa performance): select* from ksql_stream_app_agent_avro emit changes;
- Sempre coloque limit para melhorar performance
- Transformação mascaramento:
    `CREATE STREAM enriched_ksqldb_stream_credit_card_avro
    WITH (KAFKA_TOPIC='enriched_ksqldb_stream_credit_card_avro', PARTITIONS=3, REPLICAS=3, VALUE_FORMAT='AVRO'
    AS
    SELECT
    uuid AS "uuid",
    user_is AS "user_id",
    provider AS "provider",
    MASK_KEEP_RIGHT(number,4) AS "number",
    MASK(security_code) AS "security_code"
    CONCAT(first_name,' ', last_name) AS "full_name",
    TIMESTAMPTOSTRING(ROWTIME,'yyyy-MM-dd HH:mm:ss', 'America/Sao_Paulo') AS "processing_time"
    FROM KSQL_STREAM_APP_CREDIT_CARD_AVRO
    WHERE POPULARITY > 60
    PARTITION BY user_id
    EMIT CHANGES;`
  - Cria um stream e um novo topico, com 3 replicas, utilizando schema_registry
  - MASK tranforma o dado no novo topico em *
  - MASK_KEEP_RIGHT mantem os 4 ultimos valores nao mascarados.
  - ROWTIME é now()
  - CONCAT concatena strings
  - Para salvar o dado do topico enriquecido para uma tabela, parquet ou delta pode utilizar Kafka_connect sync ou Apache Spark.
- Setar offset mais antigo: `SET 'auto.offset.reset' = 'earliest';`
- Setar offset mais recente: `SET 'auto.offset.reset' = 'latest';`
- drop stream: `drop stream <stream_name>`;
- select em topic: `print 'topic-name' from BEGINNING`
- stream json payload to fields:`SELECT "payload"->"id" as "ID","payload"->"uuid" as "UUID"  from ksql_stream_app_agent_json emit changes;`
- join no stream:

```
    `CREATE STREAM enriched_ksqldb_stream__bank_credit_card_avro
    WITH (KAFKA_TOPIC='enriched_ksqldb_stream_credit_card_avro', PARTITIONS=9, REPLICAS=3, VALUE_FORMAT='AVRO'
    AS
    SELECT
    card.uuid AS "uuid",
    card.user_id AS "user_id",
    bank.USER_ID,
    bank.ACCOUNT_NUMBER
    FROM KSQL_STREAM_APP_CREDIT_CARD_AVRO as card
    INNER JOIN KSQL_STREAM_APP_BANK_AVRO as bank WITHIN 45 MINUTES
    ON card.user_id = bank.USER_ID
    PARTITION BY user_id
    EMIT CHANGES;`
```

- é possivel fazer com inumeros joins e left, mas não é possivel utilizar chave multipla

-
