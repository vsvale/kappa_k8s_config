- `helm repo add miniop https://operator.min.io/`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/deepstorage/miniooperator.yaml`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/yamls/deepstorage/svc_lb_minio_ui.yaml`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/yamls/deepstorage/jwt_minio.yaml`
- `kubectl get secret console-sa-secret -o jsonpath="{.data.token}"| base64 --decode`
- create tenante default disable TLS
- 4la4YC6ULnXpKMJm WuuISmF50uodFQY9yjcTbFf0BMCJW2Kp



- 1 tenant per namespace
- Tenant must be a storageclass with volume binding mode "WaitForFirstConsumer"
