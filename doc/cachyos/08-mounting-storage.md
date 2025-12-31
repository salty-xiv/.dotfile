# Cachyos auto mounting storage

https://wiki.cachyos.org/configuration/automount_with_fstab/
Need to add drives to fstab so it will auto mount.

```bash
# list UUID of partitions (should be enough)
lsblk -f
# alt way to list partitions
sudo fdisk -l
```

```bash
# need folders premade
sudo mkdir -p /mnt/ssd1
sudo mkdir -p /mnt/storage
```

```bash
# open fstab
sudo nvim /etc/fstab

# example line to add. first 3 items are straight forward. see cachyos wiki for explain of options
# note that ext4 options are different then exfat
# UUID=XXXXXX     /mnt/ssd1      exfat   defaults,nofail,uid=1000,gid=1000,rw,user,exec,umask=000 0 0
# UUID=XXXXXX     /mnt/storage   ext4    defaults,nofail,rw,user,relatime, 0 0

```

# manual mounting storage

```bash
# mounting with udisksctl (needs sudo)
# doesn't work with ntfs
udisksctl mount -b /dev/sda1
```
