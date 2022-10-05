- `helm repo add miniop https://operator.min.io/`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/deepstorage/miniooperator.yaml`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/yamls/deepstorage/svc_lb_minio_ui.yaml`



- `kubectl get secret $(kubectl get serviceaccount console-sa --namespace deepstorage -o jsonpath="{.secrets[0].name}") --namespace deepstorage -o jsonpath="{.data.token}" | base64 --decode`
- `kubectl patch svc console -n deepstorage -p '{"spec": {"type": "LoadBalancer"}}'`
- 1 tenant per namespace
- Tenant must be a storageclass with volume binding mode "WaitForFirstConsumer"
- `helm repo add minio https://charts.min.io/`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/deepstorage/minio.yaml`