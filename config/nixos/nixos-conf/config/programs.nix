{ config, pkgs, ... }:
{
  programs.streamcontroller.enable = true;

  environment.systemPackages = with pkgs; [
    gimp3 # photoshop
    libreoffice # office program

    synology-drive-client # client to sync with synology nas
  ];

}
