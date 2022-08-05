## install

- `curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.14.0/kind-linux-amd64`
- `chmod +x ./kind`
- `sudo mv ./kind /usr/local/bin/kind`

## Create cluster

- `kind create cluster --name kappa --config kappa/kappa_k8s_config/yamls/cluster/kind-cluster.yaml`

## Create namespaces

- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/yamls/cluster/kind-namespaces.yaml`

## Metallb

- `kubens gateway`
- `helm repo add metallb <https://metallb.github.io/metallb>`
- `helm install metallb metallb/metallb`
- `kubectl -n gateway get all`
- `kubectl get nodes -o wide`
- `docker network inspect -f '{{.IPAM.Config}}' kind`
- `sipcalc first.ip`
- Add IPs to `kind-metallb-ipaddresspool.yaml`
- `kubectl apply -f kappa/kappa_k8s_config/yamls/cluster/kind-metallb-ipaddresspool.yaml`
- `kubectl apply -f kappa/kappa_k8s_config/yamls/cluster/kind-metallb-l2advertisement.yaml`

## Delete Cluster

- `kind delete cluster --name kappa`
