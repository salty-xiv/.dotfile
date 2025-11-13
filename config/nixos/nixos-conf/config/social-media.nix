{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    discord # social media
    vesktop # discord alt client
  ];
}
