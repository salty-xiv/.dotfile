{
  description = "Salty's Lenovo nixos";

  inputs = {
    # nixpkgs
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs =
    {
      self,
      nixpkgs,
      ...
    }:
    {
      nixosConfigurations.nixos-len = nixpkgs.lib.nixosSystem {
        modules = [
          ./nixos/configuration.nix
          ../nixos-conf/computer/fonts-cursor.nix
          # ../nixos-conf/computer/gpu.nix # unneeded as nixos-hardware is used
          ../nixos-conf/computer/keymap.nix
          # ../nixos-conf/computer/network.nix # hostname is different
          ./computer/network.nix
          ../nixos-conf/computer/printer.nix
          ../nixos-conf/computer/sound.nix
          ../nixos-conf/computer/timezone-locale.nix
          # ../nixos-conf/computer/udev.nix # is only used for portable external oryx keeb
          # ../nixos-conf/computer/user.nix # user is different
          ./computer/user.nix
          ../nixos-conf/config/browser.nix
          ../nixos-conf/config/games.nix
          ../nixos-conf/config/hyprland.nix
          ../nixos-conf/config/keepassxc.nix
          ../nixos-conf/config/music.nix
          ../nixos-conf/config/neovim.nix
          # ../nixos-conf/config/obs.nix
          # ../nixos-conf/config/packages.nix
          ../nixos-conf/config/programs.nix
          ../nixos-conf/config/shell.nix
          ../nixos-conf/config/social-media.nix
          ../nixos-conf/config/util.nix
        ];
      };
    };
}
