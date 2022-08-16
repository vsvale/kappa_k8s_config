# Minikube

## Install Minikube

`sudo apt install curl git`

`curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64`

`chmod +x ./minikube`

`sudo mv ./minikube /usr/local/bin/`

`sudo apt install -y conntrack`

`sudo apt install -yqq daemonize dbus-user-session fontconfig`

### Create Cluster

`minikube -p minikube start --nodes 3  --cpus='4' --memory='16g' --disk-size=100g --container-runtime='docker' --driver='docker'`

`minikube kubectl -- get po -A`

`minikube status -p minikube`

### Create namespaces

- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/cluster/yamls/namespaces.yaml`

### Change default StorageClass

- `kubectl get storageclass`
- `kubectl patch storageclass standard -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"false"}}}'`
- `kubectl replace -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/cluster/yamls/flexible.yaml --force`

-

## Helpfull commands

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

### Get standard StorageClass

- `kubectl get sc`
- `kubectl describe sc standard`
- `kubectl get sc standard -o=yaml > flexible.yaml`

### Delete PVC & PV

- `kubectl get pv -n {namespace}`
- `kubectl delete pv {PV_NAME}`
- `kubectl patch pv {PV_NAME} -p '{"metadata":{"finalizers":null}}'`
- `kubectl get pvc -n storage`
- `kubectl delete pvc {PVC_NAME} -n {namespace}`

### See logs k8s

- `kubectl -n <namespace> get events --sort-by='{.lastTimestamp}'`
