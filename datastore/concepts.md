# Datalake
- Repositorio de dados brutos, assim como são na fonte origem
- Não possue schema enforcement
- Democratização dos dados: substituir várias conexões com diversos bancos para uma conexão para consulta de arquivos em batch
- Seviços de Object Storage: S3, HDFS, Blob Storage, Cloud Storage
- Ler o dado Raw e fazer o incremento é um desafio
- Data Swamp: dados desorganizados, sem metadado
- Parquet: formato ideal para data lakes, é compresso, colunar e otimizado para processsamento
- Datalake é suscetível a Small files problem

# [Delta Lake](https://delta.io/)
- Storage Layer with ACID Open Source acima do datalake para gerar dados limpos e sanitizados para permitir processamento spark eficiente
- Escrita de dados concorrentemente com integridade
- Delta: formato otimizado com ACID
- Time Travel: voltar o dado ou o esquema para um snapshot anterior
- Schema Enforciment e Schema Evolution: os tipos dos dados é forçado, mas a inclusão de novos campos não quebra o processo de ETL
- Transaction Log: guarda todas as informações para auditiorias
- Update, delete, merge (upsert) por key
- Compativel com LGPD

## The data Licecicle (traditional)
Fonte de dados: Apache Kafka, Apache Kinesis, Google Pub/Sub, Azure Event Hubs, Json, CSV, Relational Databases
Datalake: Democratizar no data lake com Raw ingestion (bronze)
Processesing with spark: distributed cluster-computing framework optimized for memory computation. Filtered, cleaned & augmented data (silver)
DW & OLAP: Analytics Plataform for Enterprises Scalability,business level aggregates (gold). For AI, reporting and Stream Analytics

## The delta Architecture
Fontes de dados
Delta Bronze: Repository of Raw Data without schema enforcement from multiple sources for long retention time
Delta Silver: data with cleanup, queryable for easy debugging
Delta Gold: Clean data, ready for consumption. Dw style with dimensions and fact
Integrations: 
- Presto: High Performance, variety of sources, distributed SQL query engine for big data
- Athena: serveless query service, pay as you query, read from S3
- Redshift Spectrum: it a DW with capability of run complex sql queries on S3
- Snowflake: Dw as Cloud Service, Analytics Dw as SaaS, capable of query processing and DB storage
- Hive: Opensource DW, sql queries, cached queries

## Presto





