## Argo CD

### Helm Chart

- `helm repo add argo https://argoproj.github.io/argo-helm`
- `helm repo update`
- `helm install argocd argo/argo-cd --namespace cicd`
- `kubens cicd`
- `kubectl get pods`

### Argo UI

- `kubectl port-forward service/argocd-server -n cicd 8081:443`
- `kubectl patch svc argocd-server -n cicd -p '{"spec": {"ports": [{"port": 443,"targetPort": "server","name": "https"},{"port": 80,"targetPort": "server","name": "http"}],"type": "LoadBalancer"}}'`

#### Login

- `argocd login 127.0.0.1:8081 --username admin --password gbW2EEqI-43ntP1x --insecure`
- `ARGOCD_EXTRIP=$(kubectl -n cicd get services -l app.kubernetes.io/name=argocd-server,app.kubernetes.io/instance=argocd -o jsonpath="{.items[0].status.loadBalancer.ingress[0].ip}") && kubectl -n cicd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d | xargs -t -I {} argocd login $ARGOCD_EXTRIP --username admin --password {} --insecure`

### create cluster role binding for admin user

- `kubectl create clusterrolebinding cluster-admin-binding --clusterrole=cluster-admin --user=system:serviceaccount:cicd:argocd-application-controller -n cicd`

### Register cluster como default

- `CLUSTER=$(kubectx) && argocd cluster add $CLUSTER --in-cluster`

### repository k8_config

- `kubens cicd`
- `REPOSITORY="https://github.com/vsvale/kappa_k8s_config.git" && argocd repo add $REPOSITORY --port-forward`
