# NVIM

build from source.

```bash
sudo aptitude -y install ninja-build gettext cmake curl build-essential
mkdir -p ~/software/
cd ~/software/
git clone https://github.com/neovim/neovim
cd neovim
git checkout stable
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
```
