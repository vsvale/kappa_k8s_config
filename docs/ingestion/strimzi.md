## Ingetion App of Apps
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/cluster-manifests/cluster/ingestion.yaml`

# Or Install manual

## Install Strimzi manual
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/ingestion/strimzi.yaml`
- `watch kubectl get pods -n ingestion`

## Config maps

- `kubens ingestion`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_confi- `helm repo add spark-operator https://googlecloudplatform.github.io/spark-on-k8s-operator`
- `helm repo update`g/master/repository/app-manifests/ingestion/metrics.yaml`
- `kubectl get configmaps`

## Broker
- persistent claim: `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/ingestion/kafka-broker-pc.yaml`
- jbod: `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/ingestion/kafka-broker.yaml`
- ephemeral: `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/ingestion/kafka-broker-ephemeral.yaml`

## Kafka Connector

### Create image
- Download jars:
  - [S3 source](https://www.confluent.io/hub/confluentinc/kafka-connect-s3-source)
  - [S3 sync](https://www.confluent.io/hub/confluentinc/kafka-connect-s3)
  - [JDBC](https://www.confluent.io/hub/confluentinc/kafka-connect-jdbc)
  - [CDC Mysql](https://www.confluent.io/hub/debezium/debezium-connector-mysql)
  - [CDC PostgresSQL](https://www.confluent.io/hub/debezium/debezium-connector-postgresql)
  - [CDC Sql Server](https://www.confluent.io/hub/debezium/debezium-connector-sqlserver)
  - [MongoDB])(https://www.confluent.io/hub/mongodb/kafka-connect-mongodb)
  - [YugabyteDB](https://www.confluent.io/hub/yugabyteinc/yb-kafka-connector)
  - [Elasticsearch source](https://www.confluent.io/hub/dariobalinzo/kafka-connect-elasticsearch-source)
  - [Elasticsearch sync](https://www.confluent.io/hub/confluentinc/kafka-connect-elasticsearch)
- `docker images`
- see version of strimzi image https://quay.io/repository/strimzi/kafka?tab=tags
- `docker pull quay.io/strimzi/kafka:latest-kafka-3.2.3`
- `docker build ./repository/code/ingestion/kafka_connect/ -t vsvale-kafka-connect-strimzi:3.2.3`
- `docker tag vsvale-kafka-connect-strimzi:3.2.3 vsvale/vsvale-kafka-connect-strimzi:3.2.3`
- `docker login`
- `docker push vsvale/vsvale-kafka-connect-strimzi:3.2.3`

### Install Connect
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/ingestion/kafka-connect.yaml`

## Schema Registry
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/ingestion/schema-registry.yaml`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/yamls/ingestion/schema_registry/svc_lb_schema_registry.yaml -n ingestion`

## Cruise cotrol
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/ingestion/cruise-control.yaml`

## Connectors
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/ingestion/kafka-connectors.yaml`

## Verify status connector
- `kubectl get applications -n ingestion`
- `kubectl get kafkaconnectors -n ingestion`
- `kubectl get kafkaconnectors -n ingestion <name> -oyaml`
- `kubens ingestion && kubectl get strimzi`

## generators
see docs/stack/tools/app/data_generator.md

## Kafka consumer console
- kubectl get pods -n ingestion
- get schema-registry pod name
- `CSR=schema-registry-cp-schema-registry-5bbd6bc88f-vxc76`
- kubens ingestion && kubectl exec $CSR -c cp-schema-registry-server -ti -- bash
- unset JMX_PORT;
- 
```
kafka-avro-console-consumer \
--bootstrap-server edh-kafka-bootstrap:9092 \
--property schema.registry.url=http://localhost:8081 \
--property print.key=true \
--from-beginning \
--topic src-mysql-commerce-avro
```

### Yamls Example

- `https://github.com/strimzi/strimzi-kafka-operator/tree/main/examples`


