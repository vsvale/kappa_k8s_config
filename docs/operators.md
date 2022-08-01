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
strimzi
minio
argo
yugabytedb
astronomer
prometheus-community
lensesio
banzaicloud-stable
bitnami
