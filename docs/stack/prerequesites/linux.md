## No password on sudo
- No terminal `sudo visudo`
- Altere a linha `%sudo   ALL=(ALL:ALL) NOPASSWD: ALL`

## Update distro
- Update Ubuntu: `sudo -- sh -c 'apt-get update; apt-get upgrade -y; apt-get dist-upgrade -y; apt-get autoremove -y; apt-get autoclean -y'`

## Install docker
- `sudo apt update`
- `sudo apt install -y ca-certificates curl gnupg lsb-release`
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

## Install Minikube
- `sudo apt install curl git`
- `curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64`
- `chmod +x ./minikube`
- `sudo mv ./minikube /usr/local/bin/`
- `sudo apt install -y conntrack`
- `sudo apt install -yqq daemonize dbus-user-session fontconfig`

## Create Cluster

- `minikube -p minikube start --nodes 3  --cpus='max' --memory='72g' --disk-size=400g --driver='docker' --auto-update-drivers --kvm-gpu --mount`
- `minikube kubectl -- get po -A`
- `minikube status -p minikube`

## Install Terraform
- `sudo apt-get update && sudo apt-get install -y gnupg software-properties-common`
- `wget -O- https://apt.releases.hashicorp.com/gpg | \
    gpg --dearmor | \
    sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
`
- `gpg --no-default-keyring \
    --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    --fingerprint
`
- `echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
    https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
    sudo tee /etc/apt/sources.list.d/hashicorp.list
`
- `sudo apt update && sudo apt install terraform`
- `terraform version`

## Create namespaces
- `cd ./repository/code/cluster/minikube && terraform init && terraform plan && terraform apply -auto-approve && cd ../../../.. && kubectl get ns && kubectl get storageclass`