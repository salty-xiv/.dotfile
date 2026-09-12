# Huion tablet

GT-156HD V2 - is older and not supported by offical drivers on linux

```bash
paru -S opentabletdriver

# Regenerate initramfs
sudo mkinitcpio -P

# Unload conflicting kernel modules
sudo rmmod wacom hid_uclogic

# Enable and start the user service
systemctl --user daemon-reload
systemctl --user enable opentabletdriver --now

```
