```bash
# build and tools
# util
sudo aptitude -y install tmux ripgrep fzf fd-find
# langs
sudo aptitude -y install python3 luarocks

# soft link tmux config
ln -sf ~/.dotfile/config/tmux/.tmux.conf ~/
ln -sf ~/.dotfile/config/tmux/tmux-sessionizer ~/.local/bin/

# install and setup neovim
cd ~/software/
sudo rm -rf /opt/nvim/
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
sudo chmod u+x nvim.appimage
sudo mkdir -p /opt/nvim
sudo ln -sf ~/software/nvim.appimage /opt/nvim/nvim

# link neovim config
ln -sf ~/.dotfile/config/nvim ~/.config/
```

```bash
#/usr/bin/env bash
export DATE = $(date +%F_%H-%M-%S)

mkdir -p $HOME/backup/$DATE

# link shell config
mv $HOME/.zshrc $HOME/backup/$DATE/
ln -sf $HOME/.dotfile/config/zsh/.zshrc $HOME/

# link tmux config
mv $HOME/.tmux.conf $HOME/backup/$DATE/
mv $HOME/.local/bin/tmux-sessionizer $HOME/backup/$DATE/
ln -sf $HOME/.dotfile/config/tmux/.tmux.conf $HOME/
sudo chmod u+x $HOME/.local/bin/tmux-sessionizer
ln -sf $HOME/.dotfile/config/tmux/tmux-sessionizer $HOME/.local/bin/

# link neovim config
mv $HOME/.config/nvim $HOME/backup/$DATE/
ln -sf $HOME/.dotfile/config/nvim $HOME/.config
```
