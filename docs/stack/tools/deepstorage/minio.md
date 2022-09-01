- `helm repo add minio https://charts.min.io/`

- `helm repo add miniop https://operator.min.io/`
k apply -f repository/app-manifests/deepstorage/minio-operator.yaml
k apply -f repository/app-manifests/deepstorage/minio.yaml
