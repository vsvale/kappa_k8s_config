# Argo CD

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

------------------------------------------------------------

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
- `argocd proj create kappa -d https://kubernetes.default.svc`
- `argocd proj list`
- `argocd proj get <name>`
- `argocd proj delete`
- `argocd proj add-destination <k8s_cluster>`
- `argocd proj add-source <git-repo>`
- `argocd proj allow-cluster-resources <resources>`
- `argocd proj allow-namespace-resource <namespace>`

### Repositories

- Add using SSH, HTTP, HTTPS
- Public or private
- git or helm
- `argocd repo add https://github.com/likamrat/hello_arc --username username --password pass`
- `argocd repo add https://github.com/vsvale/kappa_k8s_config.git`

### Deploy App

- Git, Helm or Kustomize
- `argocd app create hellok8s --repo https://github.com/paulbouwer/hello_kubernetes.git --path deploy/helm/hello-kubernetes --dest-server https://kubernetes.default.svc --dest-namespace default`

### Sync

- Auto Sync: Argo cd applies every object in the application. Argo cd will sync when it detects differences betwwen git and live state in K8s cluster
- Selective Sync: sync only out-of-sync resources
- Sync Windows: sync every crontab
- Sync Phases: pre-sync, sync and post-sync. Ensure certain resources are healthy before subsequent resources are synced in the next phase
- `argocd app sync {APP NAME}`

### Rollback

- Argo cd keeps a cache of git repository, a history of all deployments
- Rollback application not healthy to previous version
- Auto-sync need to be disable in order for rollback occur
- `argocd app rollback <appname> <historyid>`

### Delete app

- Non-cascade delete, deletes only the app not its resources on K8s cluster `argocd app delete <appname> --cascade=false`
- Cascade delete (default) `argoccd delete <appname> --cascade`

### Useful docs

[Role Based Access Control](https://argo-cd.readthedocs.io/en/stable/operator-manual/rbac/)
[AWS IAM as SSO](https://www.modulo2.nl/blog/argocd-on-aws-with-multiple-clusters)
[Argocd Notification](https://argocd-notifications.readthedocs.io/en/stable/)
[App of Apps](https://github.com/argoproj/argocd-example-apps)

### Education

- [GitOps Fundamentals](https://codefresh.learnworlds.com)
