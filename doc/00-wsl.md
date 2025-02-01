# WSL

Install WSL2

```bash
wsl --install
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```

Install debian inside wsl

```bash
wsl --install -d Debian
# Username and password step here
```

```bash
sudo apt update && sudo apt upgrade
sudo apt-get -y install aptitude
sudo aptitude -y update
```

```bash
wsl --set-default-version 2
# sets Debian as default
wsl -s Debian
```
