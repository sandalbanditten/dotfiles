#!/bin/sh
xsetroot -solid "#2e3440" -cursor_name left_ptr &
redshift -l 56.18:10.29 &
flameshot &
unclutter --timeout 5 --start-hidden --jitter 25 --ignore-scrolling &
dunst &
clipmenud &
discord &
export MONCOUNT="$(xrandr | rg " connected " | wc -l)"
# One monitor - Should always be run
xrandr --output DP-4 --primary --mode 2560x1600 --rate 165
# Four monitors
[ "$MONCOUNT" -eq 4 ] && xrandr --output DP-4 --primary --mode 2560x1600 --rate 165 --output DP-2 --above DP-4 --mode 2560x1440 --rate 144 --output DP-0 --left-of DP-2 --mode 1920x1080 --rate 240 --rotate right --output HDMI-0 --right-of DP-2 --mode 1920x1080 --rate 60 --rotate left
# Three monitors
[ "$MONCOUNT" -eq 3 ] && xrandr --output DP-4 --primary --mode 2560x1600 --rate 165 --output DP-2 --above DP-4 --mode 2560x1440 --rate 144 --output DP-0 --left-of DP-2 --mode 1920x1080 --rate 240 --rotate right
setxkbmap -layout us -option compose:caps &
exec bspwm
