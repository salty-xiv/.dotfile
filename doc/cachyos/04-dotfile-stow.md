# dotfile stow

```bash
# setup basic folders
mkdir -p $HOME/.local/bin
mkdir -p $HOME/.config
mkdir -p $HOME/project
```

GNU stow is used to push the dotfiles out to their respective locations in the home dir

```bash
# install stow
sudo pacman -S stow
```

run the stow command to push all files

```bash
./$HOME/.dotfile/config/cachyos-stow.sh
```

## misc stow commands

```bash
# will take the current files/folders as the current stow
stow --adopt nvim
```
