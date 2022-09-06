## Kubectl

- `sudo apt-get update`
- `sudo apt-get install -y ca-certificates curl`
- `sudo apt-get install -y apt-transport-https`
- `sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg <https://packages.cloud.google.com/apt/doc/apt-key.gpg>`
- `echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] <https://apt.kubernetes.io/> kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list`
- `sudo apt-get update`
- `sudo apt-get install -y kubectl kubelet`

## Kubectx  e Kubens

- `sudo apt-get update`
- `sudo git clone https://github.com/ahmetb/kubectx /usr/local/kubectx`
- `sudo ln -s /usr/local/kubectx/kubectx /usr/local/bin/kubectx`
- `sudo ln -s /usr/local/kubectx/kubens /usr/local/bin/kubens`

## Auto complete

- `sudo apt-get update`
- `sudo apt-get install -y bash-completion`
- `echo "source <(kubectl completion bash)" >> ~/.bashrc`
- `source ~/.bashrc`
