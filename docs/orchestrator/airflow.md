## Create airflow in Yugabyte
CREATE DATABASE airflow_db;
CREATE USER airflow_user WITH PASSWORD 'airflow';
GRANT ALL PRIVILEGES ON DATABASE airflow_db TO airflow_user;

## change metadataConnection
  metadataConnection:
    user: airflow_user
    pass: airflow
    protocol: postgresql
    host: 172.18.0.2
    port: 5433
    db: airflow_db
    sslmode: disable

## Install

- `helm repo add apache-airflow https://airflow.apache.org/`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/orchestrator/airflow.yaml`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/yamls/svc/svc_lb_airflow_ui.yaml`
- or
- `helm upgrade --install -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/helm-charts/orchestrator/airflow/values.yaml airflow apache-airflow/airflow --namespace orchestrator --debug --timeout 10m0s`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/yamls/svc/svc_lb_airflow_ui.yaml`

## CLI
- kubens orchestrator
- kubectl get pods -n orchestrator
- `AIRFLOW=airflow-scheduler-5868bbf75d-ttjdj`
- kubectl exec -ti $AIRFLOW -- /bin/bash
- airflow dags list
- airflow info
- airflow config list
- airflow connections list

### SMTP
- add smpt in values and apply locally dont send to git