### What is Kafka
- Plataforma que possibilita o recebimento de enventos em tempo real e a entrega desses eventos em tempo real
- Um datalake em tempo real
- Open Source

### Broker
- Servidor principal do kafka, onde ficam as configurações de topico e partições
- É disk based gravando em formato binario

### Topico
- Onde o evento é gravado, semelhante a uma tabela

### Particoes
- Um topico é reparticionado em inumeras partições
- Quanto mais topico, maior velocidade de leitura por poder alocar mais threads

### Replicação
- Alta disponibilidade garantida com replicação a nivel de topico
- Deve ser igual ou inferior a quantidade de brokers, ideal entre 3 e 8 no maximo
- Lider recebe o evento, followers recebem as replicas

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

### Producer
- Producer: produz os eventos. 
    - Acks=0 manda e não aguarda retorno, pode haver perda de dados.
    - Acks=1 manda e aguarda retorno do Lider garantindo que chegou,pode ocorrer duplicidade de dados.
    - Acks=all manda evendo e aguarda retorno de lider e followers
    - Use Callback

### Consumer
- Consumer: le os eventos do Kafka
- Offset: identificador numero da ultima posição lida
- Cria um consumer group, que contém offset e partição lida, todas as threads ficam no mesmo counsumer group
- 

### Kafka Connect

- Producer e Consumer made easy
- Open Source
- Ler e gravar filesystem e banco de dados
- Jars do conector disponiveis no confluent hub para serem instalados no Kafka
- O arquivo de configuração utiliza a classe do conector para fazer a conexão
- Source: le de uma fonte de dados e traz para dentro do Kafka
-Sync: kafka para datastore

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

