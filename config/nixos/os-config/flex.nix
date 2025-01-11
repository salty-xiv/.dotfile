{
  config,
  pkgs,
  lib,
  ...
}:

{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.  
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
}