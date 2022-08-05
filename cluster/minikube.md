## Minikube

### Install Minikube

`sudo apt install curl git`

`curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64`

`chmod +x ./minikube`

`sudo mv ./minikube /usr/local/bin/`

`sudo apt install -y conntrack`

`sudo apt install -yqq daemonize dbus-user-session fontconfig`

### Create Cluster

`minikube -p minikube start --nodes 3  --cpus='3' --memory='12g' --disk-size=100g --container-runtime='docker' --driver='docker'`

`minikube kubectl -- get po -A`

`minikube status -p minikube`

### Create namespaces

- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/yamls/cluster/kind-namespaces.yaml`

### Addons

[Ingress](https://minikube.sigs.k8s.io/docs/handbook/addons/ingress-dns/)
`minikube addons enable ingress`
`minikube addons enable ingress-dns`
`minikube dashboard --url`

### Reset ambiente

`minikube delete --all --purge`

### [LoadBalancer](https://minikube.sigs.k8s.io/docs/handbook/accessing/)

- `minikube tunnel`

### Acessar node

- `minikube ssh -n minikube`
