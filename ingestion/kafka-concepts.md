### What is Kafka
- Plataforma que possibilita o recebimento de enventos em tempo real e a entrega desses eventos em tempo real
- Um datalake em tempo real
- Open Source

### Security
- Consumidor e produtor comunica em plain text binario aberto, o que pode ser um problema de sugurança
- É possivel criptografar entre producer, Kafka e consumer on the fly com SSL e TLS
- É possivel usar autenticação (SSL e SASL) para cosumers e producers, o mais susado é usar SCRAM 512
- É possivel controlar a nivel de topico a leitura e escrita com Acess Control List (ACLs)

### Ingestion
- Trazer os dados das fontes para uma area analitica (staging area) para fazer desacoplamento, não realizar querys ad-hoc no transacional

### Retenção
- Tempo que o evento será armazenado até poder ser consumido

### Integração
- Buscar os dados que foram inseridos em um banco de dados
- Apis mandam os dados para o Kafka e esse descarrega nos bancos




### Nomenclatura topico

output-ksqldb-stream-agent-avro
src-app-credit-card-avro
src-sqlserver-agent-json

### ACID
Apartir do Kafka 0.11

Atomicidade: Quando o produtor esta configurado para ter idepotência, o dado vai chegar ordenado e não duplicado. Broker realiza a deduplicação se por alguma razão ela vier do producer.

Consistência: Quando a transação ocorre ela não sobre alteração. Alcançado pelo particionamento. Toda vez que um id sofre alteração vai ser sempre alterado na mesma partição.

Isolamento: Isolamento pelo timestamp do evento, permitindo ordenação das transações

Durabilidade: Replicação em diferentes brokers garantes a disponibilidade

Retenção e Purge: retenção baseada em tempo. Pode ser aplicado a nivel de topico e a nivel de broker. 7 dias como default, mas da para colocar infinito.

Querys: não tem otimizador de plano de execução, mas é possivel utilizar KSQLDB, Trino, spark para otimizar a query

### Rebalance

