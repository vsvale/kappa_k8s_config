## Install

In Admin PowerSehll 7

- `dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart`
- `dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart`
- [Update Kernel Linux](https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi)
- `wsl.exe --set-default-version 2`

## Install [Ubuntu](https://apps.microsoft.com/store/detail/ubuntu-2204-lts/9PN20MSR04DW?hl=pt-br&gl=BR)

### Ubuntu choose folder instalation (optional)

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
- Se não desejar colocar senha a cada sudo:
  - No terminal `sudo visudo`
  - Altere a linha `%sudo   ALL=(ALL:ALL) NOPASSWD: ALL`
- Update Ubuntu: `sudo -- sh -c 'apt-get update; apt-get upgrade -y; apt-get dist-upgrade -y; apt-get autoremove -y; apt-get autoclean -y'`
