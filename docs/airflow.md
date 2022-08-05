### Airflow

- `cd kappa/kappa_k8s_config`
- `helm repo add apache-airflow https://airflow.apache.org/`
- `helm repo update`
- `helm upgrade --install airflow apache-airflow/airflow --namespace orchestrator --debug --timeout 10m0s`
- `kubectl apply -f app-manifests/orchestrator/airflow.yaml`
- `kubens orchestrator`
- `watch kubectl get pods -n orchestrator`

- Tentando `kubectl patch svc airflow-webserver -n orchestrator -p '{"spec": {"type": "LoadBalancer"}}'`
- `kubectl port-forward svc/airflow-webserver 8081:8080 --namespace orchestrator`

-

    Default Webserver (Airflow UI) Login credentials:
        username: admin
        password: admin
    Default Postgres connection credentials:
        username: postgres
        password: postgres
        port: 5432

    You can get Fernet Key value by running the following:

        echo Fernet Key: $(kubectl get secret --namespace orchestrator airflow-fernet-key -o jsonpath="{.data.fernet-key}" | base64 --decode)

    ###########################################################

# WARNING: You should set a static webserver secret key #

    ###########################################################

    You are using a dynamically generated webserver secret key, which can lead to
    unnecessary restarts of your Airflow components.

    Information on how to set a static webserver secret key can be found here:
    <https://airflow.apache.org/docs/helm-chart/stable/production-guide.html#webserver-secret-key>

`helm show values apache-airflow/airflow > kappa/kappa_k8s_config/app-manifests/orchestrator/values.yaml`
