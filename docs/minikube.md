## Minikube

### Install Minikube

`sudo apt install curl git`

`curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64`

`chmod +x ./minikube`

`sudo mv ./minikube /usr/local/bin/`

`sudo apt install -y conntrack`

`sudo apt install -yqq daemonize dbus-user-session fontconfig`

### Create Cluster

`minikube -p minikube start --cpus='10' --memory='20g' --disk-size=250g`

`minikube kubectl -- get po -A`

`minikube status -p minikube`

### Addons

[Ingress](https://minikube.sigs.k8s.io/docs/handbook/addons/ingress-dns/)
`minikube addons enable ingress`
`minikube addons enable ingress-dns`
`minikube dashboard --url`

### Reset ambiente

`minikube delete --all --purge`

### [LoadBalancer](https://minikube.sigs.k8s.io/docs/handbook/accessing/)

- `minikube tunnel`
- `kubectl patch svc <service-name> -n <namespace> -p '{"spec": {"type": "LoadBalancer"}}'`

### Acessar node

- `minikube ssh -n minikube`

### [Configure-persistent-volume-storage](https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/)

Faça para todos os nodes

- `minikube ssh -n minikube`
- `sudo mkdir /mnt/data`
- `sudo sh -c "echo 'Hello from Kubernetes storage' > /mnt/data/index.html"`

### Changing the default StorageClass to enable PVC

References:[1](https://kubernetes.io/docs/tasks/administer-cluster/change-default-storage-class/)

- `cd kappa/kappa_k8s_config`
- `kubectl apply -n default -f yamls/default/pvc-enabled.yaml`
- `kubectl get storageclass`
- `kubectl patch storageclass standard -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"false"}}}'`
- `kubectl patch storageclass direct-csi-min-io -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'`
- `kubectl get storageclass`
