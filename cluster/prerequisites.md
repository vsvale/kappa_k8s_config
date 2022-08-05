## WSL

Default WSL2 `wsl.exe --set-default-version 2` in Admin PowerShell

## WSL fora do diretorio padrão

No Powershell

- `cd B:`
- `mkdir wsl`
- `cd wsl`
- `Invoke-WebRequest -Uri shorturl.at/fixFQ -OutFile Ubuntu.appx -UseBasicParsing`
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

## Sudo password-less

`sudo visudo`

`%sudo   ALL=(ALL:ALL) NOPASSWD: ALL`

Update Ubuntu `sudo -- sh -c 'apt-get update; apt-get upgrade -y; apt-get dist-upgrade -y; apt-get autoremove -y; apt-get autoclean -y'`

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
