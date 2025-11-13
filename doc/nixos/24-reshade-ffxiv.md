# reshade for ffxiv

reshade is not natively supported on linux so tricks needed. info is mostly from xivlauncher/dalamud discord in #xlcore-reshade-dlss

Download helper script from: `https://github.com/kevinlekiller/reshade-steam-proton`
modify the script first line ` #!/bin/bash` to  `#!/usr/bin/env bash`
run the script using: `nix-shell -p bash curl unzip file --command "RESHADE_ADDON_SUPPORT=1 bash reshade-linux.sh"`

You will need to copy/move the `d3dcompiler_47.dll` file from `<gamepath>/game/` to inside of your wine prefix's system32 folder `~/.xlcore/wineprefix/drive_c/windows/system32`

This is vanilla reshade so need to download presets from gposingway: `https://github.com/gposingway/gposingway`
