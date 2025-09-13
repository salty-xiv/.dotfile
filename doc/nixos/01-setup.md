# Inital Set up

## ISO Prep

- Download nixos iso
  - [NixOS ISO](https://nixos.org/download/#nixos-iso)
  - Use a graphical installer with any desktop environment. Will make the git step easier

## Configuration setup

Add nixos-hardware so that the hardware is configured correctly

```bash
sudo nix-channel --add https://github.com/NixOS/nixos-hardware/archive/master.tar.gz nixos-hardware
sudo nix-channel --update
```

Edit config so we have basic access to sync config

```bash
sudo nano /etc/nixos/configuration.nix
```

Add the follow to the config

```nix
imports = [
```

```nix
  <nixos-hardware/lenovo/thinkpad/t480>
```

```nix
  ./hardware-configuration.nix
];
```

```nix
  # Enable the XFCE Desktop Environment.
  services.xserver.windowManager.i3.enable = true;
  services.displayManager.defaultSession = "none+i3";

  # Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.comic-shanns-mono
    jetbrains-mono
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
```

```nix
    # base
    vim
    wget

    # windowmanager
    xorg.xinit
    i3
    i3status
    dmenu

    # tools
    unzip
    curl
    tldr
    autojump
    zsh
    git
    tmux
    ripgrep
    fzf
    fd
    alacritty
    neovim
    xorg.xrandr

    # programs
    brave
    ranger

    # code
    love
    gcc14
    rustup
    lua51Packages.lua

    # lsp
    lua-language-server

    # linter
    luajitPackages.luacheck

    # formatter
    stylua
    # luaformatter
    nixfmt-rfc-style
```

```nix
  ];

  # Shell
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # Neovim
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
```

```bash
# then rebuild nix
sudo nixos-rebuild switch
```

Login git and setup

```bash
# Copy key to github.com, under settings, ssh key
ssh-keygen -t rsa -b 3072 -f ~/.ssh/id_rsa -N ''
cat ~/.ssh/id_rsa.pub
```

Clone repo

```bash
cd ~/
git clone git@github.com:salty-xiv/.dotfile.git
```

## Deprecated

<!-- ## virtualBox Setup -->

<!-- 1. Install Virtualbox program -->
<!-- 2. Setup username and password in password manager -->
<!--    - Set up autotype to password only on autotype tab -->
<!-- 3. Create new virtual machine -->
<!--    1. Step: Virtual Machine Name and OS -->
<!--       - `devbox-nixos` -->
<!--       - Change Location of Host Storage if needed -->
<!--    2. Step: Hardware -->
<!--       - 16 gb ram -->
<!--       - 4 cpu -->
<!--    3. Step: Virtual Hard Disk -->
<!--       - 32 gb. NOT DEFAULT -->
<!--    4. When install to virtualbox, need to set some settings. Should be default but linking in case this changes -->
<!--       - [NixOS for VB](https://nixos.org/manual/nixos/stable/#sec-installing-virtualbox-guest) -->
<!--    5. Before starting, set video memory to 128M -->
<!-- 4. Start Box and use gui to insall -->
<!--    1. Location: Default aka New York TZ, English -->
<!--    2. Keyboard: Default aka Querty -->
<!--    3. Users: -->
<!--       - Username and Password here -->
<!--       - Log in auto -->
<!--       - use same password for admin -->
<!--    4. Desktop: Xfce -->
<!--    5. Unfree Software: Default -->
<!--    6. Partitions: Erase disk -->
<!--    7. Activate clipboard sharing -->
<!--    8. Shutdown. Not Restart. -->
<!-- 5. Unload ISO -->
