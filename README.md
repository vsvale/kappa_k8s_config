# kappa_k8s_config

## WSL

Default WSL2 `wsl.exe --set-default-version 2` in Admin PowerShell

Sudo password-less 

`sudo visudo` 

`%sudo   ALL=(ALL:ALL) NOPASSWD: ALL`

Update Ubuntu `sudo apt update && sudo apt upgrade -y`

In docker desktop enable wsl2 and attach Ubuntu

## Brew
`sudo apt-get install build-essential curl file git`
`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`
`test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)`
`test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)`
`test -r ~/.bash_profile && echo "eval ($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile`
`echo "eval $($(brew --prefix)/bin/brew shellenv)" >>~/.profile`
`brew install hello`

## Minikube

Install Minikube

`sudo apt install curl git`

`curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64`

`chmod +x ./minikube`

`sudo mv ./minikube /usr/local/bin/`

`sudo apt install -y conntrack`

`sudo apt install -yqq daemonize dbus-user-session fontconfig`

`minikube start --memory=4096 --driver=docker`

Iniciar o minikube `minikube start --memory=4096`

if needed reset minikube to fabric values
minikube delete

## [Kubectl](https://kubernetes.io/docs/tasks/tools/)

Retornar os nodes e master
`kubectl get nodes`
`kubectl get nodes -o=wide`

Retornar os namespaces
`kubectl get all --all-namespaces`
`kubectl get ns`

List all resource not in a namespace
`kubectl api-resources --namespaced=false`

Change default namespace
`sudo vi /etc/apt/sources.list`
`#for kubectlx
deb [trusted=yes] http://ftp.de.debian.org/debian buster main`
`sudo apt-get update`
`sudo apt install kubectx`
`kubens`
`kubens other-namespace`
OR `kubectl config set-context --current --namespace=argocd`

Criar pods
`kubectl run nginx-pod --image=nginx:latest`

Acompanhar criação de pods no ns default
`kubectl get pods`

Todos os pods em todos os ns
`kubectl get pods --all-namespaces`

Describe pod
`kubectl describe pod nginx-pod`

Editar pod
`kubectl edit pod nginx-pod`

Criar pod apartir de yaml
`kubectl apply -f kubernetes/primeiro_pod.yaml`

Deletar pod
`kubectl delete pod nginx-pod`

Deletar pod yaml
`kubectl delete -f kubernetes/primeiro_pod.yaml`

Pegar o ip do pod
`kubectl describe pod portal-noticias | grep IP:`

Acesssar o bash no pod
`kubectl exec -it portal-noticias -- bash`

Criar service
`kubectl apply -f kubernetes/svc-pod-2.yaml`
ClusterIP permite os pods manterem o mesmo IP
Nodeport permite receber requisição de maquinas externas 

Consultar service
`kubectl get service`

Enviar requisicao entre pods
`kubectl exec -it pod-1 -- bash`
`curl ipdoservico:80`

## Git flow
`sudo apt install git-flow`
`git checkout -b develop`
`git flow init`

## Argo CD
1 - Deploy Argocd in K8s cluster
- `kubectl create namespace argocd`
- `kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/core-install.yaml`
- `kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'`
- `kubectl port-forward svc/argocd-server -n argocd 8080:443`
- `127.0.0.1:8080` admin `kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo`
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


## Helm
Intall helm
`sudo apt-get install helm`

Add repository
`helm repo add bitnami https://charts.bitnami.com/bitnami`

 After you have added the repository, update your local repositories.
 `helm repo update`

## Strimzi

## Kafka Connector

## Lenses
Gerenciar kafka, realizar query sql

## Popeye

## Kubecost

## Kodecloud

## JBOD

