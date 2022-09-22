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

## applications

- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/ingestion/kafka-connect.yaml`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/ingestion/schema-registry.yaml`
`helm upgrade --install -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/helm-charts/ingestion/cp-schema-registry/values-development.yaml schema-registry repository/helm-charts/ingestion/cp-schema-registry --namespace ingestion --debug --timeout 10m0s`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/ingestion/cruise-control.yaml`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/ingestion/kafka-connectors.yaml`
- `kubectl get applications -cicd`
- `kubectl get kafkaconnectors`

### Yamls Example

- `https://github.com/strimzi/strimzi-kafka-operator/tree/main/examples`

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
