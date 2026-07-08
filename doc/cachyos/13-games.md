# cachyos gaming setup

https://wiki.cachyos.org/configuration/gaming/

```bash
sudo pacman -S cachyos-gaming-meta
```

# steam

```bash
steam # games
gamescope # gamemode window
mangohud # performance hud
sudo pacman -S steam gamescope-plus mangohud
```

# ffxiv

```bash
fflogs # fflogs uploader
xivlauncher # ffxiv
paru fflogs-uploader-appimage
paru xivlauncher
```

## reshade

info from xivlauncher discord #xlcore-reshade-dlss pins

```bash
# https://github.com/kevinlekiller/reshade-steam-proton
curl -LO https://github.com/kevinlekiller/reshade-steam-proton/raw/main/reshade-linux.sh
chmod u+x reshade-linux.sh

RESHADE_ADDON_SUPPORT=1 ./reshade-linux.sh
# /home/salty/.xlcore/ffxiv/game
# if it auto dxgi.dll then its correct
```

Special Notes:
Do not follow steps to adjust your WINEDLLOVERRIDES,
You will need to copy/move the `d3dcompiler_47.dll` file from `<gamepath>/game/` to inside of your wine prefix's
system32 folder `~/.xlcore/wineprefix/drive_c/windows/system32 or similar,`

```bash
cp ~/.xlcore/ffxiv/game/d3dcompiler_47.dll ~/.xlcore/wineprefix/drive_c/windows/system32
```

This setsup reshade but also need presets from gposingway
url: https://github.com/gposingway/gposingway

1. download the git repo
2. unzip
3. copy the preset into `~/.xlcore/ffxiv/game`
4. copy the shaders into `~/.xlcore/ffxiv/game` but rename the folder to not conflict with the reshade_shaders that's
   already there.
5. ingame, add the shaders and textures in reshade menu to pick up the gposingway shaders

## ACT

info from act_ffxiv discord #ffxiv-linux-disussion pins

```bash
git clone git@github.com:valarnin/ffxiv-tools.git
cd ffxiv-tools
git checkout xlcore

./setup
```

```bash
# Had game running in background
Checking for dependencies...
...
Found AUR XLCore.
If you haven't run the game at least once, do so now and rerun setup.sh
Continue? [Y/N] y
Detected environment: AUR
...
Runtime Environment: AUR XIVLauncher.Core
FFXIV Game Location: /home/salty/.xlcore/ffxiv
wine Executable Location: /home/salty/.xlcore/compatibilitytool/wine/wine-xiv-staging-fsync-git-10.8.r0.g47f77594-nolsc/bin/wine
wine Distribution Path: /home/salty/.xlcore/compatibilitytool/wine/wine-xiv-staging-fsync-git-10.8.r0.g47f77594-nolsc
Wine Prefix: /home/salty/.xlcore/wineprefix
XIVLauncher Windows Path: /opt/XIVLauncher/XIVLauncher.Core
Continue? [Y/N] y
...
Note that the next step is destructive, meaning that if something goes wrong it can break your wine prefix and/or your wine runner installation.
Please make backups of both!
Wine prefix: /home/salty/.xlcore/wineprefix
wine distribution: /home/salty/.xlcore/compatibilitytool/wine/wine-xiv-staging-fsync-git-10.8.r0.g47f77594-nolsc
Wine version:
Would you like to make a backup of your wine install and FFXIV prefix? [Y/N] y
...
Would you like to continue installation?
Continue? [Y/N] y
Checking for ACT install
Setup hasn't been run on this wine prefix before
This script will need to scan your wine prefix to locate ACT if it's already installed.
Continue? [Y/N] y
Could not find ACT install, downloading and installing latest version
Continue? [Y/N] y
Found ACT location at /home/salty/.xlcore/wineprefix/drive_c/ACT
Saving this path to "/home/salty/.xlcore/wineprefix/.ACT_Location" for future use
Setting up the FFXIV helper scripts.
...
Would you like to create desktop entries for FFXIV and ACT? [Y/N] n
Skipping desktop entry creation.
```

act will need .net 4.8

```bash
# make sure mono is not intalled
wine64 uninstaller

# install 4.8
winetricks dotnet48
```

# minecraft

```bash
prismlauncher # minecraft
sudo pacman -S prismlauncher
```

# ROM

```bash
# steam-rom-manager-bin # rom origanizer/renamer
paru steam-rom-manager-bin
```

# Heroic launcher (epic)

```bash
# heroic-games-launcher-bin # Hero Launcher
sudo pacman -Syu heroic-games-launcher-bin
```
