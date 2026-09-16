kill process and reload

```bash
# pkill waybar && hyprctl dispatch exec waybar
pkill waybar && hyprctl dispatch 'hl.dsp.exec_cmd("waybar")'
```
