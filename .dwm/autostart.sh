#!/bin/bash
~/.fehbg &
pkill -9 cbatticon
pkill -9 pa-applet
pkill -9 megasync
xset +fp /home/ladyscream/.local/share/fonts
xset fp rehash
xinput set-prop 'SynPS/2 Synaptics TouchPad' 292 0 &
slstatus &
megasync &
pa-applet &
nm-applet &
cbatticon &
setxkbmap -option compose:ralt &
unclutter --timeout 3 &
compton &
transmission-daemon &
~/.flexget/bin/flexget daemon start -d &
thunderbird &
play-with-mpv &
betterlockscreen -u ~/.lockscreen.png &
