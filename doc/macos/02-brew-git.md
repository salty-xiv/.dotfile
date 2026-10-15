# Alacritty

- Macos already has a terminal but I like alacritty more.
- because alacritty doesn't want to pay apple their yearly fee, they are not signed so need to install from their website

```text
https://alacritty.org
```

# Brew

- Need to install brew first. it is needed to install things via cli.
- also called homebew
- https://brew.sh/

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

# Git

```bash
brew install git
```

```bash
# Generate new SSH keys
ssh-keygen -t rsa -b 3072 -f ~/.ssh/id_rsa -N ''
cat ~/.ssh/id_rsa.pub
```

```bash
# If needed, Test Connection
ssh -T git@github.com
```

```bash
# Setup global meta data
git config --global user.name "username"
# To find email as private email is blocked. https://github.com/settings/emails
git config --global user.email "{ID}+{username}@users.noreply.github.com"
```

```bash
git clone git@github.com:salty-xiv/.dotfile.git
```

# Pre stow

- Macos is funky with what's included and what we need to keep consistency with linux

```bash
# https://ohmyz.sh/#install
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

```bash
# fzf # fuzzy finder
# powerlevel10k # part of zsh prompt
# zsh-autosuggestions # zsh things
# zsh-history-substring-search # zsh things
# zsh-syntax-highlighting # zsh things
# coreutils # replaces ls with gls
brew install fzf powerlevel10k zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting coreutils
```

```bash
# font-comic-shanns-mono-nerd-font # font for shanns mono
# aerospace # i3
brew install --cask font-comic-shanns-mono-nerd-font nikitabobko/tap/aerospace
```

# Stow

```bash
brew install stow
```

```bash
mkdir -p $HOME/.local/bin
mkdir -p $HOME/.config
mkdir -p $HOME/project
```

```bash
sudo $HOME/.dotfile/config/macos-stow.sh
```
