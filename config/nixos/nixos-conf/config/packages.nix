{ config, pkgs, ... }:
{

  # List packages installed in system profile. To search, run: $ nix search wget
  environment.systemPackages = with pkgs; [
    # base
    vim # basic editor
    wget # basic curl like tool

    catppuccin-cursors.latteSky # cursor pack
    nwg-look # configuration for cursor

    waybar # status bar for hyprland
    swaynotificationcenter # notification daemon
    swayidle # idle daemon for wayland (related to screen locking)
    hyprlock # locker
    rofi # app lanucher like dmenu
    hyprshot # screenshot tool
    wl-clipboard # wayland clipboard
    wpaperd # wallpaper for hyprland
    wttrbar # weather for waybar

    networkmanagerapplet # gui for network

    # tools
    alacritty # terminal
    autojump # for speed moving in terminal
    curl # curl
    fd # fuzzy find
    fzf # fuzzy find
    git # git
    gparted # partition tool
    nautilus # file explorer
    parted # partition disk management
    pavucontrol # audio controller for pipewire
    ripgrep # fuzzy find
    tldr # TODO idr
    tmux # tmux
    udisks2 # disk mounting tool
    unzip # for zip files
    tealdeer # tldr aka cli documentation util
    bat # better `cat`
    tree # tool to show folders in cli

    # programs
    brave # internet browser
    discord # social media
    gimp3 # photoshop
    keepassxc # password manager
    libreoffice # office program
    parsec-bin # remote streaming
    prismlauncher # minecraft launcher
    rclone # google drive sync
    spotify # spotify music
    streamcontroller # for the elgato streamdeck
    synology-drive-client # client to sync with synology nas
    vlc # media player
    ytmdesktop # youtube music desktop
    vesktop # discord alt client

    # code
    gcc14 # c++ for nvim
    lua51Packages.lua # lua for nvim

    # lsp
    lua-language-server # lua lsp

    # linter
    luajitPackages.luacheck # lua lint

    # formatter
    nixfmt-rfc-style # nix format
    stylua # lua format
    prettier # general formater for multi lang

    # game
    fflogs # uploader only
    mangohud # fps/perforance counter
    xivlauncher # FFXIV
  ];

}
