## Install
- `kubens cicd`
- `helm upgrade --install -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/helm-charts/cicd/argo-cd/values-dev.yaml argocd argo/argo-cd --namespace cicd --debug --timeout 10m0s`
- `watch kubectl get pods -n cicd`

# Install Argocd CLI

- `sudo curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64`
- `sudo chmod +x /usr/local/bin/argocd`

### Login

- `kubens cicd`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/yamls/svc/svc_ingress_argocd.yaml -n cicd`
- [http://127.0.0.1:8081/argocd/login](http://127.0.0.1:8081/argocd/login)
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/cluster-manifests/cluster/lb.yaml`
- user: admin
- password: `kubectl -n cicd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d  | more`
- `kubectl delete ingress argocd-ingress`

### create cluster role binding for admin user

- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/cluster-manifests/cluster/crb.yaml`

### repository k8_config

- Add https://github.com/vsvale/kappa_k8s_config.git