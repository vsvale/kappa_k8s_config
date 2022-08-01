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

### Reset ambiente

`minikube delete --all --purge`

### Create a prd context

`code $HOME/.kube/config`

    apiVersion: v1
    clusters:
    - cluster:
        certificate-authority: /home/dataeng/.minikube/ca.crt
        extensions:
        - extension:
            last-update: Mon, 01 Aug 2022 12:25:42 -03
            provider: minikube.sigs.k8s.io
            version: v1.26.0
        name: cluster_info
        server: https://127.0.0.1:63420
    name: minikube
    contexts:
    - context:
        cluster: minikube
        extensions:
        - extension:
            last-update: Mon, 01 Aug 2022 12:25:42 -03
            provider: minikube.sigs.k8s.io
            version: v1.26.0
        name: context_info
        namespace: cicd
        user: minikube
    name: minikube
    - context:
        cluster: prd
        user: admin
    name: prd-admin
    current-context: minikube
    kind: Config
    preferences: {}
    users:
    - name: minikube
    user:
        client-certificate: /home/dataeng/.minikube/profiles/minikube/client.crt
        client-key: /home/dataeng/.minikube/profiles/minikube/client.key
    - name: admin
    user:
        password: prodkube
        username: admin
