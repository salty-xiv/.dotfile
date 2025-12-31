{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    keepassxc # password manager
    rclone # google drive sync
  ];
}
