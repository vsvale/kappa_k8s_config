## Create image
- `docker images`
- see version of airflow image https://hub.docker.com/r/apache/airflow/tags
- `docker pull apache/airflow:latest-python3.7`
- `docker build ./repository/code/orchestrator/airflow/ -t vsvale-airflow:2.4.1`
- `docker tag vsvale-airflow:2.4.1 vsvale/vsvale-airflow:2.4.1`
- `docker login`
- `docker push vsvale/vsvale-airflow:2.4.1`
- update version to [values.yaml](../../repository/helm-charts/orchestrator/airflow/values.yaml)

## Install

- `helm repo add apache-airflow https://airflow.apache.org/`
- without smtp: `helm upgrade --install -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/helm-charts/orchestrator/airflow/values.yaml airflow apache-airflow/airflow --namespace orchestrator --debug --timeout 10m0s`
- with smtp:
    -  add smpt in values and apply locally dont send to git
    - `helm upgrade --install -f ./repository/helm-charts/orchestrator/airflow/values.yaml airflow apache-airflow/airflow --namespace orchestrator --debug --timeout 10m0s`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/yamls/orchestrator/svc_lb_airflow_ui.yaml`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/yamls/orchestrator/crb_airflow.yaml`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/yamls/orchestrator/crb_spark_airflow.yaml`
- Kubernetes Connection "Admin" > "Connections"
    - name:"kubeconnect"
    - service: Kubernetes
    - mark the box "in-cluster"

## CLI
- kubens orchestrator
- kubectl get pods -n orchestrator
- `AIRFLOW=airflow-scheduler-5868bbf75d-ttjdj`
- kubectl exec -ti $AIRFLOW -- /bin/bash
- airflow dags list
- airflow info
- airflow config list
- airflow connections list
