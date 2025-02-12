# Windows Programs
## scoop

uses powershell to grab and install via script

```bash
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
```

adds buckets for repo

```bash
scoop bucket add main extras games nonportable versions
```

### Developer

neovim recommends installing extras/vcredist2022 and will full install to the system. Can remove after

```bash
scoop install neovim extras/vcredist2022
```

Languages

```bash
scoop install main/fd
scoop install main/lua-language-server main/luarocks versions/lua51 main/stylua
scoop install main/nvm
scoop install main/ripgrep
scoop install main/tree-sitter
scoop install main/zig

```

extra cmds

```bash
nvm install lts
nvm use 22
npm install -g neovim
```

Tools

```bash
scoop install main/git main/oh-my-posh
scoop install extras/vscode extras/notepadplusplus extras/alacritty extras/wezterm
scoop install extras/postman
```

### Non Developer

Tools

```bash
scoop install main/7zip main/fastfetch extras/rufus
scoop install extras/brave extras/firefox extras/googlechrome
scoop install extras/gimp extras/paint.net extras/sharex
scoop install extras/vlc extras/ytmdesktop
scoop install extras/discord
scoop install extras/obs-studio extras/streamdeck
scoop install extras/openoffice extras/calibre
scoop install nonportable/virtualbox-np
```

games

```bash
scoop install games/goggalaxy games/steam games/xivlauncher
scoop install games/advanced-combat-tracker
```

Need admin

```bash
scoop install games/battlenet
```

password manager

- [google sync](https://keepass.info/plugins.html#kpgsync)
- [otp2](https://keepass.info/plugins.html#keeotp)

```bash
scoop install extras/keepass extras/keepass-plugin-keepassrpc
```

## Non-scoop Programs

- [Docker for Windows](https://docs.docker.com/desktop/setup/install/windows-install/)
- [FFlogs Companion](https://www.fflogs.com/client/download)
- [Mudfish](https://mudfish.net/)
- [Nvidia app](https://www.nvidia.com/en-us/software/nvidia-app/)
- [Parsec](https://parsec.app/)
- [Rode central](https://rode.com/en-us/apps/rode-central)
- [Spotify](https://open.spotify.com/)
- [Synology Drive client](https://www.synology.com/en-global/support/download/DS920+?version=7.2#utilities)
