# Install Spark

- `helm repo add spark-operator https://googlecloudplatform.github.io/spark-on-k8s-operator`
- `helm repo update`
- `helm show values spark-operator/spark-operator > ./repository/helm-charts/processing/spark-operator/values.yaml`
- `helm upgrade --install -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/helm-charts/processing/spark-operator/values.yaml spark spark-operator/spark-operator --namespace processing --debug --timeout 10m0s --create-namespace`
- `helm ls -n processing`
- `watch kubectl get pods -n processing`
