# updating packages

with flakes.lock all packages are pinned to the commit so they will not update until you update flake.lock

```bash
# update flake
nix flake update
```

```bash
# rubuild
nixos-rebuild switch
```
