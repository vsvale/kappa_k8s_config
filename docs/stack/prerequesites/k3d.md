curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

k3d cluster create kappa --volume $HOME/k3d:/var/lib/rancher/k3s/storage@all -s 1 --servers-memory 8Gb -a 3 --agents-memory 20gb --api-port 6443 -p 8081:80@loadbalancer -p 8080:8080@loadbalancer -p 3306:3306@loadbalancer -p "30000-32767:30000-32767@server:0"

cd ./repository/code/cluster/k3d && terraform init && terraform plan && terraform apply -auto-approve && cd ../../../.. && kubectl get ns && kubectl get storageclass