{ config, pkgs, ... }:
{
  # Enable wayland for gnome
  services.xserver.enable = true;
  services.desktopManager.gnome.enable = true;
  services.displayManager.gdm.enable = true;
  services.displayManager.gdm.wayland = true;

  # Enable Hyprland (needs wayland)
  # services.xserver.displayManager.gdm.wayland = true;
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    # withUWSM = true;
  };
  services.displayManager.defaultSession = "hyprland";

}
