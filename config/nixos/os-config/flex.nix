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

  # Swap caplock with esc only for flex
  services.xserver.xkb.options = "caps:swapescape";
  console.useXkbConfig = true;
}
