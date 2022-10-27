- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/cluster-manifests/cluster/deepstorage.yaml`
- `kubectl get secret console-sa-secret -o jsonpath="{.data.token}" -n deepstorage| base64 --decode`
- access console operator (port 9090)
- create tenant. 1 tenant per namespace. Tenant must be a storageclass with volume binding mode "WaitForFirstConsumer"
- Download credentials
- access console (9443)
- create buckets

