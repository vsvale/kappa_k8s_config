## Install Spark

- `helm repo add spark-operator https://googlecloudplatform.github.io/spark-on-k8s-operator`
- `helm repo update`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/processing/spark-operator.yaml`
- `watch kubectl get pods -n processing`

## Install ksqldb

- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/processing/ksqldb.yaml`
- `watch kubectl get pods -n processing`
- KSQLDB=nomedopod
- `kubectl exec $KSQLDB -n processing -ti -- bash ksql`


## Install Trino

- `helm repo add valeriano-manassero https://valeriano-manassero.github.io/helm-charts`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/processing/trino.yaml`
- `watch kubectl get pods -n processing`
