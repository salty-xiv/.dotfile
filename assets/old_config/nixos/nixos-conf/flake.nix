{
  description = "Salty's nixos";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs =
    {
      self,
      nixpkgs,
      ...
    }:
    {
      nixosConfigurations.nixos-salty = nixpkgs.lib.nixosSystem {
        modules = [
          ./nixos/configuration.nix
          ./computer
          ./config
        ];
      };
    };
}
