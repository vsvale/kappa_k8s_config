### Strimzi

- `cd kappa/kappa_k8s_config`
- `kubens ingestion`
- `helm repo add strimzi https://strimzi.io/charts/`
- `helm repo update`
- `helm install kafka strimzi/strimzi-kafka-operator --namespace ingestion --version 0.30.0`
- `kubectl apply -f kappa/kappa_k8s_config/yamls/ingestion/metrics/connect-metrics-config.yaml`
- `kubectl apply -f kappa/kappa_k8s_config/yamls/ingestion/metrics/cruise-control-metrics-config.yaml`
- `kubectl apply -f kappa/kappa_k8s_config/yamls/ingestion/metrics/kafka-metrics-config.yaml`
- `kubectl apply -f kappa/kappa_k8s_config/yamls/ingestion/metrics/zookeeper-metrics-config.yaml`

### Spark

- `kubens processing`

### Starboard

- `kubectl apply -n argocd -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/operators/starboard/argo-helm-starboard.yaml`
- `argocd app sync starboard`

### Prometheus

- `kubectl apply -n argocd -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/operators/prometheus/argo-helm-prom-crds.yaml`
- `kubectl apply -n argocd -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/operators/prometheus/argo-helm-prometheus.yaml`
- `kubectl port-forward service/prometheus-kube-prometheus-prometheus -n monitoring 9090:9090`
- `kubectl port-forward service/prometheus-grafana -n monitoring 5000:80`
- admin prom-operator
- `kubectl apply -n argocd -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/operators/starboard/argo-helm-starexporter.yaml`
- `kubectl port-forward service/starboard-exporter -n starboard-system 3000:8080`
- search starboard_exporter_vulnerabilityreport_image_vulnerability_severity_count

spark-operator
confluentinc
kong
infracloudio
valeriano-monassero
stable <https://kubernetes-charts.storage.googleapis.com>
incubator <https://kubernetes-charts.storage.googleapis.com>
jahstreet
apache-airflow
elastic
minio
argo
yugabytedb
astronomer
prometheus-community
lensesio
banzaicloud-stable
bitnami

apache pinot
kafka connect
KSQLDB
apache superset
