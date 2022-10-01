## Install

- `helm repo add argo https://argoproj.github.io/argo-helm`
- `helm repo update`
- `helm upgrade --install -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/helm-charts/cicd/argo-cd/values-dev.yaml argocd argo/argo-cd --namespace cicd --debug --timeout 10m0s`
- `watch kubectl get pods -n cicd`

# Install Argocd CLI

- `sudo curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64`
- `sudo chmod +x /usr/local/bin/argocd`

### Login

- `kubectl patch svc argocd-server -n cicd -p '{"spec": {"type": "LoadBalancer"}}'`
- `minikube tunnel`
- `kubens cicd`
- `ARGOCD_EXTRIP=$(kubectl -n cicd get services -l app.kubernetes.io/name=argocd-server,app.kubernetes.io/instance=argocd -o jsonpath="{.items[0].status.loadBalancer.ingress[0].ip}") && kubectl -n cicd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d | xargs -t -I {} argocd login $ARGOCD_EXTRIP --username admin --password {} --insecure`

### create cluster role binding for admin user

- `kubectl create clusterrolebinding cluster-admin-binding --clusterrole=cluster-admin --user=system:serviceaccount:cicd:argocd-application-controller -n cicd`

### Register default cluster

- `kubens cicd  && argocd cluster add minikube --in-cluster --insecure`

### repository k8_config

- `argocd repo add https://github.com/vsvale/kappa_k8s_config.git --port-forward`

