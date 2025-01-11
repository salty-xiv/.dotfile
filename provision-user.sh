#/usr/bin/env bash
DATE = $(date +%F_%H-%M-%S)

mkdir -p $HOME/backup/$DATE

# set up git metadata
git config --global user.name "salty"
git config --global user.email "5520326+astarrywonder@users.noreply.github.com"

# setup basic folders
mkdir -p $HOME/.local/bin
mkdir -p $HOME/.config

# link shell config
mv $HOME/.zshrc $HOME/backup/$DATE/
ln -sf $HOME/.dotfile/config/zsh/.zshrc $HOME/

# link alacritty config
mv $HOME/.alacritty.toml $HOME/backup/$DATE/
ln -sf $HOME/.dotfile/config/alacritty/.alacritty.toml $HOME/

# link tmux config
mv $HOME/.tmux.conf $HOME/backup/$DATE/
mv $HOME/.local/bin/tmux-sessionizer $HOME/backup/$DATE/
ln -sf $HOME/.dotfile/config/tmux/.tmux.conf $HOME/
ln -sf $HOME/.dotfile/config/tmux/tmux-sessionizer $HOME/.local/bin/

# link neovim config
mv $HOME/.config/nvim $HOME/backup/$DATE/
ln -sf $HOME/.dotfile/config/nvim $HOME/.config/

# i3
mv $HOME/.config/i3 $HOME/backup/$DATE/
mv $HOME/.config/i3status $HOME/backup/$DATE/
ln -sf $HOME/.dotfile/config/i3 $HOME/.config/
ln -sf $HOME/.dotfile/config/i3status $HOME/.config/

