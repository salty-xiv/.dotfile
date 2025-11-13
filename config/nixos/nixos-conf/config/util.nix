{ config, pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    autojump # for speed moving in terminal
    bat # better `cat`
    curl # curl
    fd # fuzzy find
    fzf # fuzzy find
    git # git
    gparted # partition tool
    nautilus # file explorer
    parted # partition disk management
    ripgrep # fuzzy find
    tealdeer # tldr aka cli documentation util
    tree # tool to show folders in cli
    udisks2 # disk mounting tool
    unzip # for zip files
    wget # basic curl like tool
    wl-clipboard # wayland clipboard
  ];
}
