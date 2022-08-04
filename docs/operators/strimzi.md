### Strimzi

## Yamls Example

- `mkdir ~/Charts`
- `cd ~/Charts`
- `git clone https://github.com/strimzi/strimzi-kafka-operator.git`
- `cd ~/Charts/strimzi-kafka-operator/examples`

## Install Kafka

- `cd ~/kappa/kappa_k8s_config`
- `kubectl create namespace ingestion`
- `kubens ingestion`
- `helm repo add strimzi https://strimzi.io/charts/`
- `helm repo update`
- `helm install kafka strimzi/strimzi-kafka-operator --namespace ingestion`
- `helm ls`
- `watch kubectl get pods`

### Raise Broker

- `kubectl apply -f kappa/kappa_k8s_config/app-manifests/ingestion/kafka-broker.yaml`

### Metrics

- `kubectl apply -f kappa/kappa_k8s_config/yamls/ingestion/metrics/connect-metrics-config.yaml`
- `kubectl apply -f kappa/kappa_k8s_config/yamls/ingestion/metrics/cruise-control-metrics-config.yaml`
- `kubectl apply -f yamls/ingestion/metrics/kafka-metrics-config.yaml`
- `kubectl apply -f kappa/kappa_k8s_config/yamls/ingestion/metrics/zookeeper-metrics-config.yaml`
