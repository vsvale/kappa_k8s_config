# Install Spark

- `kubectl create namespace processing`
- `helm repo add spark-operator https://googlecloudplatform.github.io/spark-on-k8s-operator`
- `helm repo update`
- `helm pull spark-operator/spark-operator -d ./repository/helm-charts/processing/ --untar`
- `helm upgrade --install -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/helm-charts/processing/spark-operator/values.yaml spark spark-operator/spark-operator --namespace processing --debug --timeout 10m0s --create-namespace`
- `helm ls -n processing`
- `watch kubectl get pods -n processing`

- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/processing/spark-operator.yaml`
