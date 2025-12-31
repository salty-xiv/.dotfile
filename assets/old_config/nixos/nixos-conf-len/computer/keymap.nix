{ config, pkgs, ... }:
{
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Optional: Apply keymap to the virtual console (TTY)
  console.useXkbConfig = true;

}
