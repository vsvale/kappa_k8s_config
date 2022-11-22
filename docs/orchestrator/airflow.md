## Create image
- `docker images`
- see version of airflow image https://hub.docker.com/r/apache/airflow/tags
- https://raw.githubusercontent.com/vsvale/kappa_code/main/orchestrator/airflow/readme.md
- update version to [values.yaml](../../repository/helm-charts/orchestrator/airflow/values.yaml)

## Install

- without smtp: `helm upgrade --install -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/helm-charts/orchestrator/airflow/values.yaml airflow apache-airflow/airflow --namespace orchestrator --debug --timeout 10m0s`
- with smtp:
    -  add smpt in values and apply locally dont send to git
    - `helm upgrade --install -f ./repository/helm-charts/orchestrator/airflow/values.yaml airflow apache-airflow/airflow --namespace orchestrator --debug --timeout 10m0s`

## Connections
-  "Admin" > "Connections"
- Kubernetes Connection:
    - name:"kubeconnect"
    - service: Kubernetes
    - mark the box "in-cluster"
- MiniO Connection: {"aws_access_key_id": "YOURACCESSKEY", "aws_secret_access_key": "YOURSECRETKEY", "host": "http://minio.deepstorage.svc.Cluster.local:9000"}
- YugabyteDB Connection: {"name": "yugabytedb_ysql", "host": "yb-tservers.database.svc.cluster.local", "schema": "owshq", "login": "yugabyte", "password": "yugabyte", "port": "5433"}

## CLI
- kubens orchestrator
- kubectl get pods -n orchestrator
- `AIRFLOW=airflow-scheduler-5868bbf75d-ttjdj`
- kubectl exec -ti $AIRFLOW -- /bin/bash
- airflow dags list
- airflow info
- airflow config list
- airflow connections list
