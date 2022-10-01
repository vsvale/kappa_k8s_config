curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

k3d cluster create kappa --volume $HOME/k3d:/var/lib/rancher/k3s/storage@all -s 1 --servers-memory 8Gb -a 3 --agents-memory 20gb --api-port 6443 -p 8080:80@loadbalancer

cd ./repository/code/cluster/k3d && terraform init && terraform plan && terraform apply -auto-approve && cd ../../../.. && kubectl get ns && kubectl get storageclass