#!/bin/bash
~/.fehbg &
pkill -9 cbatticon
pkill -9 pa-applet
pkill -9 udiskie
pkill -9 megasync
xset +fp /home/ladyscream/.local/share/fonts
xset fp rehash
xinput set-prop 'SynPS/2 Synaptics TouchPad' 305 0 &
slstatus &
megasync &
pa-applet &
nm-applet &
cbatticon -c "systemctl hibernate" &
setxkbmap -option compose:ralt &
unclutter --timeout 3 &
compton -b
udiskie --tray &
dunst &
betterlockscreen -u ~/.lockscreen.png &
