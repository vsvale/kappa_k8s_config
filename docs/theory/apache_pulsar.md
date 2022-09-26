![pulsar](img/pulsar_50h.png)

- Originally created at Yahoo
- Publish & Subscribe Pattern using Topics for Event retention
- Cloud-Native
- Distributed Messaging
- Streaming Platform
- Local, docker and K8s

### Producer
- Send Events and publish in topics in a pulsar broker
- Idempotemcy
- Send modes: sync and Async
- Acess mode: shared & exclusive
- compression, batching, chunking

### Consumer
- Subscribe in a topic via subscription
- Receive modes: sync and Async
- Positive Acknowledgment = Individually and cumulatively
- Negative Acknowledgment = Out of Order consume
- timeout, dead letter topic, retry
- subscription: exclusive, shared, failover and key shared
- delayed message delivery

### Topics
- channel for transmitting messages
- persistent and non-persistent topics
- routing modes: round robin, single, custom
- immediately delete consumed messages
- backlog unacknowledged messages
- message deduplication feature - EOS
- namespace: logical nomenclature within a tenant

### IO
- Connect with external systems
- Source and Sink Types of connector
- Mysql, postges, mongodb, rabbitmqm, cassandra, elasticsearch, apache Kafka
- Processing guarantees: at-most, at-least, effectively once

### Functions
- lightweight compute process
- consume, apply logic and publich results
- without neighboring system problem
- operational simplicity: without external processing
- inspired by storm, flink, lambda, cloud and azure functions
- processing guarantees: at-most, at-least, effectively once

### SQL
- Query using Trino
- Store Structure Data in pulsar
- Connector enable multiple workers
- Data stored in Apache BookKeeper

### Features
- Native Support for Multiple Cluster in a Pulsar Instance
- Seamless Geo-Replication of messages - cluster
- Topic compaction period
- Low publish & end-to-end latency
- binding for java, go and Python
- multiple subscription modes: exclusive, shared and failover
- persistent message storage provided by Apache BookKeeper
- Light-Weight computing framework - Pulsar Functions
- Serveless connector framework - Pulsar IO
- Tiered Storage for Hot, Warm, Cold and long-term retention
- Deduplication and Effectively-once semantics - EOS
- Pulsar Schema Registry for type safety - CLient and server side
- Tansactions (TXN): consume, process and produce atomically