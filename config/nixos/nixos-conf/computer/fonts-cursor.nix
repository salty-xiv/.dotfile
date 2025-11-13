{ config, pkgs, ... }:
{
  # Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.comic-shanns-mono
    jetbrains-mono
  ];

  environment.systemPackages = with pkgs; [
    catppuccin-cursors.latteSky # cursor pack
    nwg-look # configuration for cursor
  ];

}
