# mounting storage

```bash
# mounting with udisksctl (needs sudo)
# doesn't work with ntfs
udisksctl mount -b /dev/sda1
```

```bash
# list current drives and partitions
lsblk -f
```
