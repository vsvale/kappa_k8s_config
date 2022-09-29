## Install

- `helm repo add apache-airflow https://airflow.apache.org/`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/orchestrator/airflow.yaml`
- `helm upgrade --install -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/helm-charts/orchestrator/airflow/values.yaml airflow apache-airflow/airflow --namespace orcherstrator --debug --timeout 10m0s`
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