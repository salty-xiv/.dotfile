# Windows Programs

## scoop

uses powershell to grab and install via script

```bash
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
```

Need git to update scoop

```bash
scoop install git
```

adds buckets for repo

```bash
scoop bucket add extras
scoop bucket add games
scoop bucket add nonportable
scoop bucket add versions
```

### Developer

neovim recommends installing extras/vcredist2022 and will full install to the system. Can remove after

```bash
scoop install main/neovim
scoop install extras/vcredist2022

scoop install main/tree-sitter

scoop install main/fd
scoop install main/ripgrep
scoop install main/gzip
scoop install main/wget
scoop install main/unzip
scoop install main/jq
scoop install main/fzf
```

Languages

```bash
# Lua
scoop install main/luarocks main/lua-language-server main/stylua
#   install after luarock since it comes with latest to force version
scoop install versions/lua51

# node
scoop install main/nvm

# dotnet
scoop install main/netcoredbg
#   broken in scoop. Revist later. for now manual install. see below
#       scoop install main/dotnet-sdk
#       scoop install versions/dotnet-sdk-lts

# Python
scoop install main/python

# C
scoop install main/zig
```

extra cmds

```bash
# set latest lts nodejs
nvm install lts
nvm use 22
npm install -g neovim prettier @fsouza/prettierd

# LSP for dotnet
dotnet tool install --global csharpier
dotnet tool install --global dotnet-outdated-tool
dotnet tool install --global dotnet-ef

# fixes luarocks?
luarocks config variables.CC gcc

# install ZLocation
Install-Module ZLocation -Scope CurrentUser
```

For roslyn.nvim, a manual download and process is needed due to microsoft tos shenanigans.
See link for reference [roslyn.nvim](https://github.com/seblyng/roslyn.nvim?tab=readme-ov-file#-installation)

1. Zo to [feed link](https://dev.azure.com/azure-public/vside/_artifacts/feed/vs-impl)
2. Search for `Microsoft.CodeAnalysis.LanguageServer` and find your OS/arch
   - for windows its `Microsoft.CodeAnalysis.LanguageServer.win-x64`
3. Download and unzip to Windows: `%LOCALAPPDATA%\nvim-data\roslyn`
   - it will be a bunch of random files
4. Check if it's working by running `dotnet Microsoft.CodeAnalysis.LanguageServer.dll --version` in the `roslyn` directory.

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
scoop install extras/obs-studio
scoop install extras/openoffice extras/calibre
scoop install nonportable/virtualbox-np
scoop install main/innounp versions/innounp-unicode
scoop install extras/telegram
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
- [.NET SDK](https://dotnet.microsoft.com/en-us/download)
- [Affinity](https://affinity.serif.com/en-us/)
- [Stream Deck](https://www.elgato.com/us/en/s/downloads)
