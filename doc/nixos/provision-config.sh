#/usr/bin/env bash
export DATE=$(date +%F_%H-%M-%S)

mkdir -p $HOME/backup/$DATE

sudo mv /etc/nixos/configuration.nix $HOME/backup/$DATE/
sudo mv $HOME/.dotfile/config/nixos/hardware-configuration.nix $HOME/backup/$DATE/

sudo ln -sf $HOME/.dotfile/config/nixos/configuration.nix /etc/nixos/
sudo ln -sf /etc/nixos/hardware-configuration.nix $HOME/.dotfile/config/nixos/
