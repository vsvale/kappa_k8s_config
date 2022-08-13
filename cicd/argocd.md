## Argo CD

### Helm Chart

- `helm repo add argo https://argoproj.github.io/argo-helm`
- `helm repo update`
- `helm upgrade --install -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/cicd/yamls/values.yaml argocd argo/argo-cd --namespace cicd --debug --timeout 10m0s`
- `watch kubectl get pods -n cicd`

### Argo UI

- `kubectl patch svc argocd-server -n cicd -p '{"spec": {"type": "LoadBalancer"}}'`
- `sudo chmod +x /usr/local/bin/argocd`

#### Login

- `kubens cicd`
- `minikube tunnel`
- `ARGOCD_EXTRIP=$(kubectl -n cicd get services -l app.kubernetes.io/name=argocd-server,app.kubernetes.io/instance=argocd -o jsonpath="{.items[0].status.loadBalancer.ingress[0].ip}") && kubectl -n cicd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d | xargs -t -I {} argocd login $ARGOCD_EXTRIP --username admin --password {} --insecure`

### create cluster role binding for admin user

- `kubectl create clusterrolebinding cluster-admin-binding --clusterrole=cluster-admin --user=system:serviceaccount:cicd:argocd-application-controller -n cicd`

### Register default cluster
- `CLUSTER=$(kubectx) && argocd cluster add $CLUSTER --in-cluster`

### repository k8_config

- `REPOSITORY="https://github.com/vsvale/kappa_k8s_config.git" && argocd repo add $REPOSITORY --port-forward`

#################################################################################################################

### Argocd dex
- Seviço que permite integração com Active directory, possibilitando single sign on

### Argocd metrics
- Serviço que permite integração com Prometheus



### Argocd backup and disaster recovery
- `argocd admin export > backup.yaml`
- `argocd admin import - < backup.yaml`
- Some information are in kubernetes etcd so backup it

### Cluster commands
- `argocd cluster add <name>`
- `argocd cluster get <name>`
- `argocd cluster list`
- `argocd cluster rm`
To register a Cluster first add it to kubectl config
- `kubectl config get-contexts -o <name>`
- `argocd cluster add <name>`

### Projects
- Logical grouping of apps
- Restrict what Gits repos can deployed from
- Retrict what clusters & namespaces can be deployed to
- Restrict kinds of objects can be deployed
- Define project roles

### Useful docs
[Role Based Access Control](https://argo-cd.readthedocs.io/en/stable/operator-manual/rbac/)
[AWS IAM as SSO](https://www.modulo2.nl/blog/argocd-on-aws-with-multiple-clusters)
[Argocd Notification](https://argocd-notifications.readthedocs.io/en/stable/)