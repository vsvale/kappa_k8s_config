### Strimzi

- `cd kappa/kappa_k8s_config`
- `kubens ingestion`
- `helm repo add strimzi https://strimzi.io/charts/`
- `helm repo update`
- `helm install kafka strimzi/strimzi-kafka-operator --namespace ingestion`

### Metrics

- `kubectl apply -f kappa/kappa_k8s_config/yamls/ingestion/metrics/connect-metrics-config.yaml`
- `kubectl apply -f kappa/kappa_k8s_config/yamls/ingestion/metrics/cruise-control-metrics-config.yaml`
- `kubectl apply -f yamls/ingestion/metrics/kafka-metrics-config.yaml`
- `kubectl apply -f kappa/kappa_k8s_config/yamls/ingestion/metrics/zookeeper-metrics-config.yaml`

### Apply Manifest to Argo

- `kubectl apply -f app-manifests/ingestion/kafka-broker.yaml`
