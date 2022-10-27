## Install Trino

- Last one
- update all credential in values
- `helm repo add valeriano-manassero https://valeriano-manassero.github.io/helm-charts`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/processing/trino.yaml`
- `watch kubectl get pods -n processing`
