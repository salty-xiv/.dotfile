# NVIM

```bash
sudo aptitude -y install curl
sudo aptitude -y install fuse3 libfuse2

sudo rm -rf /usr/local/bin/nvim

mkdir -p ~/software/
cd ~/software/

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
chmod u+x nvim-linux-x86_64.appimage
sudo mkdir -p /usr/local/bin/nvim
sudo ln -sf ~/software/nvim.appimage /usr/local/bin/
```



```bash
# build and tools
# curl
sudo aptitude -y install curl
# appimage
sudo aptitude -y install fuse3 libfuse2
# cmake
sudo aptitude -y install build-essential cmake
# alacritty
sudo aptitude -y install cmake g++ pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
# i3
sudo aptitude -y install i3 xorg feh
# util
sudo aptitude -y install tmux ripgrep fzf fd-find
# langs
sudo aptitude -y install python3 luarocks

# setup basic folders
mkdir ~/.local/bin -p
mkdir ~/.config
mkdir ~/software

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