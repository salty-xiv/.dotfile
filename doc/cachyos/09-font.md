# serious-shann

https://github.com/kaBeech/serious-shanns

does not have an arch or aur package so need to install by hand.

```
# this installs fonts but just for 1 users. easier then systemwide
mkdir -p ~/.local/share/fonts
#  can download or copy files into folder
cp ~/.dotfile/assets/font/SeriousShanns-6.0.1/SeriousShanns/nerdfont/* ~/.local/share/fonts

# to refresh font cache
fc-cache -vf

# to view fonts for names (if needed). grep to local to avoid all system fonts. can drop if all fonts wanted
fc-list | grep local
```

# jetbrain

nice default when serious-shann is not working

```bash
sudo pacman -S ttf-jetbrains-mono-nerd
```
