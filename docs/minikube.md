## Minikube

Install Minikube

`sudo apt install curl git`

`curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64`

`chmod +x ./minikube`

`sudo mv ./minikube /usr/local/bin/`

`sudo apt install -y conntrack`

`sudo apt install -yqq daemonize dbus-user-session fontconfig`

`minikube start --nodes 4 --cpus='2' --memory=5120 --disk-size=50g`

`minikube kubectl -- get po -A`

`minikube addons enable ingress`

Reset ambiente `minikube delete --all --purge`