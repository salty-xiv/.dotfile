# Cloudflare Warp

Notes: used this to help traffic ffxiv around the bad node that was causing ddos

```bash
# cloudflare-warp-bin # vpn like solution to redirect network
sudo pacman -S cloudflare-warp-bin
sudo systemctl enable warp-svc.service --now

# to ensure warp is running at boot and now
warp-cli registration new
```

```bash
# cloudflare-warp-panel # gui for cloudflare-warp-bin
paru -S cloudflare-warp-panel

# disable analytics
dart --disable-analytics
flutter --disable-analytics
```
