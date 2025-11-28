# Nix-shell

add a shell.nix to root of project. use `nix-shell` to active nix-shell. see example for package and unfree

```nix
{
  pkgs ? import <nixpkgs> {
    config.allowUnfree = true;
  },
}:

pkgs.mkShell {
  name = "dotnet-env";
  buildInputs = with pkgs; [
    dotnet-sdk_8
    vscode
  ];
}
```
