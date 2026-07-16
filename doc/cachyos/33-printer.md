# Printer

```bash
# cnijfilter2 # printer drivers
# scangearmp2 # printer drivers
paru -S cnijfilter2 scangearmp2
```

```bash
# packages for Cups
sudo pacman -S cups system-config-printer gutenprint foomatic-db-engine
sudo systemctl enable --now cups.service
```

http://localhost:631
