# Install Spark

- `kubectl create namespace processing`
- `helm repo add spark-operator https://googlecloudplatform.github.io/spark-on-k8s-operator`
- `helm repo update`
- `helm pull spark-operator/spark-operator -d ./repository/helm-charts/processing/ --untar`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/processing/spark-operator.yaml`
- `watch kubectl get pods -n processing`