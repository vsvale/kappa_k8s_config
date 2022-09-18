- `helm repo add apache-airflow https://airflow.apache.org/`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/orchestrator/airflow.yaml`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/orchestrator/airflow.yaml`
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