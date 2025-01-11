{
  config,
  pkgs,
  lib,
  ...
}:

{
  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;
  boot.initrd.checkJournalingFS = false;

  # VirtualBox bugfix. remove in future if fixed
  services.xserver.videoDrivers = lib.mkForce [
    "vmware"
    "virtualbox"
    "modesetting"
  ];
  systemd.user.services =
    let
      vbox-client = desc: flags: {
        description = "VirtualBox Guest: ${desc}";
        wantedBy = [ "graphical-session.target" ];
        requires = [ "dev-vboxguest.device" ];
        after = [ "dev-vboxguest.device" ];
        unitConfig.ConditionVirtualization = "oracle";
        serviceConfig.ExecStart = "${config.boot.kernelPackages.virtualboxGuestAdditions}/bin/VBoxClient -fv ${flags}";
      };
    in
    {
      virtualbox-resize = vbox-client "Resize" "--vmsvga";
      virtualbox-clipboard = vbox-client "Clipboard" "--clipboard";
    };
  virtualisation.virtualbox.guest = {
    enable = true;
    #   x11 = true;
  };
  # VirtualBox bugfix END

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
}