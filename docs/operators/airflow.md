### Airflow

- `cd kappa/kappa_k8s_config`
- `kubens orchestrator`
- `helm repo add apache-airflow https://airflow.apache.org/`
- `helm repo update`
- `helm install airflow apache-airflow/airflow --namespace orchestrator --version 1.6.0`
- `kubectl apply -f app-manifests/orchestrator/airflow.yaml`
