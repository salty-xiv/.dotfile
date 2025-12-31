{ config, pkgs, ... }:
{
  programs.streamcontroller.enable = true;

  environment.systemPackages = with pkgs; [
    gimp3 # photoshop
    libreoffice # office program

    synology-drive-client # client to sync with synology nas

    git # git
    gparted # partition tool
    nautilus # file explorer
    parted # partition disk management
    udisks2 # disk mounting tool

    autojump # for speed moving in terminal
    bat # better `cat`
    curl # curl
    fd # fuzzy find
    fzf # fuzzy find
    ripgrep # fuzzy find
    tealdeer # tldr aka cli documentation util
    tree # tool to show folders in cli
    unzip # for zip files
    wget # basic curl like tool
    wl-clipboard # wayland clipboard
  ];

}
