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

Update Ubuntu `sudo apt update && sudo apt upgrade -y`

In [docker desktop](https://docs.docker.com/desktop/windows/wsl/) enable wsl2 and attach Ubuntu

## Brew

- `sudo apt-get install build-essential curl file git`
- `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`
- `test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)`
- `test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)`
- `test -r ~/.bash_profile && echo "eval ($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile`
- `echo "eval $($(brew --prefix)/bin/brew shellenv)" >>~/.profile`
- `brew install gcc`

## GitFlow

- `sudo apt install git-flow`
- `sudo nano ~/.bashrc` add at end:
    `parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
    }
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\[\033[33m\]$(parse_git_branch)\[\033[00m\]\$ '`
- `git checkout -b develop`
- `git flow init`
