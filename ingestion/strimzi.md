### Strimzi

## Yamls Example

- `mkdir ~/Charts`
- `cd ~/Charts`
- `git clone https://github.com/strimzi/strimzi-kafka-operator.git`
- `cd ~/Charts/strimzi-kafka-operator/examples`

## Install Kafka

- `cd ~/kappa/kappa_k8s_config`
- `kubens ingestion`
- `helm repo add strimzi https://strimzi.io/charts/`
- `helm repo update`
- `helm install kafka strimzi/strimzi-kafka-operator --namespace ingestion`
- `helm ls`
- `watch kubectl get pods`

### Raise Broker

- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/ingestion/yamls/kafka-broker.yaml`
