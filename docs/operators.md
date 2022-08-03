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

### MiniO

- `kubectl apply -n deepstorage -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/app-manifests/deepstore/argo-helm-minio.yaml`

spark-operator
confluentinc
kong
infracloudio
valeriano-monassero
stable <https://kubernetes-charts.storage.googleapis.com>
incubator <https://kubernetes-charts.storage.googleapis.com>
jahstreet
apache-airflow ns orchestrator
elastic
minio ns deepstore
argocd ns cicd
yugabytedb ns database
astronomer
prometheus-community ns monitoring
lensesio
banzaicloud-stable
bitnami
apache pinot ns datastore
kafka connect
KSQLDB
apache superset
python-app-data-stores ns app
cost-naluzer-checks ns cost
kubecos ns cost
postgressql ns database
druid ns datastore
monitoring-operator ns monitoring
botkube ns monitoring
alertmanager ns monitoring
mlflow ns ml
kibana ns logging
filebeat ns logging
elasticsearch ns logging
strimzi-cluster-operator ns ingestion
schema-registry ns ingestion
keda ns ingestion !!!!Autoscaling very nice
