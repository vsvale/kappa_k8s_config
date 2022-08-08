# Strimzi

## Yamls Example

- `https://github.com/strimzi/strimzi-kafka-operator/tree/main/examples`

## Install Kafka

- `cd kappa_k8s_config`
- `kubens ingestion`
- `helm repo add strimzi https://strimzi.io/charts/`
- `helm repo update`
- `helm install kafka strimzi/strimzi-kafka-operator --namespace ingestion`
- `helm ls`
- `watch kubectl get pods`

### Raise Broker

- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/ingestion/yamls/kafka-broker.yaml`

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