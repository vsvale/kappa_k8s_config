# Strimzi

## Yamls Example

- `https://github.com/strimzi/strimzi-kafka-operator/tree/main/examples`

## Install Kafka

- `cd kappa_k8s_config`
- `kubens ingestion`
- `helm repo add strimzi https://strimzi.io/charts/`
- `helm repo update`
- `helm show values strimzi/strimzi-kafka-operator > kappa_k8s_config/ingestion/kafka/yamls/values.yaml`
- `helm upgrade --install -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/ingestion/kafka/yamls/values.yaml strimzi strimzi/strimzi-kafka-operator --namespace ingestion --debug --timeout 10m0s`
- `helm ls`
- `watch kubectl get pods`

### Raise Broker

- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/ingestion/kafka/yamls/kafka-broker.yaml`

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