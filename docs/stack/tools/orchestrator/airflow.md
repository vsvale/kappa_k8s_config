- `helm repo add apache-airflow https://airflow.apache.org/`
- `helm upgrade --install -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/helm-charts/orchestrator/airflow/values.yaml airflow ./repository/helm-charts/orchestrator/airflow --namespace orchestrator --debug --timeout 10m0s`
- `kubectl apply -f /home/dataeng/Documents/kappa_k8s_config/repository/yamls/svc/svc_lb_airflow_ui.yaml`
## Concepts

### What is Airflow
- Orchestrator for Batch
- Open Source
- DAG in python
- Data pipeline
- Sensors in many operators
- scheduler of tasks
- develop and monitor workflows
- backfilling to reprocess historic data
- integrates with spark, dask

### Operators
- developed code to integrate, sensor