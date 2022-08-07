## Argo CD

### Helm Chart

- `helm repo add argo https://argoproj.github.io/argo-helm`
- `helm repo update`
- `helm install -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/cicd/yamls/values.yaml argocd argo/argo-cd --namespace cicd`
- `kubens cicd`
- `watch kubectl get pods`

### Argo UI

- `kubectl patch svc argocd-server -n cicd -p '{"spec": {"type": "LoadBalancer"}}'`
- `sudo chmod +x /usr/local/bin/argocd`

#### Login

- `ARGOCD_EXTRIP=$(kubectl -n cicd get services -l app.kubernetes.io/name=argocd-server,app.kubernetes.io/instance=argocd -o jsonpath="{.items[0].status.loadBalancer.ingress[0].ip}") && kubectl -n cicd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d | xargs -t -I {} argocd login $ARGOCD_EXTRIP --username admin --password {} --insecure`

### create cluster role binding for admin user

- `kubectl create clusterrolebinding cluster-admin-binding --clusterrole=cluster-admin --user=system:serviceaccount:cicd:argocd-application-controller -n cicd`

### Register cluster como default

- `CLUSTER=$(kubectx) && argocd cluster add $CLUSTER --in-cluster`

### repository k8_config

- `REPOSITORY="https://github.com/vsvale/kappa_k8s_config.git" && argocd repo add $REPOSITORY --port-forward`
