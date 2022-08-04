## install

curl -Lo ./kind <https://kind.sigs.k8s.io/dl/v0.14.0/kind-linux-amd64>
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind

## Create cluster

kind create cluster --name kappa --config <https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/yamls/cluster/kind-cluster.yaml>
kubectl cluster-info --context kind-kappa

## Create namespaces

kubectl apply -f <https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/yamls/cluster/kind-namespaces.yaml>
