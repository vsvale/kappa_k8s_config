![kappa_architecture.png](img/kappa_architecture.png)

### Requeriments

- Low Latency
- Distributed
- Differrent sources
- Join different data stream
- Allow SQL
- Microservices Integration
- Full open-source
- Kubernetes

### Architecture

- Kappa: arquitetura voltada para eventos, todos os dados são tratados como evento e aplicações podem consumir dados diretamente do event-sourcing.
![kappa_low.png](img/kappa_low.png)
- Nesta arquitetura, todos os dados sejam eles dentro de banco de dados, API ou arquivos são eventos, eventos são contínuos e imutáveis, dessa forma podemos colocar um sistema de enterprise datahub como sistema nervosos central da organização que recebe os eventos de diferentes fontes, processamos esses eventos em tempo real, e esses eventos podem ser consumidos por aplicações, inseridos em Data Warehouses específicos para garantir baixa latência para consultar esses eventos, e por fim o visualizador de dados acessa o DW para criação e atualização de dashboards. Os dados que estão em dentro do enterprise datahub podem ser inseridos dentro de um data lake para atender o times de machine learning por exemplo, o ideal é que todos os dados passem dentro do EDH para que o mesmo possa servir como integrador de eventos, grandes corporações utilizam esse método hoje para entrega em tempo real de analytics.
- Para uma pipeline ser considerar realtime não basta ter o Kafka na camada de ingestion, é necessário que todas tecnologias garantam Exactly-once semantics e tenham baixa latência fim-a-fim.
![kappa_high.png](img/kappa_high.png)
- O processamento é realizado sobre um tópico Kafka e o resultado é armazenado em outro tópico Kafka. Read raw data and write enriched data.
- Serving Layer lê de tópicos enriquecidos e disponibilizam em um formato tabular para a camada de data viz

### Real-time
- Near real-time: sem SLA, processamento em janelas
- Real-time: com SLA, o mais rapido possivel, calcular baseline calculando tempo total fim-a-fim, utilizando contadores nos topicos

### Stream Data pipeline on K8s
![stream_data_pipeline_on_k8s](img/stream_data_pipeline_on_k8s.png)
- Symbiosis of big data and kubernetes Infrastructure
- Backbone System for streaming data pipeline at scale
1. Data source: APIs write events, can ingest data from databases and other data stores
2. All eventes are stored in stream stora system
3. Processing system retrieve the events, enrich and write into a new topic inside the streaming storage system

### Components
- Ingesting Real-time data from microservices into Apache Kafka (Enterprise data hub)
- working with KafkaConnect Cluster on Kubernetes for Source and Sink pipelines
- ETL in Real-time using KSQLDB
- Data Enrichment in near real-time using Apache Spark
- Using a OLAP System for Analytical Queries
- Orchestrating and Managing a Real-Time pipeline with Lenses

### Use-case
- variety of microservices
- Necessity of Domain of Data (Data mesh)
- Scale resources to guarantee the growth of business
- Complexity Enviroment (Event Sourcing)