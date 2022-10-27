## No password on sudo
- No terminal `sudo visudo`
- Altere a linha `%sudo   ALL=(ALL:ALL) NOPASSWD: ALL`

## Update distro
- Update Ubuntu: `sudo -- sh -c 'apt-get update; apt-get upgrade -y; apt-get dist-upgrade -y; apt-get autoremove -y; apt-get autoclean -y'`

## Install docker
- `sudo apt update`
- `sudo apt install -y ca-certificates curl gnupg lsb-release apt-transport-https software-properties-common`
- `curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg`
- `echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null`
- `sudo apt-get update`
- `sudo apt install docker-ce docker-ce-cli containerd.io -y`
- `sudo chmod 666 /var/run/docker.sock`
- `sudo usermod -aG docker $USER && newgrp docker`

## Show branch
- `sudo nano ~/.bashrc` add at end:
```
    git_data() {

        if [ -d .git ]
        then
                git status 2> /dev/null | grep "working tree clean" &> /dev/null
                if [ $? -ne 0 ]; then STATUS="!"; else STATUS=""; fi
                echo -n " (`git branch 2>/dev/null | grep '^*' | colrm 1 2`$STATUS)"
        fi
}

export PS1="\u@\h \[\033[36m\]\w\[\033[91m\]\$(git_data) \[\033[00m\]$ "
```

## Install helm
- `curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null`
- `sudo apt-get install apt-transport-https --yes`
- `echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list`
- `sudo apt-get update`
- `sudo apt-get install helm`
- `helm repo add argo https://argoproj.github.io/argo-helm && helm repo add kubecost https://kubecost.github.io/cost-analyzer/ && helm repo add stable https://charts.helm.sh/stable && helm repo add bitnami https://charts.bitnami.com/bitnami && helm repo add yugabytedb https://charts.yugabyte.com && helm repo add lensesio https://helm.repo.lenses.io/ && 
helm repo add pinot https://raw.githubusercontent.com/apache/pinot/master/kubernetes/helm && helm repo add miniop https://operator.min.io/ && helm repo add strimzi https://strimzi.io/charts/ && helm repo add elastic https://helm.elastic.co && helm repo add prometheus-community https://prometheus-community.github.io/helm-charts && helm repo add apache-airflow https://airflow.apache.org/ && helm repo add spark-operator https://googlecloudplatform.github.io/spark-on-k8s-operator && helm repo add valeriano-manassero https://valeriano-manassero.github.io/helm-charts`
- `helm repo update`

## Kubectl
- `sudo apt-get update`
- `sudo apt-get install -y ca-certificates curl`
- `sudo apt-get install -y apt-transport-https`
- `sudo curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"`
- `sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl`

## Kubectx e Kubens

- `sudo apt-get update`
- `sudo git clone https://github.com/ahmetb/kubectx /usr/local/kubectx`
- `sudo ln -s /usr/local/kubectx/kubectx /usr/local/bin/kubectx`
- `sudo ln -s /usr/local/kubectx/kubens /usr/local/bin/kubens`

## Auto complete
- `sudo apt-get update`
- `sudo apt-get install -y bash-completion`
- `echo "source <(kubectl completion bash)" >> ~/.bashrc`
- `source ~/.bashrc`

## Install K3d
- `curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash`

## Create Cluster

- `k3d cluster create kappa --volume $HOME/k3d:/var/lib/rancher/k3s/storage@all -s 1 --servers-memory 12Gb -a 3 --agents-memory 50gb --api-port 6443 -p 8081:80@loadbalancer`

## [Install Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
- `terraform version`

## git
- `git clone https://github.com/vsvale/kappa_k8s_config.git`
- `cd kappa_k8s_config`
- `wget https://github.com/git-lfs/git-lfs/releases/download/v3.2.0/git-lfs-linux-amd64-v3.2.0.tar.gz`
- `tar -xf git-lfs-linux-amd64-v3.2.0.tar.gz`
- `rm git-lfs-linux-amd64-v3.2.0.tar.gz`
- `chmod 755 git-lfs-3.2.0/install.sh`
- `sudo git-lfs-3.2.0//install.sh`
- `rm -rf git-lfs-3.2.0`
- `git lfs install`
- `git lfs track "*.jar"`
- `git lfs migrate import --include="*.jar"`
- `git config --global user.email "viniciusdvale@gmail.com"`
- `git config --global user.name "dataeng"`


## Create namespaces
- `cd ./repository/code/cluster/k3d && terraform init && terraform plan && terraform apply -auto-approve && cd ../../../.. && kubectl get ns`