# Setup

There's a fair set of manual work since the gui is used. Since setup is universal, the only risk at the moment, is packages.

## Setup USB

Windows

- Used balenaEtcher to flash a USB with ISO

## Installer

Restart and boot into the USB.

1. Connect to _WIFI_
2. Select _Grub_ as bootloader
3. Default options for 3 pages
   - Default American English
   - Default New York timezone
   - Default keyboard
4. Select _Manual partitioning_
   - Efi
     - 2048 mib
     - Fat32
     - Label efi
     - /boot/efi
     - Flag boot
   - Swap
     - 69632 mib
     - Linuxswap
     - Flag swap
   - Root
     - 102400 mib
     - btrfs
     - Label root
     - /
   - Home
     - Rest of space
     - btrfs
     - Label home
     - /home
5. _WAIT_ until install is done but before restarting
   - Hyprland
   - Default packages. Should auto select the recommended and hyprland packages
   - Fill out account info
6. `mount -o subvolid=5 /dev/nvme1n1p3 /mnt`
   - Mounts the root drive at /mnt
   - makes sure this is not the /home partition. need access to root since that's where the snapshots are stored and fstab
   - `lsblk` can be used to list storage devices
7. Create subvolumes for extra dir in snapshot
   - `btrfs subvolume create /mnt/@var`
   - `btrfs subvolume create /mnt/@opt`
   - `btrfs subvolume create /mnt/@local`
   - `btrfs subvolume list /mnt`
8. Copy /var and /usr/local to subvolume.
   - `rsync -axHAX —info=progress2 /mnt/@/var/. /mnt/@var/`
   - `rsync -axHAX —info=progress2 /mnt/@/urs/local/. /mnt/@local/`
   - if this step fails, the wrong partition was mounted
9. Remove the old /ar and /usr/local since the system will refer to the subvolume
   - `rm -fr /mnt/@/var/*`
   - `rm -fr /mnt/@/usr/local/*`
10. edit fstab so the subvolumes are recognized by os
    - `vim /mnt/@/etc/fstab`
    - Should be missing /var /opt and /usr/local
    - Add them, copying /root and changing mount point and subvol=
    - /var, /@var
    - /opt, /@opt
    - /usr/local, /@local
11. `umount /mnt`
12. Reboot into OS

## Post installer + dual boot

While most things are setup, still need to setup snapper for snapshots and os-prober for dual boot

1. Login, Close welcome window, and open Terminal
2. enter sudo
   - `sudo -i`
3. Since snapper should be preinstall, active btrfs and snapper quota
   - `btrfs quota enable /`
   - `snapper setup-quota`
4. config snapper config for different limits
   - `vim /etc/snapper/configs/root`
   - Changed number limit to `2-50`
   - Changed number limit important to `4-20`
5. Restart the snapper service
   - `systemctl restart snapperd.service`
6. Edit Snap-pac config so that snapper auto adds a snapshot when pacman is run
   - `vim /etc/snap-pac.ini`
   - `[root]`
   - `important_packages = ["linux”, “linux-lts”, “nvidia”]`
   - `important_commands = [”pacman -Syu”, “packman -Syyu”]`
   - `userdata = [“important=no”]`
7. enable os-prober to add windows efi to bootloader
   - `vim /etc/default/grub`
   - Uncomment `GRUB_DISABLE_OS_PROBER=false`
   - `os-prober` checks that it detects the windows
8. `grub-mkconfig -o /boot/grub/grub.cfg`
   - This recreates the bootloader with os-probe and should add windows
9. Update packages
   - `pacman -Syu`
