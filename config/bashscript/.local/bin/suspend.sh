#!/usr/bin/env bash
# the script does the following:
#   timeout XX ' swaylock ' \
#     turn off monitors
#
#   timeout XX ' hyprctl dispatch dpms off' \
#
#   timeout XX 'systemctl suspend' \
#
#
hyprlock \
timeout 2400 ' hyprlock ' \
timeout 2300 ' hyprctl dispatch dpms off' \
resume ' hyprctl dispatch dpms on' \
timeout 12000 'systemctl suspend' \
before-sleep 'hyprlock'
