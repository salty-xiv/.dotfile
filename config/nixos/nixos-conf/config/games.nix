{ config, pkgs, ... }:
{
  # gamescope
  boot.kernelPackages = pkgs.linuxPackages; # (this is the default) some amdgpu issues on 6.10
  programs = {
    steam = {
      enable = true;
      gamescopeSession.enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
    gamescope = {
      enable = true;
      capSysNice = true;
    };
  };
  # hardware.xone.enable = true; # support for the xbox controller USB dongle

  environment.systemPackages = with pkgs; [
    parsec-bin # remote streaming

    # game
    fflogs # uploader only
    mangohud # fps/perforance counter
    xivlauncher # FFXIV
    prismlauncher # minecraft launcher
  ];
}
