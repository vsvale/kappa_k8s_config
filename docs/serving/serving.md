## Install Trino

- update all credential in [values](../../repository/helm-charts/serving/trino/values-development.yaml)
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/cluster-manifests/cluster/serving.yaml`
- `watch kubectl get pods -n serving`
