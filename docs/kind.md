## install

curl -Lo ./kind <https://kind.sigs.k8s.io/dl/v0.14.0/kind-linux-amd64>
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind

## Create cluster

kind create cluster --name kappa --config kappa/kappa_k8s_config/yamls/cluster/kind-cluster.yaml
kubectl cluster-info --context kind-kappa
