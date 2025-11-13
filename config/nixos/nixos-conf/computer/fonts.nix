{ config, pkgs, ... }:
{
  # Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.comic-shanns-mono
    jetbrains-mono
  ];

}
