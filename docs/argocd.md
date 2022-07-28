## Argo CD
1 - Deploy Argocd in K8s cluster
- `kubectl create namespace argocd`
- `kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml`
- `watch kubectl get pods -n argocd`
- `kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'`
- `sudo curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64`
- `sudo chmod +x /usr/local/bin/argocd`
- `kubectl port-forward svc/argocd-server -n argocd 8080:443`
- `127.0.0.1:8080`
- admin 
- `argoPass=$(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)`
- `echo $argoPass`
- `argocd login localhost:8080 --username admin --insecure`
- `argocd account update-password`

2 - Configure ArgoCD to track Git repository
- clone repository locally (do git flow)
- `code .`
- create [application.yaml](https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/application.yaml)
- `kubectl apply -f application.yaml`

3- ArgoCD monitors for anychanges and applies automatically

- Workflow: Code change saved in App Source code is tested in CI pipeline >> Build Image >> Push to Docker Repo >> Update K8s manifest File >> Update yaml in Git repo App Configuration >> ArgoCD synced changes in yaml/helm charts and pull it to the cluster

- Git as Single Source of Truth: ArgoCD verify is cluster actual status == Desired State in git repo, if not send alerts. Gives history of changes and easy rollback and disaster recover.

- GitOps Flow:
  - Yaml in separated repository
  - Create Pull/Merge Request on develop and master branch
  - CI pipeline validade configuration files runnning automated tests
  - Teamets review and approve PR
  - Merge to main branch
  - AgorCD pull changes to K8s cluster