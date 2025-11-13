{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    spotify # spotify music
    ytmdesktop # youtube music desktop
    vlc # media player
  ];
}
