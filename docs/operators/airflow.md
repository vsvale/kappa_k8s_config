### Airflow

- `cd kappa/kappa_k8s_config`
- `kubens orchestrator`
- `helm repo add apache-airflow https://airflow.apache.org/`
- `helm repo update`
- `helm upgrade --install airflow apache-airflow/airflow --namespace orchestrator`
- `kubectl apply -f app-manifests/orchestrator/airflow.yaml`
