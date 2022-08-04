## Argo CD

### Namespaces

- `kubectl create namespace orchestrator`
- `kubectl create namespace database`
- `kubectl create namespace ingestion`
- `kubectl create namespace processing`
- `kubectl create namespace datastore`
- `kubectl create namespace deepstorage`
- `kubectl create namespace tracing`
- `kubectl create namespace logging`
- `kubectl create namespace monitoring`
- `kubectl create namespace viz`
- `kubectl create namespace cicd`
- `kubectl create namespace security`
- `kubectl create namespace app`
- `kubectl create namespace cost`
- `kubectl create namespace misc`
- `kubectl create namespace dataops`
- `kubectl create namespace gateway`

### Helm Chart

- `helm repo add argo https://argoproj.github.io/argo-helm`
- `helm repo update`
- `helm install argocd argo/argo-cd --namespace cicd`
- `kubens cicd`
- `kubectl get pods`

### Argo UI

- `kubectl patch svc argocd-server -n cicd -p '{"spec": {"ports": [{"port": 443,"targetPort": "server","name": "https"},{"port": 80,"targetPort": "server","name": "http"}],"type": "LoadBalancer"}}'`
- `minikube tunnel`
- `kubens cicd`

#### Login

- `ARGOCD_EXTRIP=$(kubectl -n cicd get services -l app.kubernetes.io/name=argocd-server,app.kubernetes.io/instance=argocd -o jsonpath="{.items[0].status.loadBalancer.ingress[0].ip}") && kubectl -n cicd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d | xargs -t -I {} argocd login $ARGOCD_EXTRIP --username admin --password {} --insecure`

### create cluster role binding for admin user

- `kubectl create clusterrolebinding cluster-admin-binding --clusterrole=cluster-admin --user=system:serviceaccount:cicd:argocd-application-controller -n cicd`

### Register cluster como default

- `CLUSTER=$(kubectx) && argocd cluster add $CLUSTER --in-cluster`

### repository k8_config

- `kubens cicd`
- `REPOSITORY="https://github.com/vsvale/kappa_k8s_config.git" && argocd repo add $REPOSITORY --port-forward`
