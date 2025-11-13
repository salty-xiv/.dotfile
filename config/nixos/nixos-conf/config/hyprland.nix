{ config, pkgs, ... }:
{
  # Enable wayland for gnome
  services.xserver.enable = true;
  services.desktopManager.gnome.enable = true;
  services.displayManager = {
    gdm = {
      enable = true;
      wayland = true;
    };
    defaultSession = "hyprland";
  };

  # Enable Hyprland (needs wayland)
  # services.xserver.displayManager.gdm.wayland = true;
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    # withUWSM = true;
  };

  programs.waybar.enable = true; # status bar for hyprland
  programs.hyprlock.enable = true; # locker

  environment.systemPackages = with pkgs; [
    swaynotificationcenter # notification daemon
    rofi # app lanucher like dmenu
    # swayidle # idle daemon for wayland (related to screen locking)
    hypridle # idle daemon for hyprland
    hyprshot # screenshot tool
    wpaperd # wallpaper for hyprland
    wttrbar # weather for waybar
  ];

}
