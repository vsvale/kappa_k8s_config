![argo.png](../../../imgs/argo.png)

## What is

- GitOps Operator

## Namespace

- cicd

## How it works

- You install Argo CD as a controller in the Kubernetes cluster. Usually you install Argo CD on the same cluster that it manages. It is also possible for Argo CD to manage external clusters.
- You store your manifests in Git. Argo CD is agnostic on the type of manifests you can use. It supports plain Kubernetes manifests, Helm charts, Kustomize definitions, and other templating mechanisms.
- You create an Argo CD application by defining which Git repository to monitor and to which cluster/namespace this application should be installed.
- From now on, Argo CD monitors the Git repository, and when there is a change, it automatically brings the cluster to the same state.
- Optionally Argo CD can deploy applications to other clusters (and not just the one on which it is installed)

## Install

### Helm Chart

- `helm repo add argo https://argoproj.github.io/argo-helm`
- `helm repo update`
- `helm upgrade --install -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/helm-charts/cicd/argocd/values.yaml argocd argo/argo-cd --namespace cicd --debug --timeout 10m0s --create-namespace`
- `watch kubectl get pods -n cicd`

# Install Argocd CLI

- `sudo curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64`
- `sudo chmod +x /usr/local/bin/argocd`

### Login

- `kubectl patch svc argocd-server -n cicd -p '{"spec": {"type": "LoadBalancer"}}'`
- `minikube tunnel`
- `kubens cicd`
- `ARGOCD_EXTRIP=$(kubectl -n cicd get services -l app.kubernetes.io/name=argocd-server,app.kubernetes.io/instance=argocd -o jsonpath="{.items[0].status.loadBalancer.ingress[0].ip}") && kubectl -n cicd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d | xargs -t -I {} argocd login $ARGOCD_EXTRIP --username admin --password {} --insecure`

## Optional

### create cluster role binding for admin user

- `kubectl create clusterrolebinding cluster-admin-binding --clusterrole=cluster-admin --user=system:serviceaccount:cicd:argocd-application-controller -n cicd`

### Register default cluster

- `CLUSTER=$(kubectx) && argocd cluster add $CLUSTER --in-cluster`

### repository k8_config

- `REPOSITORY="https://github.com/vsvale/kappa_k8s_config.git" && argocd repo add $REPOSITORY --port-forward`

## Commands

### Cluster

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
- `argocd app create hellok8s --repo https://github.com/paulbouwer/hello_kubernetes.git --path deploy/helm/hello-kubernetes --dest-server https://kubernetes.default.svc --dest-namespace default --sync-policy auto --auto-prune --self-heal`
- `argocd app create demo --project default --repo https://github.com/codefresh-contrib/gitops-certification-examples --path ./kustomize-app/overlays/staging --sync-policy auto --dest-namespace default --dest-server https://kubernetes.default.svc`

### Sync

- Auto Sync: Argo cd applies every object in the application. Argo cd will sync when it detects differences betwwen git and live state in K8s cluster
- Selective Sync: sync only out-of-sync resources
- Sync Windows: sync every crontab
- Sync Phases: pre-sync, sync and post-sync. Ensure certain resources are healthy before subsequent resources are synced in the next phase
- `argocd app sync {APP NAME}`

### List app

- `argocd app list`
- `argocd app get {APP NAME}`

### Rollback

- Argo cd keeps a cache of git repository, a history of all deployments
- Rollback application not healthy to previous version
- Auto-sync need to be disable in order for rollback occur
- `argocd app rollback <appname> <historyid>`

### Delete app

- Non-cascade delete, deletes only the app not its resources on K8s cluster `argocd app delete <appname> --cascade=false`
- Cascade delete (default) `argoccd delete <appname> --cascade`

### Argocd dex

- Seviço que permite integração com Active directory, possibilitando single sign on

### Argocd metrics

- Serviço que permite integração com Prometheus

### Argocd backup and disaster recovery

- `argocd admin export > backup.yaml`
- `argocd admin import - < backup.yaml`
- Some information are in kubernetes etcd so backup it

### App Health

- Healthy: Resource is 100% healthy
- Progressing: Resource is not healthy but still has a chance to reach healthy state
- Suspended: Resource is suspended or paused. The typical example is a cron job
- Missing: Resource is not present in the cluster
- Degraded: Resource status indicates failure or resource could not reach healthy state in time
- Unknown: Health assessment failed and actual health status is unknown

### Auto Sync

- Auto-pruning: defines what Argo CD does when you remove/delete files from Git. If it is enabled, Argo CD will also remove the respective resources in the cluster as well. If disabled, Argo CD will never delete anything from the cluster.
- Self-heal: defines what Argo CD does when you make changes directly to the cluster (via kubectl or any other way). Note that doing manual changes in the cluster is not recommended if you want to follow GitOps principles (as all changes should pass from Git). If enabled, then Argo CD will discard the extra changes and bring the cluster back to the state described in Git.
