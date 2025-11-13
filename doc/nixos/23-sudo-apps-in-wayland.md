# sudo apps in wayland

There are issues with opening application with sudo in wayland because you lose something under the normal sudo command. need to add a flag so wayland can read the needed data and keep sudo

```bash
sudo -E gparted
```
