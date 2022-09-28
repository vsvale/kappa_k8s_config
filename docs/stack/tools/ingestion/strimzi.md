# Install Strimzi

- `helm repo add strimzi https://strimzi.io/charts/`
- `helm repo update`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/ingestion/strimzi.yaml`
- `watch kubectl get pods -n ingestion`

## Config maps

- `kubens ingestion`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/ingestion/metrics.yaml`
- `kubectl get configmaps`

## Broker

- jbod: `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/ingestion/kafka-broker.yaml`
- ephemeral: `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/ingestion/kafka-broker-ephemeral.yaml`

## Kafka Connector
- 
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/ingestion/kafka-connect.yaml`


- `helm upgrade --install -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/helm-charts/ingestion/cp-schema-registry/values-development.yaml schema-registry repository/helm-charts/ingestion/cp-schema-registry --namespace ingestion --debug --timeout 10m0s`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/ingestion/cruise-control.yaml`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/ingestion/kafka-connectors.yaml`
- `kubectl get applications -n cicd`
- `kubectl get kafkaconnectors -n ingestion`
- `kubectl get kafkaconnectors -n ingestion <name> -oyaml`

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
