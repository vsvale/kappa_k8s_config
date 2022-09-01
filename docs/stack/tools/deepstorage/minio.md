- `helm repo add minio https://charts.min.io/`

k apply -f repository/app-manifests/deepstorage/minio-operator.yaml
k apply -f repository/app-manifests/deepstorage/minio.yaml
