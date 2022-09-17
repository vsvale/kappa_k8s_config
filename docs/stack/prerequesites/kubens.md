## Kubectl

- `sudo apt-get update`
- `sudo apt-get install -y ca-certificates curl`
- `sudo apt-get install -y apt-transport-https`
- `sudo curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"`
- `sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl`

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
