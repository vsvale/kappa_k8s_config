## Install Minikube

- `sudo apt install curl git`
- `curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64`
- `chmod +x ./minikube`
- `sudo mv ./minikube /usr/local/bin/`
- `sudo apt install -y conntrack`
- `sudo apt install -yqq daemonize dbus-user-session fontconfig`

### Create Cluster

- `minikube -p minikube start --nodes 3  --cpus='4' --memory='16g' --disk-size=150g --container-runtime='docker' --driver='docker'`

- `minikube kubectl -- get po -A`

- `minikube status -p minikube`

### Namespaces and Change default storage class

- go to [terraform](terraform.md)

### [LoadBalancer](https://minikube.sigs.k8s.io/docs/handbook/accessing/)

- `minikube tunnel`

### Acessar node

- `minikube ssh -n minikube`
- `minikube ssh -n minikube-m02`
- `minikube ssh -n minikube-m03`

### Delete cluster

- `minikube delete --all --purge`
