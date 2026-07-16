# mudfish

mudfish does not have a pacman or aur package for arch. luckly it is a very straight forward. At linux package, there
are three executable binary files and the installation path would be always /opt/mudfish/$(VERSION)/bin/. Please note
that $(VERSION) is vary depending on what version you're installed.

The installation includes three main components:

- Mudfish Core (mudfish)
- Mudfish Flow Controller (mudflow)
- Mudfish Launcher (mudrun)

url: https://mudfish.net/download
doc url : https://docs.mudfish.net/en/docs/mudfish-cloud-vpn/desktop-install/

## running it

```bash
# -E is needed since sudo and wayland
sudo -E /opt/mudfish/4.3.16/bin/mudrun
```

```text
# url to portal
http://127.0.0.1:8282/
```

## dep package

```bash
paru libayatana-appindicator
```

## cli install

can skip wget by just grabbing the sh file from the website directly. This is _prefered_ since it also lets you get the
latest version.

```bash
# assuming 6.2.1 is latest
wget https://mudfish.net/releases/mudfish-6.2.1-linux-x86_64.sh

sudo sh mudfish-6.2.1-linux-x86_64.sh

# Verifying archive integrity... All good.
# Uncompressing Mudfish v6.2.1......

# Installation is done under /opt/mudfish/6.2.1.
ls -l /opt/mudfish/
```

## uninstalling

```bash
sudo rm -rf /opt/mudfish/
sudo rm -f /usr/share/applications/mudrun.desktop
sudo rm -f /usr/share/polkit-1/actions/net.mudfish.mudrun.policy
```
