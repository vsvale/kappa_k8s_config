## Create image
- `docker images`
- see version of airflow image https://hub.docker.com/r/apache/airflow/tags
- `docker pull apache/airflow:latest-python3.7`
- `docker build ./repository/code/orchestrator/airflow/ -t vsvale-airflow:2.4.2`
- `docker tag vsvale-airflow:2.4.2 vsvale/vsvale-airflow:2.4.2`
- `docker login`
- `docker push vsvale/vsvale-airflow:2.4.2`
- update version to [values.yaml](../../repository/helm-charts/orchestrator/airflow/values.yaml)

## Install

- without smtp: `helm upgrade --install -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/helm-charts/orchestrator/airflow/values.yaml airflow apache-airflow/airflow --namespace orchestrator --debug --timeout 10m0s`
- with smtp:
    -  add smpt in values and apply locally dont send to git
    - `helm upgrade --install -f ./repository/helm-charts/orchestrator/airflow/values.yaml airflow apache-airflow/airflow --namespace orchestrator --debug --timeout 10m0s`
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
