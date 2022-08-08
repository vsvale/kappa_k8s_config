## WSL
In Admin PowerSehll 7
- `dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart`
- `dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart`
- [Update Kernel Linux](https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi)
- `wsl.exe --set-default-version 2`

## Install [Ubuntu](https://apps.microsoft.com/store/detail/ubuntu-2204-lts/9PN20MSR04DW?hl=pt-br&gl=BR)

## Ubuntu choose folder instalation (optional)

No Powershell

- `cd B:`
- `mkdir wsl`
- `cd wsl`
- `Invoke-WebRequest -Uri https://aka.ms/wslubuntu2204 -OutFile Ubuntu.appx -UseBasicParsing`
- `mkdir installer`
- `move .\Ubuntu.appx .\installer\Ubuntu.zip`
- `cd installer`
- `Expand-Archive .\Ubuntu.zip`
- `rm .\Ubuntu.zip`
- `cd .\Ubuntu\`
- `move .\Ubuntu_2204.0.10.0_x64.appx ..\Ubuntu.zip`
- `cd ..`
- `rm -r Ubuntu`
- `Expand-Archive .\Ubuntu.zip`
- `rm .\Ubuntu.zip`
- `cd Ubuntu`
- `.\ubuntu2204.exe`
- `wslconfig /setdefault Ubuntu-22.04`

## Config & Update Ubuntu

- On [visual studio Code](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack) install [Remote Development](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack)
- Acesse o WSL
`sudo visudo`
`%sudo   ALL=(ALL:ALL) NOPASSWD: ALL`
- `sudo -- sh -c 'apt-get update; apt-get upgrade -y; apt-get dist-upgrade -y; apt-get autoremove -y; apt-get autoclean -y'`

## Install Docker desktop

In [docker desktop](https://docs.docker.com/desktop/windows/wsl/) enable wsl2 and attach Ubuntu

## GitFlow

- `sudo apt install git-flow`
- `sudo nano ~/.bashrc` add at end:
    `parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
    }
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\[\033[33m\]$(parse_git_branch)\[\033[00m\]\$ '`
- `git checkout -b develop`
- `git flow init`

## Helm

- `curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null`
- `sudo apt-get install apt-transport-https --yes`
- `echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list`
- `sudo apt-get update`
- `sudo apt-get install helm`

### To get values

helm show values apache-airflow/airflow > kappa/kappa_k8s_config/app-manifests/orchestrator/values.yaml

## Kubectx  e Kubens

- `sudo apt-get update`
- `sudo git clone https://github.com/ahmetb/kubectx /usr/local/kubectx`
- `sudo ln -s /usr/local/kubectx/kubectx /usr/local/bin/kubectx`
- `sudo ln -s /usr/local/kubectx/kubens /usr/local/bin/kubens`

## Terraform
- `wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg`
- `echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list`
- `sudo apt update && sudo apt install terraform`
- `terraform version`