# Install Strimzi

## Yamls Example

- `https://github.com/strimzi/strimzi-kafka-operator/tree/main/examples`

## Install Kafka

- `helm repo add strimzi https://strimzi.io/charts/`
- `helm repo update`
- `helm show values strimzi/strimzi-kafka-operator > ./repository/helm-charts/ingestion/strimzi/values.yaml`
- `helm upgrade --install -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/helm-charts/ingestion/strimzi/values.yaml strimzi strimzi/strimzi-kafka-operator --namespace ingestion --debug --timeout 10m0s --create-namespace`
- `helm ls -n ingestion`
- `watch kubectl get pods -n ingestion`

## Config maps

- `https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/yamls/ingestion/metrics/kafka-metrics-config.yaml`
- `https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/yamls/ingestion/metrics/zookeeper-metrics-config.yaml`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/yamls/ingestion/metrics/connect-metrics-config.yaml`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/yamls/ingestion/metrics/cruise-control-metrics-config.yaml`

## Ingestion

- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/ingestion/kafka-broker.yaml`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/ingestion/schema-registry.yaml`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/ingestion/kafka-connect.yaml`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/ingestion/cruise-control.yaml`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/ingestion/kafka-connectors.yaml`

## AKHQ

### Create a topic

- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/ingestion/yamls/topic.yaml`

### Create User

- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/ingestion/yamls/user.yaml`

### Show users

- `kubectl get kafkausers`

### Show topics

- `kubectl get kafkatopics`

### get password in secrets

kubectl get secrets/vinicius.vale --template={{.data.password}} | base64

### get certificate

kubectl get secret kafka-cluster-clients-ca-cert -o jsonpath='{.data.ca\.crt}' | base64 -d > ~/cert

### Describe topic

kubectl describe kafkatopic src-app-movies-titles-data-json

### logs

kubectl logs <service>

### View topic

kafkacat -C -b <ip>:9092 -t src-app-movies-titles-data-json -J -o end
