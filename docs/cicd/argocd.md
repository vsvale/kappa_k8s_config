## Install

- `helm repo add argo https://argoproj.github.io/argo-helm`
- `helm repo update`
- `helm upgrade --install -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/helm-charts/cicd/argo-cd/values-dev.yaml argocd argo/argo-cd --namespace cicd --debug --timeout 10m0s`
- `watch kubectl get pods -n cicd`

# Install Argocd CLI

- `sudo curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64`
- `sudo chmod +x /usr/local/bin/argocd`

### Login

- `kubens cicd`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/yamls/cicd/svc_ingress_argocd.yaml -n cicd`
- [http://127.0.0.1:8081/argocd/login](http://127.0.0.1:8081/argocd/login)
- user: admin
- password: kubectl -n cicd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d  | more

### create cluster role binding for admin user

- `kubectl create clusterrolebinding cluster-admin-binding --clusterrole=cluster-admin --user=system:serviceaccount:cicd:argocd-application-controller -n cicd`

### repository k8_config

- `[Add](http://127.0.0.1:8081/argocd/settings/repos) https://github.com/vsvale/kappa_k8s_config.git